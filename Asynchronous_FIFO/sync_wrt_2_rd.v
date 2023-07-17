module sync_wrt_2_rd (output reg [6:0] rq2_wrt_ptr,
		      input [6:0] wrt_ptr,
		      input rd_clk, rd_rst_n);
				 
	reg [6:0] temp_ptr;
	
	// 2 flop synchronizer for write point with respect to read clock
	always @(posedge rd_clk or negedge rd_rst_n)
		if (!rd_rst_n) 
			{rq2_wrt_ptr, temp_ptr} <= 0;
		else 
			{rq2_wrt_ptr, temp_ptr} <= {temp_ptr, wrt_ptr};
			
endmodule
