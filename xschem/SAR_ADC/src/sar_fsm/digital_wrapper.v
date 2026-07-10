`timescale 1ns/1ps

module digital_wrapper #(parameter N = 10, parameter INVERT_COMP = 1'b0) (
    input  wire clk,
    input  wire rst_n,
    input  wire start,
    input  wire comp_in,
    
    input  wire sclk,
    input  wire cs_n,
    input  wire mosi,
    output wire miso,
    
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
    
    output wire bist_en
);

    wire [N-1:0] sar_result;
    wire         sar_valid;
    wire [N-1:0] cal_result;
    wire         cal_valid;
    wire [N-1:0] offset;

    reg [N-1:0] result_hold;
    reg         result_ready;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            result_hold  <= 0;
            result_ready <= 0;
        end else if (cal_valid) begin
            result_hold  <= cal_result;
            result_ready <= 1'b1;
        end
    end
    
    wire [N-1:0] bp_bus;
    wire [N-1:0] bn_bus;

    // Instantiate SAR Logic
    sar_logic #(
        .N(N),
        .INVERT_COMP(INVERT_COMP)
    ) u_sar (
        .clk       (clk),
        .rst_n     (rst_n),
        .start     (start),
        .comp      (comp_in),
        .sample    (),
        .comp_clk  (),
        .busy      (),
        .valid     (sar_valid),
        .bp        (bp_bus),
        .bn        (bn_bus),
        .code      (sar_result)
    );

    // Instantiate Digital Calibration
    digital_cal #(.N(N)) u_cal (
        .clk        (clk),
        .rst_n      (rst_n),
        .raw_result (sar_result),
        .valid_in   (sar_valid),
        .offset     (offset),
        .cal_result (cal_result),
        .valid_out  (cal_valid)
    );

    // Instantiate SPI Slave
    spi_slave #(.N(N)) u_spi (
        .rst_n    (rst_n),
        .sclk     (sclk),
        .cs_n     (cs_n),
        .mosi     (mosi),
        .miso     (miso),
        .data_in  (result_hold),
        .valid    (result_ready),
        .offset   (offset)
    );

    assign bist_en = 1'b0; // placeholder for now

    // Flatten bp bus for Xschem
    assign bp9 = bp_bus[9];
    assign bp8 = bp_bus[8];
    assign bp7 = bp_bus[7];
    assign bp6 = bp_bus[6];
    assign bp5 = bp_bus[5];
    assign bp4 = bp_bus[4];
    assign bp3 = bp_bus[3];
    assign bp2 = bp_bus[2];
    assign bp1 = bp_bus[1];
    assign bp0 = bp_bus[0];

    // Flatten bn bus for Xschem
    assign bn9 = bn_bus[9];
    assign bn8 = bn_bus[8];
    assign bn7 = bn_bus[7];
    assign bn6 = bn_bus[6];
    assign bn5 = bn_bus[5];
    assign bn4 = bn_bus[4];
    assign bn3 = bn_bus[3];
    assign bn2 = bn_bus[2];
    assign bn1 = bn_bus[1];
    assign bn0 = bn_bus[0];

endmodule