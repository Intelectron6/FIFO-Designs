module sync_rd_2_wrt (output reg [6:0] wq2_rd_ptr,
		      input [6:0] rd_ptr,
		      input wrt_clk, wrt_rst_n);
				 
	reg [6:0] temp_ptr;
	
	// 2 flop synchronizer for read point with respect to write clock
	always @(posedge wrt_clk or negedge wrt_rst_n)
		if (!wrt_rst_n) 
			{wq2_rd_ptr, temp_ptr} <= 0;
		else 
			{wq2_rd_ptr, temp_ptr} <= {temp_ptr, rd_ptr};
			
endmodule
