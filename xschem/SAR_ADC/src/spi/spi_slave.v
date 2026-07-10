module spi_slave #(parameter N = 10) (
    input  wire           rst_n,
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
    reg [7:0]   bit_cnt;
    reg         cs_n_prev;

    // entire SPI logic clocked on sclk
    always @(posedge sclk or negedge rst_n) begin
        if (!rst_n) begin
            shift_reg <= 0;
            mosi_reg  <= 0;
            bit_cnt   <= 0;
            offset    <= 0;
            cs_n_prev <= 1'b1;
        end else begin
            cs_n_prev <= cs_n;

            if (cs_n_prev && !cs_n) begin
                // falling edge of cs_n — load
                shift_reg <= data_in;
                bit_cnt   <= 8'd0;
            end else if (!cs_n) begin
                // active transaction — shift
                shift_reg <= {shift_reg[N-2:0], 1'b0};
                mosi_reg  <= {mosi_reg[N-2:0], mosi};
                bit_cnt   <= bit_cnt + 8'd1;
                if (bit_cnt == N - 1)
                    offset <= {mosi_reg[N-2:0], mosi};
            end
        end
    end

    assign miso = (!cs_n) ? shift_reg[N-1] : 1'b0;

endmodule