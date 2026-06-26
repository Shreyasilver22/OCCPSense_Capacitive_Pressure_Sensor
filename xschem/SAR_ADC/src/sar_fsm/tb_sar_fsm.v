`timescale 1ns/1ps
//-----------------------------------------------------------------------------
// Behavioral closed-loop TB for the monotonic 10-bit SAR controller.
//   CDAC + comparator modeled in real arithmetic, in the loop with the RTL.
//   vcp-vcn = VDIFF + (VREF/1024) * sum_i 2^i*(bp[i]-bn[i])
//   FS = +/-1.65 V , LSB = 3.3/1024 = 3.2227 mV (cap[bit_idx] / full-range scheme)
//-----------------------------------------------------------------------------
module tb_sar_logic;

    localparam integer N    = 10;
    localparam integer CTOT = 1024;      // unit caps per side (incl. weights, excl. dummy)
    localparam real    VREF = 1.65;      // bottom-plate step vcm->vrefp
    localparam real    LSB  = 3.3/1024.0;

    reg              clk = 1'b0;
    reg              rst_n;
    reg              start;
    reg  [N-1:0]     bp, bn, code;
    wire [N-1:0]     bp_w, bn_w, code_w;
    wire             sample, comp_clk, busy, valid;

    // Swept analog input (differential), volts.
    real             vdiff_in;
    real             vdiff_cdac;
    reg              comp;

    // ---- DUT -----------------------------------------------------------------
    sar_logic #(.N(N), .SAMPLE_CYCLES(4), .DAC_SETTLE_CYCLES(3)) dut (
        .clk(clk), .rst_n(rst_n), .start(start), .comp(comp),
        .sample(sample), .comp_clk(comp_clk), .busy(busy), .valid(valid),
        .bp(bp_w), .bn(bn_w), .code(code_w)
    );

    always @(*) begin bp = bp_w; bn = bn_w; code = code_w; end

    // ---- Behavioral CDAC + comparator ---------------------------------------
    integer k;
    always @(*) begin
        vdiff_cdac = vdiff_in;
        for (k = 0; k < N; k = k + 1)
            vdiff_cdac = vdiff_cdac
                       + (VREF/CTOT) * (1 << k) * ( (bp[k] ? 1 : 0) - (bn[k] ? 1 : 0) );
    end
    always @(*) comp = (vdiff_cdac > 0.0) ? 1'b1 : 1'b0;

    always #5 clk = ~clk;     // 100 MHz

    // ---- One conversion ------------------------------------------------------
    task run_conv(input real vin, output reg [N-1:0] result);
    begin
        vdiff_in = vin;
        @(negedge clk); start = 1'b1;
        @(negedge clk); start = 1'b0;
        wait (valid == 1'b1);
        @(negedge clk);
        result = code;
    end
    endtask

    // ---- Stimulus / checks ---------------------------------------------------
    integer        i, fails, miss;
    reg [N-1:0]    c, c_prev;
    real           vin;

    initial begin
        $dumpfile("tb_sar_logic.vcd");
        $dumpvars(0, tb_sar_logic);

        rst_n = 1'b0; start = 1'b0; vdiff_in = 0.0;
        repeat (4) @(negedge clk);
        rst_n = 1'b1;
        @(negedge clk);

        // ---- Spot checks --------------------------------------------------
        $display("VDIFF(V)      code");
        run_conv(-0.020, c); $display("%9.4f   %0d", -0.020, c);
        run_conv(-0.005, c); $display("%9.4f   %0d", -0.005, c);
        run_conv( 0.000, c); $display("%9.4f   %0d",  0.000, c);
        run_conv( 0.005, c); $display("%9.4f   %0d",  0.005, c);
        run_conv( 0.020, c); $display("%9.4f   %0d",  0.020, c);
        run_conv( 1.640, c); $display("%9.4f   %0d",  1.640, c);   // near +FS
        run_conv(-1.640, c); $display("%9.4f   %0d", -1.640, c);   // near -FS

        // ---- Full ramp: monotonicity + missing-code check -----------------
        $display("\n--- full ramp (1024 pts over +/-FS) ---");
        fails = 0; miss = 0; c_prev = 0;
        for (i = 0; i < 1024; i = i + 1) begin
            // sweep across the full +/-1.65 V range, one LSB per step
            vin = -1.65 + (i + 0.5) * LSB;
            run_conv(vin, c);
            if (i > 0) begin
                if (c < c_prev) begin
                    fails = fails + 1;
                    $display("MONOTONIC FAIL @ i=%0d vin=%0.5f  code %0d -> %0d",
                             i, vin, c_prev, c);
                end
                if (c > c_prev + 1) begin
                    miss = miss + 1;
                    $display("MISSING CODE   @ i=%0d  jump %0d -> %0d",
                             i, c_prev, c);
                end
            end
            c_prev = c;
        end

        $display("\n==================================================");
        $display(" monotonic_fail_count = %0d", fails);
        $display(" missing_code_events  = %0d", miss);
        $display(" PASS = %0d", (fails == 0 && miss == 0));
        $display("==================================================");
        $finish;
    end

endmodule