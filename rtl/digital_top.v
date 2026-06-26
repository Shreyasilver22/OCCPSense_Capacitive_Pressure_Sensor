module digital_top #(parameter N = 10) (
    input  wire         clk,
    input  wire         rst_n,
    input  wire         start,
    input  wire         comp_in,
    input  wire         sclk,
    input  wire         cs_n,
    input  wire         mosi,
    output wire         miso,
    output wire [N-1:0] bp,
    output wire [N-1:0] bn,
    output wire         bist_en
);

    wire [N-1:0] sar_result;
    wire         sar_valid;
    wire [N-1:0] cal_result;
    wire         cal_valid;
    wire [N-1:0] offset;

    sar_logic #(.N(N)) u_sar (
        .clk       (clk),
        .rst_n     (rst_n),
        .start     (start),
        .comp      (comp_in),
        .sample    (),
        .comp_clk  (),
        .busy      (),
        .valid     (sar_valid),
        .bp        (bp),
        .bn        (bn),
        .code      (sar_result)
    );

    digital_cal #(.N(N)) u_cal (
        .clk        (clk),
        .rst_n      (rst_n),
        .raw_result (sar_result),
        .valid_in   (sar_valid),
        .offset     (offset),
        .cal_result (cal_result),
        .valid_out  (cal_valid)
    );

    spi_slave #(.N(N)) u_spi (
        .sclk     (sclk),
        .cs_n     (cs_n),
        .mosi     (mosi),
        .miso     (miso),
        .data_in  (cal_result),
        .valid    (cal_valid),
        .offset   (offset)
    );

    assign bist_en = 1'b0; // placeholder for now

endmodule