`timescale 1ns/1ps

module sar_fsm_wrapper #(
    // Set to 1'b0 if comp input is wired from Voutp:
    //     comp = 1 <=> vcp > vcn
    //
    // Set to 1'b1 if comp input is wired from Voutn:
    //     comp = 1 <=> vcn > vcp
    parameter INVERT_COMP = 1'b0
)(
    input  wire clk,
    input  wire rst_n,
    input  wire start,
    input  wire comp,

    output wire sample,
    output wire comp_clk,
    output wire busy,
    output wire valid,

    output wire bp9,
    output wire bp8,
    output wire bp7,
    output wire bp6,
    output wire bp5,
    output wire bp4,
    output wire bp3,
    output wire bp2,
    output wire bp1,
    output wire bp0,

    output wire bn9,
    output wire bn8,
    output wire bn7,
    output wire bn6,
    output wire bn5,
    output wire bn4,
    output wire bn3,
    output wire bn2,
    output wire bn1,
    output wire bn0,

    output wire code9,
    output wire code8,
    output wire code7,
    output wire code6,
    output wire code5,
    output wire code4,
    output wire code3,
    output wire code2,
    output wire code1,
    output wire code0
);

    wire [9:0] bp;
    wire [9:0] bn;
    wire [9:0] code;

    sar_logic #(
        .N                 (10),
        .SAMPLE_CYCLES     (4),
        .DAC_SETTLE_CYCLES (3),
        .INVERT_COMP       (INVERT_COMP)
    ) u_sar (
        .clk      (clk),
        .rst_n    (rst_n),
        .start    (start),
        .comp     (comp),

        .sample   (sample),
        .comp_clk (comp_clk),
        .busy     (busy),
        .valid    (valid),

        .bp       (bp),
        .bn       (bn),
        .code     (code)
    );

    assign bp9 = bp[9];
    assign bp8 = bp[8];
    assign bp7 = bp[7];
    assign bp6 = bp[6];
    assign bp5 = bp[5];
    assign bp4 = bp[4];
    assign bp3 = bp[3];
    assign bp2 = bp[2];
    assign bp1 = bp[1];
    assign bp0 = bp[0];

    assign bn9 = bn[9];
    assign bn8 = bn[8];
    assign bn7 = bn[7];
    assign bn6 = bn[6];
    assign bn5 = bn[5];
    assign bn4 = bn[4];
    assign bn3 = bn[3];
    assign bn2 = bn[2];
    assign bn1 = bn[1];
    assign bn0 = bn[0];

    assign code9 = code[9];
    assign code8 = code[8];
    assign code7 = code[7];
    assign code6 = code[6];
    assign code5 = code[5];
    assign code4 = code[4];
    assign code3 = code[3];
    assign code2 = code[2];
    assign code1 = code[1];
    assign code0 = code[0];

endmodule