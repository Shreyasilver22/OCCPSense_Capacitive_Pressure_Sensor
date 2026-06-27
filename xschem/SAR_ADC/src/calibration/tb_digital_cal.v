`timescale 1ns/1ps

module tb_digital_cal;

    parameter N = 10;

    reg clk;
    reg rst_n;
    reg [N-1:0] raw_result;
    reg valid_in;
    reg [N-1:0] offset;
    
    wire [N-1:0] cal_result;
    wire valid_out;

    // Instantiate digital_cal
    digital_cal #(.N(N)) uut (
        .clk(clk),
        .rst_n(rst_n),
        .raw_result(raw_result),
        .valid_in(valid_in),
        .offset(offset),
        .cal_result(cal_result),
        .valid_out(valid_out)
    );

    // 10ns clock
    always #5 clk = ~clk;

    // Task to run a single test case
    task test_case(input [N-1:0] test_raw, input [N-1:0] test_offset, input [N-1:0] expected);
    begin
        raw_result = test_raw;
        offset = test_offset;
        
        // Pulse valid_in for one clock cycle
        @(negedge clk);
        valid_in = 1'b1;
        @(negedge clk);
        valid_in = 1'b0;

        // Wait for valid_out
        wait(valid_out == 1'b1);
        @(negedge clk);

        $display("Test: raw=%d, offset=%d -> cal=%d (Expected: %d)", test_raw, test_offset, cal_result, expected);
        if (cal_result !== expected)
            $display("  [ERROR] Mismatch!");
        else
            $display("  [PASS]");
        
        #20;
    end
    endtask

    initial begin
        $dumpfile("sim/tb_digital_cal.vcd");
        $dumpvars(0, tb_digital_cal);

        // Initialize
        clk = 0;
        rst_n = 0;
        raw_result = 0;
        valid_in = 0;
        offset = 0;

        // Reset
        #20 rst_n = 1;
        #10;

        // Case 1: raw_result=100, offset=10 -> expected 110
        test_case(10'd100, 10'd10, 10'd110);

        // Case 2: raw_result=1020, offset=10 -> expected clamped to 1023
        test_case(10'd1020, 10'd10, 10'd1023);

        // Case 3: raw_result=0, offset=0 -> expected 0
        test_case(10'd0, 10'd0, 10'd0);

        #50;
        $finish;
    end

endmodule
