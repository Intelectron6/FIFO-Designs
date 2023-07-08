module wrt_ptr_full (output reg full,
					 output [2:0] wrt_addr,
					 output reg [3:0] wrt_ptr,
					 input [3:0] wq2_rd_ptr,
					 input wrt_en, wrt_clk, wrt_rst_n);
	
	reg [3:0] wrt_bin;
	wire [3:0] wrt_gray_next, wrt_bin_next;
	wire full_val;
	
	// Gray Style 2 pointer (both gray code and binary code registers are present)
	always @(posedge wrt_clk or negedge wrt_rst_n)
	if (!wrt_rst_n) 
		{wrt_bin, wrt_ptr} <= 0;
	else
		{wrt_bin, wrt_ptr} <= {wrt_bin_next, wrt_gray_next};
	
	assign wrt_bin_next = wrt_bin + (wrt_en & ~full);
	assign wrt_gray_next = (wrt_bin_next>>1) ^ wrt_bin_next;
	
	// Memory write-address pointer (binary is used to address memory)
	assign wrt_addr = wrt_bin[2:0];
	
	// Simplified version of the three necessary full-tests:
	// assign full_val=((wrt_gray_next[3] != wq2_rd_ptr[3]) &&
	//					(wrt_gray_next[2] != wq2_rd_ptr[2]) && 
	//   				(wrt_gray_next[1:0] == wq2_rd_ptr[1:0]));
	assign full_val = (wrt_gray_next=={~wq2_rd_ptr[3:2], wq2_rd_ptr[1:0]});
	
	always @(posedge wrt_clk or negedge wrt_rst_n)
		if (!wrt_rst_n) 
			full <= 1'b0;
		else 
			full <= full_val;
	
endmodule