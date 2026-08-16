`timescale 1ns/1ps
`default_nettype none

module timegen (
    input  wire clock,
    input  wire reset,
    input  wire reset_count,
    input  wire fastwatch,
    output reg  one_second,
    output reg  one_minute
);

    reg [13:0] count;
    reg        one_minute_reg;

    always @(posedge clock or posedge reset) begin
        if (reset) begin
            count          <= 14'd0;
            one_minute_reg <= 1'b0;
        end else if (reset_count) begin
            count          <= 14'd0;
            one_minute_reg <= 1'b0;
        end else if (count == 14'd15359) begin
            count          <= 14'd0;
            one_minute_reg <= 1'b1;
        end else begin
            count          <= count + 14'd1;
            one_minute_reg <= 1'b0;
        end
    end

    always @(posedge clock or posedge reset) begin
        if (reset) begin
            one_second <= 1'b0;
        end else if (reset_count) begin
            one_second <= 1'b0;
        end else if (count[7:0] == 8'd255) begin
            one_second <= 1'b1;
        end else begin
            one_second <= 1'b0;
        end
    end

    always @* begin
        if (fastwatch)
            one_minute = one_second;
        else
            one_minute = one_minute_reg;
    end

endmodule

`default_nettype wire
