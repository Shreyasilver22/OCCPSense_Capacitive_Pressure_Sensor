module sar_ctrl(
    input wire clk,
    input wire rst_n,
    input wire start,
    input wire comp_in, //comes from comparator
    output reg [7:0] dac_ctrl,
    output reg [7:0] result,
    output reg valid
); 

parameter IDLE    = 2'b00;
parameter SAMPLE  = 2'b01;
parameter CONVERT = 2'b10;
parameter DONE    = 2'b11;

reg [1:0] state;
reg [2:0] bit_cnt;  

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state    <= IDLE;
        bit_cnt  <= 3'd0;
        dac_ctrl <= 8'd0;
        result   <= 8'd0;
        valid    <= 1'b0;
    end else begin
        valid <= 1'b0; // default: valid is low every cycle
        case (state)

            IDLE: begin
                if (start)
                    state <= SAMPLE;
            end

            SAMPLE: begin
                // reset everything, start from MSB (bit 7)
                dac_ctrl <= 8'd0;
                result   <= 8'd0;
                bit_cnt  <= 3'd7;
                state    <= CONVERT;
            end

            CONVERT: begin
                // Step 1: set trial bit to 1
                dac_ctrl[bit_cnt] <= 1'b1;

                // Step 2: comparator already decided last cycle
                // if DAC was too high, clear the previous bit
                if (!comp_in)
                    dac_ctrl[bit_cnt] <= 1'b0;

                // Step 3: move to next bit or finish
                if (bit_cnt == 3'd0) begin
                    result <= dac_ctrl;
                    state  <= DONE;
                end else begin
                    bit_cnt <= bit_cnt - 1;
                end
            end

            DONE: begin
                valid <= 1'b1;  // pulse valid for one cycle
                state <= IDLE;
            end

        endcase
    end
end

endmodule