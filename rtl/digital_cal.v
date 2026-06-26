module digital_cal #(parameter N = 8) (
    input  wire           clk,
    input  wire           rst_n,
    input  wire [N-1:0]   raw_result,
    input  wire           valid_in,
    input  wire [N-1:0]   offset,
    output reg  [N-1:0]   cal_result,
    output reg            valid_out
);

    reg [N:0] sum; // N+1 bits to detect overflow

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cal_result <= 0;
            valid_out  <= 0;
        end else begin
            valid_out <= 0;
            if (valid_in) begin
                sum = raw_result + offset;
                // clamp to 255 on overflow
                cal_result <= sum[N] ? {N{1'b1}} : sum[N-1:0];
                valid_out  <= 1;
            end
        end
    end

endmodule