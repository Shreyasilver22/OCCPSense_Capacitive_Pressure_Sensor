module spi_slave #(parameter N = 8) (
    input  wire           sclk,
    input  wire           cs_n,
    input  wire           mosi,
    output wire           miso,
    input  wire [N-1:0]   data_in,
    input  wire           valid,
    output reg  [N-1:0]   offset
);

    reg [N-1:0] shift_reg;
    reg [N-1:0] mosi_reg;
    reg [N-1:0] data_latch; // holds result until next conversion
    reg [7:0]   bit_cnt;
    reg         done;

    // latch fresh data when valid — holds until next valid
    always @(posedge valid) begin
        data_latch <= data_in;
    end

    // load shift register on falling CS_N
    always @(negedge cs_n) begin
        shift_reg <= data_latch;
        bit_cnt   <= 8'd0;
        done      <= 1'b0;
    end

    // shift out MISO on falling SCLK
    always @(negedge sclk) begin
        if (!cs_n) begin
            shift_reg <= {shift_reg[N-2:0], 1'b0};
            bit_cnt   <= bit_cnt + 8'd1;
            if (bit_cnt == N-1)
                done <= 1'b1;
        end
    end

    // shift in MOSI on rising SCLK
    always @(posedge sclk) begin
        if (!cs_n)
            mosi_reg <= {mosi_reg[N-2:0], mosi};
    end

    // latch offset on rising CS_N (end of transaction)
    always @(posedge cs_n) begin
        if (done)
            offset <= mosi_reg;
    end

    assign miso = (!cs_n) ? shift_reg[N-1] : 1'bz;

endmodule