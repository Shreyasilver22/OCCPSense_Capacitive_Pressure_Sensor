`timescale 1ns/1ps

module tb_sar_ctrl;

    // inputs driven by testbench
    reg clk, rst_n, start;
    reg comp_in;
    
    // outputs from your FSM
    wire [7:0] dac_ctrl;
    wire [7:0] result;
    wire valid;

    // instantiate your module
    sar_ctrl uut (
        .clk(clk),
        .rst_n(rst_n),
        .start(start),
        .comp_in(comp_in),
        .dac_ctrl(dac_ctrl),
        .result(result),
        .valid(valid)
    );

    // 10ns clock
    always #5 clk = ~clk;

    // mock comparator — simulates Vin = 1.65V (code 127)
    real vin = 1.65;
    real vref = 3.3;
    always @(dac_ctrl)
        comp_in = (vin > (dac_ctrl / 255.0 * vref));

    initial begin
        clk = 0; rst_n = 0; start = 0;
        #20 rst_n = 1;
        #10 start = 1;
        #10 start = 0;
        
        // wait for valid
        wait(valid == 1);
        $display("Result: %d (expected ~127)", result);
        
        #20 $finish;
    end

    initial begin
        $dumpfile("tb_sar_ctrl.vcd");
        $dumpvars(0, tb_sar_ctrl);
    end

endmodule