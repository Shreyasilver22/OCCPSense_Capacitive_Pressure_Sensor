`timescale 1ns/1ps
//-----------------------------------------------------------------------------
// 10-bit fully-differential SAR controller
// Mode: evaluate-first MONOTONIC (set-and-down, up-going) on a conventional
//       1024-unit binary array. MSB decided with DAC idle (boundary at 0),
//       then cap[bit_idx] of the LOWER side is raised each step.
//   bp9/bn9 = 512-cap MSB ... bp0/bn0 = 1-cap LSB.
//   The LSB is a real code decision; no correction switch follows the final bit.
//   comp = 1  <=>  vcp > vcn.  Set INVERT_COMP=1 if wrapper comp is from Voutn.
//-----------------------------------------------------------------------------
module sar_logic #(
    parameter integer N                 = 10,
    parameter integer SAMPLE_CYCLES     = 4,
    parameter integer DAC_SETTLE_CYCLES = 3,
    parameter         INVERT_COMP       = 1'b0   // 1'b1 if comp wired from Voutn
)(
    input  wire         clk,
    input  wire         rst_n,
    input  wire         start,
    input  wire         comp,

    output reg          sample,
    output reg          comp_clk,
    output reg          busy,
    output reg          valid,

    output reg  [N-1:0] bp,
    output reg  [N-1:0] bn,
    output reg  [N-1:0] code
);

    wire cmp_p_gt_n = INVERT_COMP ? ~comp : comp;

    localparam [2:0]
        S_IDLE    = 3'd0,
        S_SAMPLE  = 3'd1,
        S_SETTLE  = 3'd2,
        S_COMPARE = 3'd3,
        S_DECIDE  = 3'd4,
        S_DONE    = 3'd5;

    localparam [3:0] LAST_BIT = N - 1;

    reg [2:0] state;
    reg [3:0] bit_idx;
    reg [7:0] count;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state    <= S_IDLE;
            sample   <= 1'b0; comp_clk <= 1'b0;
            busy     <= 1'b0; valid    <= 1'b0;
            bp       <= {N{1'b0}}; bn <= {N{1'b0}}; code <= {N{1'b0}};
            bit_idx  <= LAST_BIT;  count <= 8'd0;
        end else begin
            comp_clk <= 1'b0;       // one-cycle strobe by default
            valid    <= 1'b0;       // one-cycle pulse by default

            case (state)

                S_IDLE: begin
                    sample <= 1'b0;
                    busy   <= 1'b0;
                    if (start) begin
                        busy    <= 1'b1;
                        bp      <= {N{1'b0}}; bn <= {N{1'b0}}; code <= {N{1'b0}};
                        bit_idx <= LAST_BIT;  count <= 8'd0;
                        state   <= S_SAMPLE;
                    end
                end

                // Acquire input on top plates; ALL bottom plates at vcm.
                S_SAMPLE: begin
                    sample <= 1'b1;
                    bp     <= {N{1'b0}};
                    bn     <= {N{1'b0}};
                    if (count == SAMPLE_CYCLES - 1) begin
                        sample <= 1'b0;
                        count  <= 8'd0;
                        state  <= S_SETTLE;   // straight to MSB compare, NO trial
                    end else count <= count + 1'b1;
                end

                S_SETTLE: begin
                    if (count == DAC_SETTLE_CYCLES - 1) begin
                        count <= 8'd0;
                        state <= S_COMPARE;
                    end else count <= count + 1'b1;
                end

                S_COMPARE: begin
                    comp_clk <= 1'b1;          // strobe strong-arm this cycle
                    state    <= S_DECIDE;       // read comp NEXT cycle (settle margin)
                end

                S_DECIDE: begin
                    code[bit_idx] <= cmp_p_gt_n;

                    if (bit_idx != 4'd0) begin
                        // Monotonic: raise the LOWER side's cap of weight 2^bit_idx.
                        if (cmp_p_gt_n) bn[bit_idx] <= 1'b1;  // vcp>vcn -> push vcn up
                        else            bp[bit_idx] <= 1'b1;  // vcn>vcp -> push vcp up
                        bit_idx <= bit_idx - 1'b1;
                        count   <= 8'd0;
                        state   <= S_SETTLE;
                    end else begin
                        state <= S_DONE;          // final LSB: decision only, no switch
                    end
                end

                S_DONE: begin
                    valid <= 1'b1;
                    busy  <= 1'b0;
                    state <= S_IDLE;
                end

                default: state <= S_IDLE;
            endcase
        end
    end

endmodule