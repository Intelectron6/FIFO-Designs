module fifo_mem (output [15:0] rd_data,
		 input [15:0] wrt_data,
		 input [5:0] wrt_addr, rd_addr,
		 input wrt_en, full, wrt_clk);

	// RTL Verilog memory model
	reg [15:0] mem [0:63];
	
	assign rd_data = mem [rd_addr];
	
	always @(posedge wrt_clk)
	begin
		if (wrt_en & (~full)) 
			mem [wrt_addr] <= wrt_data;
	end
	
endmodule
