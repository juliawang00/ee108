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
					
	assign memory[	  0	] =	{1'd0,6'd23, 6'd12, 3'd1};	// Note: 2G
	assign memory[	  1	] =	{1'd0,6'd47, 6'd12,3'd2};	// Note: 4G
	assign memory[	  2	] =	{1'd0,6'd30, 6'd12,3'd4};	// Note: 3D
	assign memory[	  3	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	  4	] =	{1'd0,6'd39, 6'd12,3'd0};	// Note: 4B
	assign memory[	  5	] =	{1'd0, 6'd42, 6'd12, 3'd0};	// Note: 4D
	assign memory[	  6	] =	{1'd0,6'd47, 6'd12,3'd0};	// Note: 4G
	assign memory[	  7	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	  8	] =	{1'd0,6'd27, 6'd12, 3'd0};	// Note: 3B
	assign memory[	  9	] =	{1'd0,6'd54, 6'd12, 3'd0};	// Note: 5D
	assign memory[	  10	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 11	] =	{1'd0,6'd54, 6'd12, 3'd0};	// Note: 5D
	assign memory[	 12	] =	{1'd0,6'd47, 6'd12, 3'd0};	// Note: 4G
	assign memory[	 13	] =	{1'd0,6'd42, 6'd12, 3'd0};	// Note: 4D
	assign memory[	 14	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 15	] =	{1'd0,6'd56, 6'd12, 3'd0};	// Note: 5E
	assign memory[	 16	] =	{1'd0,6'd28, 6'd12, 3'd0};	// Note: 3C
	assign memory[	 17	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 18	] =	{1'd0,6'd44, 6'd12, 3'd0};	// Note: 4E
	assign memory[	 19	] =	{1'd0,6'd47, 6'd12, 3'd0};	// Note: 4G
	assign memory[	 20	] =	{1'd0,6'd56, 6'd12, 3'd0};	// Note: 5E
	assign memory[	 21	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 22	] =	{1'd0,6'd54, 6'd12, 3'd0};	// Note: 5D
	assign memory[	 23	] =	{1'd0,6'd27, 6'd12, 3'd0};	// Note: 3B
	assign memory[	 24	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 25	] =	{1'd0,6'd47, 6'd12, 3'd0};	// Note: 4G
	assign memory[	 26	] =	{1'd0,6'd42, 6'd12, 3'd0};	// Note: 4D
	assign memory[	 27	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 28	] =	{1'd0,6'd52, 6'd12, 3'd0};	// Note: 5C
	assign memory[	 29	] =	{1'd0,6'd25, 6'd12, 3'd0};	// Note: 3A
	assign memory[	 30	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 31	] =	{1'd0,6'd52, 6'd12, 3'd0};	// Note: 5C
	assign memory[	 32	] =	{1'd0,6'd46, 6'd12, 3'd0};	// Note: 4F#Gb
	assign memory[	 33	] =	{1'd0,6'd40, 6'd12,3'd0};	// Note: 4C
	assign memory[	 34	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 35	] =	{1'd0,6'd23, 6'd12,3'd0};	// Note: 2G
	assign memory[	 36	] =	{1'd0,6'd51, 6'd12,3'd0};	// Note: 5B
	assign memory[	 37	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 38	] =	{1'd0,6'd51, 6'd12,3'd0};	// Note: 5B
	assign memory[	 39	] =	{1'd0,6'd47, 6'd12,3'd0};	// Note: 4G
	assign memory[	 40	] =	{1'd0,6'd42, 6'd12,3'd0};	// Note: 4D
	assign memory[	 41	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 42	] =	{1'd0,6'd18, 6'd12,3'd0};	// Note: 2D
	assign memory[	 43	] =	{1'd0,6'd47, 6'd12,3'd0};	// Note: 4G
	assign memory[	 44	] =	{1'd0,6'd49, 6'd12,3'd0};	// Note: 5A
	assign memory[	 45	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 46	] =	{1'd0,6'd49, 6'd12,3'd0};	// Note: 5A
	assign memory[	 47	] =	{1'd0,6'd46, 6'd12,3'd0};	// Note: 4F#Gb
	assign memory[	 48	] =	{1'd0,6'd40, 6'd12,3'd0};	// Note: 4C
	assign memory[	 49	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 50	] =	{1'd0,6'd23, 6'd12,3'd0};	// Note: 2G
	assign memory[	 51	] =	{1'd0,6'd47, 6'd24,3'd0};	// Note: 4G
	assign memory[	 52	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 53	] =	{1'd0,6'd39, 6'd12,3'd0};	// Note: 4B
	assign memory[	 54	] =	{1'd0,6'd42, 6'd12,3'd0};	// Note: 4D
	assign memory[	 55	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 56	] =	{1'd0,6'd54, 6'd12,3'd0};	// Note: 5D
	assign memory[	 57	] =	{1'd0,6'd27, 6'd12,3'd0};	// Note: 3B
	assign memory[	 58	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 59	] =	{1'd0,6'd54, 6'd12,3'd0};	// Note: 5D
	assign memory[	 60	] =	{1'd0,6'd42, 6'd12,3'd0};	// Note: 4D
	assign memory[	 61	] =	{1'd0,6'd47, 6'd12,3'd0};	// Note: 4G
	assign memory[	 62	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 63	] =	{1'd0,6'd52, 6'd12,3'd0};	// Note: 5C
	assign memory[	 64	] =	{1'd0,6'd28, 6'd12,3'd0};	// Note: 3C
	assign memory[	 65	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 66	] =	{1'd0,6'd52, 6'd12,3'd0};	// Note: 5C
	assign memory[	 67	] =	{1'd0,6'd47, 6'd12,3'd0};	// Note: 4G
	assign memory[	 68	] =	{1'd0,6'd44, 6'd12,3'd0};	// Note: 4E
	assign memory[	 69	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 70	] =	{1'd0,6'd51, 6'd12,3'd0};	// Note: 5B
	assign memory[	 71	] =	{1'd0,6'd30, 6'd12,3'd0};	// Note: 3D
	assign memory[	 72	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 73	] =	{1'd0,6'd51, 6'd12,3'd0};	// Note: 5B
	assign memory[	 74	] =	{1'd0,6'd47, 6'd12,3'd0};	// Note: 4G
	assign memory[	 75	] =	{1'd0,6'd42, 6'd12,3'd0};	// Note: 4D
	assign memory[	 76	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 77	] =	{1'd0,6'd49, 6'd24,3'd0};	// Note: 5A
	assign memory[	 78	] =	{1'd0,6'd46, 6'd24,3'd0};	// Note: 4F#Gb
	assign memory[	 79	] =	{1'd0,6'd30, 6'd12,3'd0};	// Note: 3D
	assign memory[	 80	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 81	] =	{1'd0,6'd42, 6'd12,3'd0};	// Note: 4D
	assign memory[	 82	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 83	] =	{1'd0,6'd54, 6'd12,3'd0};	// Note: 5D
	assign memory[	 84	] =	{1'd0,6'd27, 6'd12,3'd0};	// Note: 3B
	assign memory[	 85	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 86	] =	{1'd0,6'd54, 6'd12,3'd0};	// Note: 5D
	assign memory[	 87	] =	{1'd0,6'd47, 6'd12,3'd0};	// Note: 4G
	assign memory[	 88	] =	{1'd0,6'd39, 6'd12,3'd0};	// Note: 4B
	assign memory[	 89	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 90	] =	{1'd0,6'd52, 6'd12,3'd0};	// Note: 5C
	assign memory[	 91	] =	{1'd0,6'd28, 6'd12,3'd0};	// Note: 3C
	assign memory[	 92	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 93	] =	{1'd0,6'd52, 6'd12,3'd0};	// Note: 5C
	assign memory[	 94	] =	{1'd0,6'd47, 6'd12,3'd0};	// Note: 4G
	assign memory[	 95	] =	{1'd0,6'd44, 6'd12,3'd0};	// Note: 4E
	assign memory[	 96	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 97	] =	{1'd0,6'd51, 6'd12,3'd0};	// Note: 5B
	assign memory[	 98	] =	{1'd0,6'd30, 6'd12,3'd0};	// Note: 3D
	assign memory[	 99	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 100	] =	{1'd0,6'd49, 6'd24,3'd0};	// Note: 5A
	assign memory[	101	] =	{1'd0,6'd47, 6'd12,3'd0};	// Note: 4G
	assign memory[	102	] =	{1'd0,6'd30, 6'd12,3'd0};	// Note: 3D
	assign memory[	103	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	104	] =	{1'd0,6'd46, 6'd12,3'd0};	// Note: 4F#Gb
	assign memory[	105	] =	{1'd0,6'd42, 6'd12,3'd0};	// Note: 4D
	assign memory[	106	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	107	] =	{1'd0,6'd23, 6'd12,3'd0};	// Note: 2G
	assign memory[	108	] =	{1'd0,6'd47, 6'd12,3'd0};	// Note: 4G
	assign memory[	109	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	110	] =	{1'd0,6'd39, 6'd12,3'd0};	// Note: 4B
	assign memory[	111	] =	{1'd0,6'd47, 6'd12,3'd0};	// Note: 4G
	assign memory[	112	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	113	] =	{1'd0,6'd27, 6'd12,3'd0};	// Note: 3B
	assign memory[	114	] =	{1'd0,6'd54, 6'd12,3'd0};	// Note: 5D
	assign memory[	115	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	116	] =	{1'd0,6'd54, 6'd12,3'd0};	// Note: 5D
	assign memory[	117	] =	{1'd0,6'd42, 6'd12,3'd0};	// Note: 4D
	assign memory[	118	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	119	] =	{1'd0,6'd56, 6'd12,3'd0};	// Note: 5E
	assign memory[	120	] =	{1'd0,6'd28, 6'd12,3'd0};	// Note: 3C
	assign memory[	121	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	122	] =	{1'd0,6'd44, 6'd12,3'd0};	// Note: 4E
	assign memory[	123	] =	{1'd0,6'd56, 6'd12,3'd0};	// Note: 5E
	assign memory[	124	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	125	] =	{1'd0,6'd54, 6'd24,3'd0};	// Note: 5D
	assign memory[	126	] =	{1'd0,6'd27, 6'd12,3'd0};	// Note: 3B
	assign memory[	127	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
endmodule			



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
					
	assign memory[	  0	] =	{1'd0,6'd23, 6'd12, 3'd1};	// Note: 2G
	assign memory[	  1	] =	{1'd0,6'd47, 6'd12,3'd2};	// Note: 4G
	assign memory[	  2	] =	{1'd0,6'd30, 6'd12,3'd4};	// Note: 3D
	assign memory[	  3	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	  4	] =	{1'd0,6'd39, 6'd12,3'd0};	// Note: 4B
	assign memory[	  5	] =	{1'd0, 6'd42, 6'd12, 3'd0};	// Note: 4D
	assign memory[	  6	] =	{1'd0,6'd47, 6'd12,3'd0};	// Note: 4G
	assign memory[	  7	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	  8	] =	{1'd0,6'd27, 6'd12, 3'd0};	// Note: 3B
	assign memory[	  9	] =	{1'd0,6'd54, 6'd12, 3'd0};	// Note: 5D
	assign memory[	  10	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 11	] =	{1'd0,6'd54, 6'd12, 3'd0};	// Note: 5D
	assign memory[	 12	] =	{1'd0,6'd47, 6'd12, 3'd0};	// Note: 4G
	assign memory[	 13	] =	{1'd0,6'd42, 6'd12, 3'd0};	// Note: 4D
	assign memory[	 14	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 15	] =	{1'd0,6'd56, 6'd12, 3'd0};	// Note: 5E
	assign memory[	 16	] =	{1'd0,6'd28, 6'd12, 3'd0};	// Note: 3C
	assign memory[	 17	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 18	] =	{1'd0,6'd44, 6'd12, 3'd0};	// Note: 4E
	assign memory[	 19	] =	{1'd0,6'd47, 6'd12, 3'd0};	// Note: 4G
	assign memory[	 20	] =	{1'd0,6'd56, 6'd12, 3'd0};	// Note: 5E
	assign memory[	 21	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 22	] =	{1'd0,6'd54, 6'd12, 3'd0};	// Note: 5D
	assign memory[	 23	] =	{1'd0,6'd27, 6'd12, 3'd0};	// Note: 3B
	assign memory[	 24	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 25	] =	{1'd0,6'd47, 6'd12, 3'd0};	// Note: 4G
	assign memory[	 26	] =	{1'd0,6'd42, 6'd12, 3'd0};	// Note: 4D
	assign memory[	 27	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 28	] =	{1'd0,6'd52, 6'd12, 3'd0};	// Note: 5C
	assign memory[	 29	] =	{1'd0,6'd25, 6'd12, 3'd0};	// Note: 3A
	assign memory[	 30	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 31	] =	{1'd0,6'd52, 6'd12, 3'd0};	// Note: 5C
	assign memory[	 32	] =	{1'd0,6'd46, 6'd12, 3'd0};	// Note: 4F#Gb
	assign memory[	 33	] =	{1'd0,6'd40, 6'd12,3'd0};	// Note: 4C
	assign memory[	 34	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 35	] =	{1'd0,6'd23, 6'd12,3'd0};	// Note: 2G
	assign memory[	 36	] =	{1'd0,6'd51, 6'd12,3'd0};	// Note: 5B
	assign memory[	 37	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 38	] =	{1'd0,6'd51, 6'd12,3'd0};	// Note: 5B
	assign memory[	 39	] =	{1'd0,6'd47, 6'd12,3'd0};	// Note: 4G
	assign memory[	 40	] =	{1'd0,6'd42, 6'd12,3'd0};	// Note: 4D
	assign memory[	 41	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 42	] =	{1'd0,6'd18, 6'd12,3'd0};	// Note: 2D
	assign memory[	 43	] =	{1'd0,6'd47, 6'd12,3'd0};	// Note: 4G
	assign memory[	 44	] =	{1'd0,6'd49, 6'd12,3'd0};	// Note: 5A
	assign memory[	 45	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 46	] =	{1'd0,6'd49, 6'd12,3'd0};	// Note: 5A
	assign memory[	 47	] =	{1'd0,6'd46, 6'd12,3'd0};	// Note: 4F#Gb
	assign memory[	 48	] =	{1'd0,6'd40, 6'd12,3'd0};	// Note: 4C
	assign memory[	 49	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 50	] =	{1'd0,6'd23, 6'd12,3'd0};	// Note: 2G
	assign memory[	 51	] =	{1'd0,6'd47, 6'd24,3'd0};	// Note: 4G
	assign memory[	 52	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 53	] =	{1'd0,6'd39, 6'd12,3'd0};	// Note: 4B
	assign memory[	 54	] =	{1'd0,6'd42, 6'd12,3'd0};	// Note: 4D
	assign memory[	 55	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 56	] =	{1'd0,6'd54, 6'd12,3'd0};	// Note: 5D
	assign memory[	 57	] =	{1'd0,6'd27, 6'd12,3'd0};	// Note: 3B
	assign memory[	 58	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 59	] =	{1'd0,6'd54, 6'd12,3'd0};	// Note: 5D
	assign memory[	 60	] =	{1'd0,6'd42, 6'd12,3'd0};	// Note: 4D
	assign memory[	 61	] =	{1'd0,6'd47, 6'd12,3'd0};	// Note: 4G
	assign memory[	 62	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 63	] =	{1'd0,6'd52, 6'd12,3'd0};	// Note: 5C
	assign memory[	 64	] =	{1'd0,6'd28, 6'd12,3'd0};	// Note: 3C
	assign memory[	 65	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 66	] =	{1'd0,6'd52, 6'd12,3'd0};	// Note: 5C
	assign memory[	 67	] =	{1'd0,6'd47, 6'd12,3'd0};	// Note: 4G
	assign memory[	 68	] =	{1'd0,6'd44, 6'd12,3'd0};	// Note: 4E
	assign memory[	 69	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 70	] =	{1'd0,6'd51, 6'd12,3'd0};	// Note: 5B
	assign memory[	 71	] =	{1'd0,6'd30, 6'd12,3'd0};	// Note: 3D
	assign memory[	 72	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 73	] =	{1'd0,6'd51, 6'd12,3'd0};	// Note: 5B
	assign memory[	 74	] =	{1'd0,6'd47, 6'd12,3'd0};	// Note: 4G
	assign memory[	 75	] =	{1'd0,6'd42, 6'd12,3'd0};	// Note: 4D
	assign memory[	 76	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 77	] =	{1'd0,6'd49, 6'd24,3'd0};	// Note: 5A
	assign memory[	 78	] =	{1'd0,6'd46, 6'd24,3'd0};	// Note: 4F#Gb
	assign memory[	 79	] =	{1'd0,6'd30, 6'd12,3'd0};	// Note: 3D
	assign memory[	 80	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 81	] =	{1'd0,6'd42, 6'd12,3'd0};	// Note: 4D
	assign memory[	 82	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 83	] =	{1'd0,6'd54, 6'd12,3'd0};	// Note: 5D
	assign memory[	 84	] =	{1'd0,6'd27, 6'd12,3'd0};	// Note: 3B
	assign memory[	 85	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 86	] =	{1'd0,6'd54, 6'd12,3'd0};	// Note: 5D
	assign memory[	 87	] =	{1'd0,6'd47, 6'd12,3'd0};	// Note: 4G
	assign memory[	 88	] =	{1'd0,6'd39, 6'd12,3'd0};	// Note: 4B
	assign memory[	 89	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 90	] =	{1'd0,6'd52, 6'd12,3'd0};	// Note: 5C
	assign memory[	 91	] =	{1'd0,6'd28, 6'd12,3'd0};	// Note: 3C
	assign memory[	 92	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 93	] =	{1'd0,6'd52, 6'd12,3'd0};	// Note: 5C
	assign memory[	 94	] =	{1'd0,6'd47, 6'd12,3'd0};	// Note: 4G
	assign memory[	 95	] =	{1'd0,6'd44, 6'd12,3'd0};	// Note: 4E
	assign memory[	 96	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 97	] =	{1'd0,6'd51, 6'd12,3'd0};	// Note: 5B
	assign memory[	 98	] =	{1'd0,6'd30, 6'd12,3'd0};	// Note: 3D
	assign memory[	 99	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	 100	] =	{1'd0,6'd49, 6'd24,3'd0};	// Note: 5A
	assign memory[	101	] =	{1'd0,6'd47, 6'd12,3'd0};	// Note: 4G
	assign memory[	102	] =	{1'd0,6'd30, 6'd12,3'd0};	// Note: 3D
	assign memory[	103	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	104	] =	{1'd0,6'd46, 6'd12,3'd0};	// Note: 4F#Gb
	assign memory[	105	] =	{1'd0,6'd42, 6'd12,3'd0};	// Note: 4D
	assign memory[	106	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	107	] =	{1'd0,6'd23, 6'd12,3'd0};	// Note: 2G
	assign memory[	108	] =	{1'd0,6'd47, 6'd12,3'd0};	// Note: 4G
	assign memory[	109	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	110	] =	{1'd0,6'd39, 6'd12,3'd0};	// Note: 4B
	assign memory[	111	] =	{1'd0,6'd47, 6'd12,3'd0};	// Note: 4G
	assign memory[	112	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	113	] =	{1'd0,6'd27, 6'd12,3'd0};	// Note: 3B
	assign memory[	114	] =	{1'd0,6'd54, 6'd12,3'd0};	// Note: 5D
	assign memory[	115	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	116	] =	{1'd0,6'd54, 6'd12,3'd0};	// Note: 5D
	assign memory[	117	] =	{1'd0,6'd42, 6'd12,3'd0};	// Note: 4D
	assign memory[	118	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	119	] =	{1'd0,6'd56, 6'd12,3'd0};	// Note: 5E
	assign memory[	120	] =	{1'd0,6'd28, 6'd12,3'd0};	// Note: 3C
	assign memory[	121	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	122	] =	{1'd0,6'd44, 6'd12,3'd0};	// Note: 4E
	assign memory[	123	] =	{1'd0,6'd56, 6'd12,3'd0};	// Note: 5E
	assign memory[	124	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
	assign memory[	125	] =	{1'd0,6'd54, 6'd24,3'd0};	// Note: 5D
	assign memory[	126	] =	{1'd0,6'd27, 6'd12,3'd0};	// Note: 3B
	assign memory[	127	] =	{1'd1, 6'd0, 6'd12,3'd0};	// Note: rest
endmodule			
