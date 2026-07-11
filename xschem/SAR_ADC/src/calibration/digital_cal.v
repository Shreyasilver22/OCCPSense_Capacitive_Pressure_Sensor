module digital_cal #(parameter N = 10) (
    input  wire           clk,
    input  wire           rst_n,
    input  wire [N-1:0]   raw_result,
    input  wire           valid_in,
    input  wire [N-1:0]   offset,
    output reg  [N-1:0]   cal_result,
    output reg            valid_out
);

    wire [N:0] sum;
    assign sum = {1'b0, raw_result} + {1'b0, offset};

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cal_result <= {N{1'b0}};
            valid_out  <= 1'b0;
        end else begin
            valid_out <= 1'b0;
            if (valid_in) begin
                cal_result <= sum[N] ? {N{1'b1}} : sum[N-1:0];
                valid_out  <= 1'b1;
            end
        end
    end

endmodule