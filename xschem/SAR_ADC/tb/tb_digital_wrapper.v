`timescale 1ns/1ps
`include "../src/sar_fsm/sar_fsm.v"
`include "../src/spi/spi_slave.v"
`include "../src/calibration/digital_cal.v"
`include "../src/sar_fsm/digital_wrapper.v"

module tb_digital_wrapper;

    localparam integer N    = 10;
    localparam integer CTOT = 1024;      // unit caps per side (incl. weights, excl. dummy)
    localparam real    VREF = 1.65;      // bottom-plate step vcm->vrefp
    localparam real    LSB  = 3.3/1024.0;
    
    reg clk = 1'b0;
    reg rst_n;
    reg start;
    wire comp_in;
    
    reg sclk;
    reg cs_n;
    reg mosi;
    wire miso;
    
    wire bp9, bp8, bp7, bp6, bp5, bp4, bp3, bp2, bp1, bp0;
    wire bn9, bn8, bn7, bn6, bn5, bn4, bn3, bn2, bn1, bn0;
    wire bist_en;

    // Assemble buses for the CDAC behavioral loop
    wire [N-1:0] bp_bus = {bp9, bp8, bp7, bp6, bp5, bp4, bp3, bp2, bp1, bp0};
    wire [N-1:0] bn_bus = {bn9, bn8, bn7, bn6, bn5, bn4, bn3, bn2, bn1, bn0};

    real vdiff_in;
    real vdiff_cdac;
    
    // Instantiate DUT (Digital Wrapper)
    digital_wrapper #(.N(N), .INVERT_COMP(1'b0)) uut (
        .clk(clk),
        .rst_n(rst_n),
        .start(start),
        .comp_in(comp_in),
        
        .sclk(sclk),
        .cs_n(cs_n),
        .mosi(mosi),
        .miso(miso),
        
        .bp9(bp9), .bp8(bp8), .bp7(bp7), .bp6(bp6), .bp5(bp5),
        .bp4(bp4), .bp3(bp3), .bp2(bp2), .bp1(bp1), .bp0(bp0),
        
        .bn9(bn9), .bn8(bn8), .bn7(bn7), .bn6(bn6), .bn5(bn5),
        .bn4(bn4), .bn3(bn3), .bn2(bn2), .bn1(bn1), .bn0(bn0),
        
        .bist_en(bist_en)
    );

    // ---- Behavioral CDAC + comparator ---------------------------------------
    integer k;
    always @(*) begin
        vdiff_cdac = vdiff_in;
        for (k = 0; k < N; k = k + 1)
            vdiff_cdac = vdiff_cdac
                       + (VREF/CTOT) * (1 << k) * ( (bp_bus[k] ? 1 : 0) - (bn_bus[k] ? 1 : 0) );
    end
    assign comp_in = (vdiff_cdac > 0.0) ? 1'b1 : 1'b0;

    // 10ns clock
    always #5 clk = ~clk;

    // SPI read task
    task spi_read;
        output reg [N-1:0] received;
        integer i;
        begin
            received = 0;
            cs_n = 0;
            #10;
            for (i = N-1; i >= 0; i = i - 1) begin
                sclk = 1'b1; #10;
                received[i] = miso;
                sclk = 1'b0; #10;
            end
            cs_n = 1;
        end
    endtask

    reg [N-1:0] spi_result;
    
    initial begin
        $dumpfile("sim/tb_digital_wrapper.vcd");
        $dumpvars(0, tb_digital_wrapper);

        // Initialize signals
        clk = 0;
        sclk = 0;
        cs_n = 1;
        mosi = 0;

        rst_n = 1'b0; start = 1'b0;
        repeat(4) @(negedge clk);
        rst_n = 1'b1;
        @(negedge clk);
        vdiff_in = 0.5;
        @(negedge clk); start = 1'b1;
        @(negedge clk); start = 1'b0;

        // Wait for the calibration valid signal inside the wrapper
        $display("Waiting for SAR valid...");
        wait(uut.u_cal.valid_out == 1'b1);
        @(negedge clk);

        // Perform SPI readout
        spi_read(spi_result);

        // Compare and Display Output
        $display("==================================================");
        $display("VDIFF_IN          : %f V", vdiff_in);
        $display("Internal Cal Code : %d (Binary: %b)", uut.u_cal.cal_result, uut.u_cal.cal_result);
        $display("SPI Received Code : %d (Binary: %b)", spi_result, spi_result);
        $display("==================================================");
        
        if (spi_result !== uut.u_cal.cal_result)
            $display("  [ERROR] SPI read result does not match internal result!");
        else
            $display("  [PASS] SPI read result matches internal result perfectly.");
        
        $display("==================================================");

        #50 $finish;
    end

endmodule
