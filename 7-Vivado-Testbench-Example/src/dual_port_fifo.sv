module dual_port_fifo #(
    parameter int WIDTH = 8,
    parameter int DEPTH = 16
)(
    input  logic              clk,
    input  logic              rst,
    input  logic              wr_en,
    input  logic              rd_en,
    input  logic [WIDTH-1:0]  din,
    output logic [WIDTH-1:0]  dout,
    output logic              empty,
    output logic              full
);

    // Internal memory array
    logic [WIDTH-1:0] mem [0:DEPTH-1];

    // Pointers and Counter
    // Using int or specific logic width for synthesis
    logic [$clog2(DEPTH)-1:0] wr_ptr;
    logic [$clog2(DEPTH)-1:0] rd_ptr;
    logic [$clog2(DEPTH):0]   count; 

    // SystemVerilog always_ff ensures sequential logic (Flip-Flops)
    always_ff @(posedge clk) begin
        if (rst) begin
            wr_ptr <= '0;  // SV style to clear all bits to 0
            rd_ptr <= '0;
            count  <= '0;
            dout   <= '0;
        end else begin
            // Write Logic
            if (wr_en && !full) begin
                mem[wr_ptr] <= din;
                wr_ptr      <= wr_ptr + 1'b1;
                count       <= count + 1'b1;
            end
            
            // Read Logic
            if (rd_en && !empty) begin
                dout   <= mem[rd_ptr];
                rd_ptr <= rd_ptr + 1'b1;
                count  <= count - 1'b1;
            end
        end
    end

    // Combinational Output Assignments (Continuous)
    // It's more professional to drive status flags outside the clock block
    // to avoid a 1-clock delay in status updates.
    assign empty = (count == 0);
    assign full  = (count == DEPTH);

endmodule
