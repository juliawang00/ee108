// How to use:					
// 1. Edit the songs on the Enter Song sheet.					
// 2. Select this whole worksheet, copy it, and paste it into a new file.					
// 3. Save the file as song_rom.v.					
					
module song_rom (					
	input clk,				
	input [7:0] addr,				
	output reg [15:0] dout				
);					
					
	wire [15:0] memory [127:0];				
					
	always @(posedge clk)				
		dout = memory[addr];			
					
	assign memory[	  0	] =	{1'd0,6'd23, 6'd12, 3'd0};	// Note: 2G
	assign memory[	  1	] =	{1'd0,6'd47, 6'd12,3'd0};	// Note: 4G
	assign memory[	  2	] =	{4'd8, 6'd0, 6'd12};	// Note: rest
	assign memory[	  3	] =	{1'd0,6'd39, 6'd12,3'd0};	// Note: 4B
	assign memory[	  4	] =	{1'd0, 6'd42, 6'd12, 3'd0};	// Note: 4D
	assign memory[	  5	] =	{1'd0,6'd47, 6'd12,3'd0};	// Note: 4G
	assign memory[	  6	] =	{4'd8,6'd0, 6'd12};	// Note: rest
	assign memory[	  7	] =	{1'd0,6'd27, 6'd12, 3'd0};	// Note: 3B
	assign memory[	  8	] =	{1'd0,6'd54, 6'd12, 3'd0};	// Note: 5D
	assign memory[	  9	] =	{4'd8,6'd0, 6'd12};	// Note: rest
	assign memory[	 10	] =	{1'd0,6'd54, 6'd12, 3'd0};	// Note: 5D
	assign memory[	 11	] =	{1'd0,6'd47, 6'd12, 3'd0};	// Note: 4G
	assign memory[	 12	] =	{1'd0,6'd42, 6'd12, 3'd0};	// Note: 4D
	assign memory[	 13	] =	{4'd8,6'd0, 6'd12};	// Note: rest
	assign memory[	 14	] =	{1'd0,6'd56, 6'd12, 3'd0};	// Note: 5E
	assign memory[	 15	] =	{1'd0,6'd28, 6'd12, 3'd0};	// Note: 3C
	assign memory[	 16	] =	{4'd8,6'd0, 6'd12};	// Note: rest
	assign memory[	 17	] =	{1'd0,6'd44, 6'd12, 3'd0};	// Note: 4E
	assign memory[	 18	] =	{1'd0,6'd47, 6'd12, 3'd0};	// Note: 4G
	assign memory[	 19	] =	{1'd0,6'd56, 6'd12, 3'd0};	// Note: 5E
	assign memory[	 20	] =	{4'd8,6'd0, 6'd12};	// Note: rest
	assign memory[	 21	] =	{1'd0,6'd54, 6'd12, 3'd0};	// Note: 5D
	assign memory[	 22	] =	{1'd0,6'd27, 6'd12, 3'd0};	// Note: 3B
	assign memory[	 23	] =	{4'd8,6'd0, 6'd12};	// Note: rest
	assign memory[	 24	] =	{1'd0,6'd47, 6'd12, 3'd0};	// Note: 4G
	assign memory[	 25	] =	{1'd0,6'd42, 6'd12, 3'd0};	// Note: 4D
	assign memory[	 26	] =	{4'd8,6'd0, 6'd12};	// Note: rest
	assign memory[	 27	] =	{1'd0,6'd52, 6'd12, 3'd0};	// Note: 5C
	assign memory[	 28	] =	{1'd0,6'd25, 6'd12, 3'd0};	// Note: 3A
	assign memory[	 29	] =	{4'd8,6'd0, 6'd12};	// Note: rest
	assign memory[	 30	] =	{1'd0,6'd52, 6'd12, 3'd0};	// Note: 5C
	assign memory[	 31	] =	{1'd0,6'd46, 6'd12, 3'd0};	// Note: 4F#Gb
	assign memory[	 32	] =	{1'd0,6'd40, 6'd12,3'd0};	// Note: 4C
	assign memory[	 33	] =	{4'd8,6'd0, 6'd12};	// Note: rest
	assign memory[	 34	] =	{1'd0,6'd23, 6'd12,3'd0};	// Note: 2G
	assign memory[	 35	] =	{1'd0,6'd51, 6'd12,3'd0};	// Note: 5B
	assign memory[	 36	] =	{4'd8,6'd0, 6'd12};	// Note: rest
	assign memory[	 37	] =	{1'd0,6'd51, 6'd12,3'd0};	// Note: 5B
	assign memory[	 38	] =	{1'd0,6'd47, 6'd12,3'd0};	// Note: 4G
	assign memory[	 39	] =	{1'd0,6'd42, 6'd12,3'd0};	// Note: 4D
	assign memory[	 40	] =	{4'd8,6'd0, 6'd12};	// Note: rest
	assign memory[	 41	] =	{1'd0,6'd18, 6'd12,3'd0};	// Note: 2D
	assign memory[	 42	] =	{1'd0,6'd47, 6'd12,3'd0};	// Note: 4G
	assign memory[	 43	] =	{1'd0,6'd49, 6'd12,3'd0};	// Note: 5A
	assign memory[	 44	] =	{4'd8,6'd0, 6'd12};	// Note: rest
	assign memory[	 45	] =	{1'd0,6'd49, 6'd12,3'd0};	// Note: 5A
	assign memory[	 46	] =	{1'd0,6'd46, 6'd12,3'd0};	// Note: 4F#Gb
	assign memory[	 47	] =	{1'd0,6'd40, 6'd12,3'd0};	// Note: 4C
	assign memory[	 48	] =	{4'd8,6'd0, 6'd12};	// Note: rest
	assign memory[	 49	] =	{1'd0,6'd23, 6'd12,3'd0};	// Note: 2G
	assign memory[	 50	] =	{1'd0,6'd47, 6'd24,3'd0};	// Note: 4G
	assign memory[	 51	] =	{4'd8,6'd0, 6'd12};	// Note: rest
	assign memory[	 52	] =	{1'd0,6'd39, 6'd12,3'd0};	// Note: 4B
	assign memory[	 53	] =	{1'd0,6'd42, 6'd12,3'd0};	// Note: 4D
	assign memory[	 54	] =	{4'd8,6'd0, 6'd12};	// Note: rest
	assign memory[	 55	] =	{1'd0,6'd54, 6'd12,3'd0};	// Note: 5D
	assign memory[	 56	] =	{1'd0,6'd27, 6'd12,3'd0};	// Note: 3B
	assign memory[	 57	] =	{4'd8,6'd0, 6'd12};	// Note: rest
	assign memory[	 58	] =	{1'd0,6'd54, 6'd12,3'd0};	// Note: 5D
	assign memory[	 59	] =	{1'd0,6'd42, 6'd12,3'd0};	// Note: 4D
	assign memory[	 60	] =	{1'd0,6'd47, 6'd12,3'd0};	// Note: 4G
	assign memory[	 61	] =	{4'd8,6'd0, 6'd12};	// Note: rest
	assign memory[	 62	] =	{1'd0,6'd52, 6'd12,3'd0};	// Note: 5C
	assign memory[	 63	] =	{1'd0,6'd28, 6'd12,3'd0};	// Note: 3C
	assign memory[	 64	] =	{4'd8,6'd0, 6'd12};	// Note: rest
	assign memory[	 65	] =	{1'd0,6'd52, 6'd12,3'd0};	// Note: 5C
	assign memory[	 66	] =	{1'd0,6'd47, 6'd12,3'd0};	// Note: 4G
	assign memory[	 67	] =	{1'd0,6'd44, 6'd12,3'd0};	// Note: 4E
	assign memory[	 68	] =	{4'd8,6'd0, 6'd12};	// Note: rest
	assign memory[	 69	] =	{1'd0,6'd51, 6'd12,3'd0};	// Note: 5B
	assign memory[	 70	] =	{1'd0,6'd30, 6'd12,3'd0};	// Note: 3D
	assign memory[	 71	] =	{4'd8,6'd0, 6'd12};	// Note: rest
	assign memory[	 72	] =	{1'd0,6'd51, 6'd12,3'd0};	// Note: 5B
	assign memory[	 73	] =	{1'd0,6'd47, 6'd12,3'd0};	// Note: 4G
	assign memory[	 74	] =	{1'd0,6'd42, 6'd12,3'd0};	// Note: 4D
	assign memory[	 75	] =	{4'd8,6'd0, 6'd12};	// Note: rest
	assign memory[	 76	] =	{1'd0,6'd49, 6'd24,3'd0};	// Note: 5A
	assign memory[	 77	] =	{1'd0,6'd46, 6'd24,3'd0};	// Note: 4F#Gb
	assign memory[	 78	] =	{1'd0,6'd30, 6'd12,3'd0};	// Note: 3D
	assign memory[	 79	] =	{4'd8,6'd0, 6'd12};	// Note: rest
	assign memory[	 80	] =	{1'd0,6'd42, 6'd12,3'd0};	// Note: 4D
	assign memory[	 81	] =	{4'd8,6'd0, 6'd12};	// Note: rest
	assign memory[	 82	] =	{1'd0,6'd54, 6'd12,3'd0};	// Note: 5D
	assign memory[	 83	] =	{1'd0,6'd27, 6'd12,3'd0};	// Note: 3B
	assign memory[	 84	] =	{4'd8,6'd0, 6'd12};	// Note: rest
	assign memory[	 85	] =	{1'd0,6'd54, 6'd12,3'd0};	// Note: 5D
	assign memory[	 86	] =	{1'd0,6'd47, 6'd12,3'd0};	// Note: 4G
	assign memory[	 87	] =	{1'd0,6'd39, 6'd12,3'd0};	// Note: 4B
	assign memory[	 88	] =	{4'd8,6'd0, 6'd12};	// Note: rest
	assign memory[	 89	] =	{1'd0,6'd52, 6'd12,3'd0};	// Note: 5C
	assign memory[	 90	] =	{1'd0,6'd28, 6'd12,3'd0};	// Note: 3C
	assign memory[	 91	] =	{4'd8,6'd0, 6'd12};	// Note: rest
	assign memory[	 92	] =	{1'd0,6'd52, 6'd12,3'd0};	// Note: 5C
	assign memory[	 93	] =	{1'd0,6'd47, 6'd12,3'd0};	// Note: 4G
	assign memory[	 94	] =	{1'd0,6'd44, 6'd12,3'd0};	// Note: 4E
	assign memory[	 95	] =	{4'd8,6'd0, 6'd12};	// Note: rest
	assign memory[	 96	] =	{1'd0,6'd51, 6'd12,3'd0};	// Note: 5B
	assign memory[	 97	] =	{1'd0,6'd30, 6'd12,3'd0};	// Note: 3D
	assign memory[	 98	] =	{4'd8,6'd0, 6'd12};	// Note: rest
	assign memory[	 99	] =	{1'd0,6'd49, 6'd24,3'd0};	// Note: 5A
	assign memory[	100	] =	{1'd0,6'd47, 6'd12,3'd0};	// Note: 4G
	assign memory[	101	] =	{1'd0,6'd30, 6'd12,3'd0};	// Note: 3D
	assign memory[	102	] =	{4'd8,6'd0, 6'd12};	// Note: rest
	assign memory[	103	] =	{1'd0,6'd46, 6'd12,3'd0};	// Note: 4F#Gb
	assign memory[	104	] =	{1'd0,6'd42, 6'd12,3'd0};	// Note: 4D
	assign memory[	105	] =	{4'd8,6'd0, 6'd12};	// Note: rest
	assign memory[	106	] =	{1'd0,6'd23, 6'd12,3'd0};	// Note: 2G
	assign memory[	107	] =	{1'd0,6'd47, 6'd12,3'd0};	// Note: 4G
	assign memory[	108	] =	{4'd8,6'd0, 6'd12};	// Note: rest
	assign memory[	109	] =	{1'd0,6'd39, 6'd12,3'd0};	// Note: 4B
	assign memory[	110	] =	{1'd0,6'd47, 6'd12,3'd0};	// Note: 4G
	assign memory[	111	] =	{4'd8,6'd0, 6'd12};	// Note: rest
	assign memory[	112	] =	{1'd0,6'd27, 6'd12,3'd0};	// Note: 3B
	assign memory[	113	] =	{1'd0,6'd54, 6'd12,3'd0};	// Note: 5D
	assign memory[	114	] =	{4'd8,6'd0, 6'd12};	// Note: rest
	assign memory[	115	] =	{1'd0,6'd54, 6'd12,3'd0};	// Note: 5D
	assign memory[	116	] =	{1'd0,6'd42, 6'd12,3'd0};	// Note: 4D
	assign memory[	117	] =	{4'd8,6'd0, 6'd12};	// Note: rest
	assign memory[	118	] =	{1'd0,6'd56, 6'd12,3'd0};	// Note: 5E
	assign memory[	119	] =	{1'd0,6'd28, 6'd12,3'd0};	// Note: 3C
	assign memory[	120	] =	{4'd8,6'd0, 6'd12};	// Note: rest
	assign memory[	121	] =	{1'd0,6'd44, 6'd12,3'd0};	// Note: 4E
	assign memory[	122	] =	{1'd0,6'd56, 6'd12,3'd0};	// Note: 5E
	assign memory[	123	] =	{4'd8,6'd0, 6'd12};	// Note: rest
	assign memory[	124	] =	{1'd0,6'd54, 6'd24,3'd0};	// Note: 5D
	assign memory[	125	] =	{1'd0,6'd27, 6'd12,3'd0};	// Note: 3B
	assign memory[	126	] =	{4'd8,6'd0, 6'd12};	// Note: rest
	assign memory[	127	] =	{4'd8,6'd0, 6'd12};	// Note: rest
endmodule					
