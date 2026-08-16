`timescale 1ns/1ps
`default_nettype none

module tb_alarm_clock_compare;

    ////////////////////////////////////////////////////////////////////////////
    // DUT ports
    ////////////////////////////////////////////////////////////////////////////

    logic        clock;
    logic [3:0]  key;
    logic        reset;
    logic        time_button;
    logic        alarm_button;
    logic        fastwatch;

    wire [7:0]   ms_hour;
    wire [7:0]   ls_hour;
    wire [7:0]   ms_minute;
    wire [7:0]   ls_minute;
    wire         alarm_sound;

    ////////////////////////////////////////////////////////////////////////////
    // Constants
    ////////////////////////////////////////////////////////////////////////////

    localparam [3:0] NOKEY = 4'd10;

    localparam [7:0] ASCII_0     = 8'h30;
    localparam [7:0] ASCII_1     = 8'h31;
    localparam [7:0] ASCII_2     = 8'h32;
    localparam [7:0] ASCII_3     = 8'h33;
    localparam [7:0] ASCII_4     = 8'h34;
    localparam [7:0] ASCII_5     = 8'h35;
    localparam [7:0] ASCII_6     = 8'h36;
    localparam [7:0] ASCII_7     = 8'h37;
    localparam [7:0] ASCII_8     = 8'h38;
    localparam [7:0] ASCII_9     = 8'h39;
    localparam [7:0] ASCII_ERROR = 8'h3A;

    ////////////////////////////////////////////////////////////////////////////
    // DUT instance
    ////////////////////////////////////////////////////////////////////////////

    alarm_clock_top dut (
        .clock        (clock),
        .key          (key),
        .reset        (reset),
        .time_button  (time_button),
        .alarm_button (alarm_button),
        .fastwatch    (fastwatch),
        .ms_hour      (ms_hour),
        .ls_hour      (ls_hour),
        .ms_minute    (ms_minute),
        .ls_minute    (ls_minute),
        .alarm_sound  (alarm_sound)
    );

    ////////////////////////////////////////////////////////////////////////////
    // Clock generation
    ////////////////////////////////////////////////////////////////////////////

    initial begin
        clock = 1'b0;
        forever #5 clock = ~clock;
    end

    ////////////////////////////////////////////////////////////////////////////
    // Helper functions
    ////////////////////////////////////////////////////////////////////////////

    function automatic [7:0] ascii_digit(input [3:0] d);
        begin
            case (d)
                4'd0:    ascii_digit = ASCII_0;
                4'd1:    ascii_digit = ASCII_1;
                4'd2:    ascii_digit = ASCII_2;
                4'd3:    ascii_digit = ASCII_3;
                4'd4:    ascii_digit = ASCII_4;
                4'd5:    ascii_digit = ASCII_5;
                4'd6:    ascii_digit = ASCII_6;
                4'd7:    ascii_digit = ASCII_7;
                4'd8:    ascii_digit = ASCII_8;
                4'd9:    ascii_digit = ASCII_9;
                default: ascii_digit = ASCII_ERROR;
            endcase
        end
    endfunction

    ////////////////////////////////////////////////////////////////////////////
    // Helper tasks
    ////////////////////////////////////////////////////////////////////////////

    task automatic wait_clks(input int n);
        int i;
        begin
            for (i = 0; i < n; i++) begin
                @(posedge clock);
            end
            #1;
        end
    endtask

    task automatic apply_reset;
        begin
            @(negedge clock);

            reset        = 1'b1;
            key          = NOKEY;
            time_button  = 1'b0;
            alarm_button = 1'b0;
            fastwatch    = 1'b0;

            wait_clks(6);

            @(negedge clock);
            reset = 1'b0;

            wait_clks(6);
        end
    endtask

    task automatic expect_display(
        input [3:0] h10,
        input [3:0] h1,
        input [3:0] m10,
        input [3:0] m1,
        input string test_name
    );
        reg [31:0] actual;
        reg [31:0] expected;
        begin
            actual = {
                ms_hour,
                ls_hour,
                ms_minute,
                ls_minute
            };

            expected = {
                ascii_digit(h10),
                ascii_digit(h1),
                ascii_digit(m10),
                ascii_digit(m1)
            };

            if (actual !== expected) begin
                $display("ERROR: %s", test_name);
                $display("       actual display   hex=%h  bytes=%h %h %h %h",
                         actual, ms_hour, ls_hour, ms_minute, ls_minute);
                $display("       expected display hex=%h  bytes=%h %h %h %h",
                         expected,
                         ascii_digit(h10),
                         ascii_digit(h1),
                         ascii_digit(m10),
                         ascii_digit(m1));
                $display("       time=%0t", $time);
                $fatal;
            end else begin
                $display("PASS : %-55s display_hex=%h time=%0t",
                         test_name, actual, $time);
            end
        end
    endtask

    task automatic expect_alarm(
        input bit expected_alarm,
        input string test_name
    );
        begin
            if (alarm_sound !== expected_alarm) begin
                $display("ERROR: %s", test_name);
                $display("       alarm_sound actual=%b expected=%b time=%0t",
                         alarm_sound, expected_alarm, $time);
                $fatal;
            end else begin
                $display("PASS : %-55s alarm_sound=%b time=%0t",
                         test_name, alarm_sound, $time);
            end
        end
    endtask

    task automatic wait_until_display(
        input [3:0] h10,
        input [3:0] h1,
        input [3:0] m10,
        input [3:0] m1,
        input int max_cycles,
        input string test_name
    );
        reg [31:0] actual;
        reg [31:0] expected;
        int i;
        begin
            expected = {
                ascii_digit(h10),
                ascii_digit(h1),
                ascii_digit(m10),
                ascii_digit(m1)
            };

            for (i = 0; i < max_cycles; i++) begin
                actual = {
                    ms_hour,
                    ls_hour,
                    ms_minute,
                    ls_minute
                };

                if (actual === expected) begin
                    $display("PASS : %-55s display_hex=%h reached_after=%0d cycles time=%0t",
                             test_name, actual, i, $time);
                    return;
                end

                wait_clks(1);
            end

            actual = {
                ms_hour,
                ls_hour,
                ms_minute,
                ls_minute
            };

            $display("ERROR: timeout waiting for display: %s", test_name);
            $display("       actual display   hex=%h", actual);
            $display("       expected display hex=%h", expected);
            $display("       time=%0t", $time);
            $fatal;
        end
    endtask

    ////////////////////////////////////////////////////////////////////////////
    // Key/FSM helper tasks
    ////////////////////////////////////////////////////////////////////////////

    task automatic press_key(input [3:0] digit);
        begin
            @(negedge clock);
            key = digit;

            // SHOW_TIME or KEY_ENTRY -> KEY_STORED.
            // On the next clock, keyreg sees shift asserted and stores the key.
            wait_clks(2);

            @(negedge clock);
            key = NOKEY;

            // KEY_WAITED -> KEY_ENTRY after key release.
            wait_clks(2);
        end
    endtask

    task automatic enter_digits(
        input [3:0] d3,
        input [3:0] d2,
        input [3:0] d1,
        input [3:0] d0
    );
        begin
            press_key(d3);
            press_key(d2);
            press_key(d1);
            press_key(d0);
        end
    endtask

    task automatic load_current_time;
        begin
            @(negedge clock);
            time_button = 1'b1;

            // FSM moves to SET_CURRENT_TIME and counter loads key buffer.
            wait_clks(3);

            @(negedge clock);
            time_button = 1'b0;

            wait_clks(3);
        end
    endtask

    task automatic load_alarm_time;
        begin
            @(negedge clock);
            alarm_button = 1'b1;

            // FSM moves to SET_ALARM_TIME and alarm_reg loads key buffer.
            wait_clks(3);

            @(negedge clock);
            alarm_button = 1'b0;

            wait_clks(3);
        end
    endtask

    task automatic show_alarm_time(
        input [3:0] h10,
        input [3:0] h1,
        input [3:0] m10,
        input [3:0] m1
    );
        begin
            @(negedge clock);
            alarm_button = 1'b1;

            wait_clks(3);

            expect_display(h10, h1, m10, m1, "show alarm time using alarm_button");

            @(negedge clock);
            alarm_button = 1'b0;

            wait_clks(3);
        end
    endtask

    ////////////////////////////////////////////////////////////////////////////
    // Main test sequence
    ////////////////////////////////////////////////////////////////////////////

    initial begin
        ////////////////////////////////////////////////////////////////////////////
        // DVE waveform dump
        ////////////////////////////////////////////////////////////////////////////

        $vcdplusfile("alarm_clock_compare.vpd");
        $vcdpluson(0, tb_alarm_clock_compare);

        $display("============================================================");
        $display("Alarm Clock self-checking testbench started");
        $display("============================================================");

        reset        = 1'b0;
        key          = NOKEY;
        time_button  = 1'b0;
        alarm_button = 1'b0;
        fastwatch    = 1'b0;

        ////////////////////////////////////////////////////////////////////////////
        // TEST 1: Reset behavior
        ////////////////////////////////////////////////////////////////////////////

        apply_reset();

        expect_display(4'd0, 4'd0, 4'd0, 4'd0, "reset display should be 00:00");

        // Current time and alarm time both reset to 00:00, so alarm is high.
        expect_alarm(1'b1, "alarm high after reset because current=alarm=00:00");

        ////////////////////////////////////////////////////////////////////////////
        // TEST 2: Key shifting and current-time load
        ////////////////////////////////////////////////////////////////////////////

        enter_digits(4'd1, 4'd2, 4'd3, 4'd4);

        expect_display(4'd1, 4'd2, 4'd3, 4'd4, "key buffer entry 12:34");

        load_current_time();

        expect_display(4'd1, 4'd2, 4'd3, 4'd4, "load current time 12:34");
        expect_alarm(1'b0, "alarm low when current time differs from reset alarm");

        ////////////////////////////////////////////////////////////////////////////
        // TEST 3: Normal counting without fastwatch
        //
        // timegen creates one_minute after 15360 clock cycles.
        ////////////////////////////////////////////////////////////////////////////

        apply_reset();

        fastwatch = 1'b0;

        wait_until_display(
            4'd0, 4'd0, 4'd0, 4'd1,
            16000,
            "normal mode 00:00 -> 00:01"
        );

        expect_alarm(1'b0, "alarm low after normal count moves current away from alarm");

        ////////////////////////////////////////////////////////////////////////////
        // TEST 4: Fastwatch simple increment
        ////////////////////////////////////////////////////////////////////////////

        apply_reset();

        enter_digits(4'd0, 4'd0, 4'd1, 4'd2);
        load_current_time();

        expect_display(4'd0, 4'd0, 4'd1, 4'd2, "load current time 00:12");

        fastwatch = 1'b1;

        wait_until_display(
            4'd0, 4'd0, 4'd1, 4'd3,
            600,
            "fastwatch 00:12 -> 00:13"
        );

        fastwatch = 1'b0;

        ////////////////////////////////////////////////////////////////////////////
        // TEST 5: 09:59 -> 10:00 rollover
        ////////////////////////////////////////////////////////////////////////////

        apply_reset();

        enter_digits(4'd0, 4'd9, 4'd5, 4'd9);
        load_current_time();

        expect_display(4'd0, 4'd9, 4'd5, 4'd9, "load current time 09:59");

        fastwatch = 1'b1;

        wait_until_display(
            4'd1, 4'd0, 4'd0, 4'd0,
            600,
            "fastwatch 09:59 -> 10:00"
        );

        fastwatch = 1'b0;

        ////////////////////////////////////////////////////////////////////////////
        // TEST 6: 23:59 -> 00:00 rollover
        ////////////////////////////////////////////////////////////////////////////

        apply_reset();

        enter_digits(4'd2, 4'd3, 4'd5, 4'd9);
        load_current_time();

        expect_display(4'd2, 4'd3, 4'd5, 4'd9, "load current time 23:59");

        fastwatch = 1'b1;

        wait_until_display(
            4'd0, 4'd0, 4'd0, 4'd0,
            600,
            "fastwatch 23:59 -> 00:00"
        );

        expect_alarm(1'b1, "alarm high after rollover to reset alarm 00:00");

        fastwatch = 1'b0;

        ////////////////////////////////////////////////////////////////////////////
        // TEST 7: Alarm load and alarm trigger
        ////////////////////////////////////////////////////////////////////////////

        apply_reset();

        // Load alarm = 00:02
        enter_digits(4'd0, 4'd0, 4'd0, 4'd2);
        load_alarm_time();

        // Load current = 00:00
        enter_digits(4'd0, 4'd0, 4'd0, 4'd0);
        load_current_time();

        expect_display(4'd0, 4'd0, 4'd0, 4'd0, "load current 00:00 after alarm set 00:02");
        expect_alarm(1'b0, "alarm low because current 00:00 != alarm 00:02");

        fastwatch = 1'b1;

        wait_until_display(
            4'd0, 4'd0, 4'd0, 4'd2,
            1200,
            "fastwatch reaches alarm time 00:02"
        );

        expect_alarm(1'b1, "alarm high when current equals alarm 00:02");

        ////////////////////////////////////////////////////////////////////////////
        // TEST 8: Show alarm display path
        ////////////////////////////////////////////////////////////////////////////

        wait_until_display(
            4'd0, 4'd0, 4'd0, 4'd3,
            600,
            "fastwatch current moves to 00:03"
        );

        expect_alarm(1'b0, "alarm low after current 00:03 != alarm 00:02");

        fastwatch = 1'b0;

        show_alarm_time(4'd0, 4'd0, 4'd0, 4'd2);

        ////////////////////////////////////////////////////////////////////////////
        // TEST 9: Key-entry timeout
        ////////////////////////////////////////////////////////////////////////////

        apply_reset();

        enter_digits(4'd5, 4'd6, 4'd7, 4'd8);

        expect_display(4'd5, 4'd6, 4'd7, 4'd8, "key buffer entry 56:78 before timeout");

        // Wait longer than ten one_second pulses.
        wait_clks(3200);

        expect_display(4'd0, 4'd0, 4'd0, 4'd0, "key-entry timeout returns to current time");

        ////////////////////////////////////////////////////////////////////////////
        // TEST 10: Invalid key display decode
        ////////////////////////////////////////////////////////////////////////////

        apply_reset();

        press_key(4'd11);

        if (ls_minute !== ASCII_ERROR) begin
            $display("ERROR: invalid key display decode failed");
            $display("       ls_minute actual=%h expected=%h", ls_minute, ASCII_ERROR);
            $fatal;
        end else begin
            $display("PASS : invalid key display decode gives ERROR character 8'h3A");
        end

        ////////////////////////////////////////////////////////////////////////////
        // End
        ////////////////////////////////////////////////////////////////////////////

        $display("============================================================");
        $display("ALL ALARM CLOCK TESTS PASSED");
        $display("============================================================");

        $finish;
    end

endmodule

`default_nettype wire
