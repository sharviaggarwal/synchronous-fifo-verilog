module fifo_sync_tb;
reg clk;
reg reset;
reg wr_en;
reg rd_en;
reg [7:0] data_in;
wire empty;
wire full;
wire [7:0] data_out;

fifo_sync uut (
    .clk(clk),
    .reset(reset),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .data_in(data_in),
    .empty(empty),
    .full(full),
    .data_out(data_out)
);

initial begin 
clk = 0; 
forever #5 clk = ~clk;
end


// Test sequence
initial begin

    // Initial values
    reset = 1;
    wr_en = 0;
    rd_en = 0;
    data_in = 0;
    

    // Reset
    #10;
    reset = 0;


    // -------------------------
    // WRITE A
    // -------------------------
    #10;
    wr_en = 1;
    data_in = 8'hAA;

    #10;
    wr_en = 0;


    // -------------------------
    // WRITE B
    // -------------------------
    #10;
    wr_en = 1;
    data_in = 8'hBB;

    #10;
    wr_en = 0;


    // -------------------------
    // WRITE C
    // -------------------------
    #10;
    wr_en = 1;
    data_in = 8'hCC;

    #10;
    wr_en = 0;


    // -------------------------
    // WRITE D
    // -------------------------
    #10;
    wr_en = 1;
    data_in = 8'hDD;

    #10;
    wr_en = 0;


    // -------------------------
    // READ A
    // -------------------------
    #10;
    rd_en = 1;

    #10;
    rd_en = 0;


    // -------------------------
    // READ B
    // -------------------------
    #10;
    rd_en = 1;

    #10;
    rd_en = 0;


    // -------------------------
    // READ C
    // -------------------------
    #10;
    rd_en = 1;

    #10;
    rd_en = 0;


    // -------------------------
    // READ D
    // -------------------------
    #10;
    rd_en = 1;

    #10;
    rd_en = 0;
 

end

endmodule

