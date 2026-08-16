`timescale 1ns/1ps
`default_nettype none

module fsm (
    input  wire       clock,
    input  wire       reset,
    input  wire       one_second,
    input  wire       time_button,
    input  wire       alarm_button,
    input  wire [3:0] key,
    output wire       reset_count,
    output wire       load_new_a,
    output wire       show_a,
    output wire       show_new_time,
    output wire       load_new_c,
    output wire       shift
);

    reg [2:0] pre_state, next_state;
    wire      time_out;
    reg [3:0] count1, count2;

    localparam [2:0] SHOW_TIME        = 3'b000;
    localparam [2:0] KEY_ENTRY        = 3'b001;
    localparam [2:0] KEY_STORED       = 3'b010;
    localparam [2:0] SHOW_ALARM       = 3'b011;
    localparam [2:0] SET_ALARM_TIME   = 3'b100;
    localparam [2:0] SET_CURRENT_TIME = 3'b101;
    localparam [2:0] KEY_WAITED       = 3'b110;
    localparam [3:0] NOKEY            = 4'd10;

    always @(posedge clock or posedge reset) begin
        if (reset)
            count1 <= 4'd0;
        else if (pre_state != KEY_ENTRY)
            count1 <= 4'd0;
        else if (count1 == 4'd9)
            count1 <= 4'd0;
        else if (one_second)
            count1 <= count1 + 4'd1;
    end

    always @(posedge clock or posedge reset) begin
        if (reset)
            count2 <= 4'd0;
        else if (pre_state != KEY_WAITED)
            count2 <= 4'd0;
        else if (count2 == 4'd9)
            count2 <= 4'd0;
        else if (one_second)
            count2 <= count2 + 4'd1;
    end

    assign time_out = ((count1 == 4'd9) || (count2 == 4'd9)) ? 1'b0 : 1'b1;

    always @(posedge clock or posedge reset) begin
        if (reset)
            pre_state <= SHOW_TIME;
        else
            pre_state <= next_state;
    end

    always @* begin
        case (pre_state)
            SHOW_TIME: begin
                if (alarm_button)
                    next_state = SHOW_ALARM;
                else if (key != NOKEY)
                    next_state = KEY_STORED;
                else
                    next_state = SHOW_TIME;
            end

            KEY_STORED: begin
                next_state = KEY_WAITED;
            end

            KEY_WAITED: begin
                if (key == NOKEY)
                    next_state = KEY_ENTRY;
                else if (time_out == 1'b0)
                    next_state = SHOW_TIME;
                else
                    next_state = KEY_WAITED;
            end

            KEY_ENTRY: begin
                if (alarm_button)
                    next_state = SET_ALARM_TIME;
                else if (time_button)
                    next_state = SET_CURRENT_TIME;
                else if (time_out == 1'b0)
                    next_state = SHOW_TIME;
                else if (key != NOKEY)
                    next_state = KEY_STORED;
                else
                    next_state = KEY_ENTRY;
            end

            SHOW_ALARM: begin
                if (!alarm_button)
                    next_state = SHOW_TIME;
                else
                    next_state = SHOW_ALARM;
            end

            SET_ALARM_TIME: begin
                next_state = SHOW_TIME;
            end

            SET_CURRENT_TIME: begin
                next_state = SHOW_TIME;
            end

            default: begin
                next_state = SHOW_TIME;
            end
        endcase
    end

    assign show_new_time = (pre_state == KEY_ENTRY)  ||
                           (pre_state == KEY_STORED) ||
                           (pre_state == KEY_WAITED);

    assign show_a        = (pre_state == SHOW_ALARM);
    assign load_new_a    = (pre_state == SET_ALARM_TIME);
    assign load_new_c    = (pre_state == SET_CURRENT_TIME);
    assign reset_count   = (pre_state == SET_CURRENT_TIME);
    assign shift         = (pre_state == KEY_STORED);

endmodule

`default_nettype wire
