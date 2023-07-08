module synchronous_fifo (input clk,
                      	 input rst_n,
                      	 input wrt_en,
                      	 input rd_en,
                      	 input [15:0] data_in,
                         output [15:0] data_out,
                         output full, 
                      	 output empty);

	reg [3:0] wtr_ptr;
	reg [3:0] rd_ptr;
	reg [15:0] fifo_mem [0:7];
	wire wrap_around;
	
	always@(posedge clk or negedge rst_n) 
	begin
		if (~rst_n) 
		begin
			wtr_ptr <= 0; 
			rd_ptr <= 0;
		end
		
		else if (wrt_en & !full) 
		begin
			fifo_mem[wtr_ptr[2:0]] <= data_in;
			wtr_ptr <= wtr_ptr + 1;
		end
		
		else if (rd_en & !empty) 
			rd_ptr <= rd_ptr + 1;
   	end

	assign data_out = fifo_mem[rd_ptr[2:0]];
	
	assign wrap_around = wtr_ptr[3] ^ rd_ptr[3];   
	assign full = wrap_around & (wtr_ptr[2:0] == rd_ptr[2:0]);
	assign empty = (wtr_ptr == rd_ptr);
	
endmodule
