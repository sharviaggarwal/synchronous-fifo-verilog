module fifo_sync(
input clk, 
input reset,
input wr_en,
input rd_en,
input  [7:0] data_in,
output empty,
output full,
output reg [7:0]data_out);
reg [1:0]wr_ptr;
reg [1:0]rd_ptr;
reg [2:0]count;
reg [7:0] memory [0:3];

always @(posedge clk or posedge reset) begin

    if (reset) begin
        wr_ptr <= 0;
        count  <= 0;
        rd_ptr <= 0;
        data_out <= 0;
    end

    else if (wr_en && !full && !rd_en) begin
        memory[wr_ptr] <= data_in;

        if (wr_ptr == 3)
            wr_ptr <= 0;
        else 
            wr_ptr <= wr_ptr + 1;

   count <= count + 1;
    end



   else if (rd_en && !empty && !wr_en) 
begin
data_out <= memory[rd_ptr];
if (rd_ptr == 3)
            rd_ptr <= 0;
        else 
           rd_ptr <= rd_ptr + 1;
count <= count-1;
end

 else if (wr_en && rd_en && !empty && !full) begin

        memory[wr_ptr] <= data_in;
        data_out <= memory[rd_ptr];

        // Write pointer
        if (wr_ptr == 3)
            wr_ptr <= 0;
        else
            wr_ptr <= wr_ptr + 1;

        // Read pointer
        if (rd_ptr == 3)
            rd_ptr <= 0;
        else
            rd_ptr <= rd_ptr + 1;

        // One enters and one leaves
        count <= count;
    end

end 


assign empty = (count == 0);
assign full  = (count == 4);

endmodule