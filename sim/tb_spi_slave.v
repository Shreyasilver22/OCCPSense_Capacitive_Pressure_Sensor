`timescale 1ns/1ps

module tb_spi_slave;

    parameter N = 10;

    // Inputs to DUT
    reg sclk;
    reg cs_n;
    reg mosi;
    reg [N-1:0] data_in;
    reg valid;

    // Outputs from DUT
    wire miso;
    wire [N-1:0] offset;

    // Instantiate DUT
    spi_slave #(.N(N)) dut (
        .sclk(sclk),
        .cs_n(cs_n),
        .mosi(mosi),
        .miso(miso),
        .data_in(data_in),
        .valid(valid),
        .offset(offset)
    );

    reg [N-1:0] received_data;
    integer i;

    initial begin
        // Setup waveform dumping
        $dumpfile("sim/tb_spi_slave.vcd");
        $dumpvars(0, tb_spi_slave);

        // Initialize inputs
        sclk = 1'b0;
        cs_n = 1'b1;
        mosi = 1'b0;
        data_in = 10'd0;
        valid = 1'b0;
        received_data = 10'd0;

        #20;

        // Load data into SPI slave (pulse valid high for one clock cycle)
        data_in = 10'b1010101010;
        valid = 1'b1;
        #10;
        valid = 1'b0;

        // Wait 10ns before starting SPI transaction
        #10;

        // Pull cs_n low to select slave
        cs_n = 1'b0;
        #10;

        // Clock out 10 bits (toggle every 10ns) reading miso each cycle
        for (i = N-1; i >= 0; i = i - 1) begin
            sclk = 1'b1; #10;
            received_data[i] = miso;
            sclk = 1'b0; #10;
        end

        // End SPI transaction
        cs_n = 1'b1;
        sclk = 1'b0;

        // Display results
        $display("SPI received: %b (expected %b)", received_data, 10'b1010101010);

        #50;
        $finish;
    end

endmodule
