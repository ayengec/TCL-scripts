`timescale 1ns/1ps

module tb_dual_port_fifo;

    // Parameters
    parameter int WIDTH = 8;
    parameter int DEPTH = 16;

    // DUT signals
    logic clk = 0;
    logic rst = 1;
    logic wr_en = 0;
    logic rd_en = 0;
    logic [WIDTH-1:0] din = 0;
    logic [WIDTH-1:0] dout;
    logic empty;
    logic full;

    // Instantiate DUT
    dual_port_fifo #(
        .WIDTH(WIDTH),
        .DEPTH(DEPTH)
    ) dut (
        .clk(clk),
        .rst(rst),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full)
    );

    // Clock generation (100 MHz)
    always #5 clk = ~clk;

    // Waveform dump
    initial begin
        $dumpfile("fifo.vcd");
        $dumpvars(0, tb_dual_port_fifo);
    end

    // Reset and wait for Tcl stimulus
    initial begin
        rst = 1;
        #20;
        rst = 0;

        // Now pass control to Tcl
        forever @(posedge clk);
    end

endmodule
