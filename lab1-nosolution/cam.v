module cam ( 
  input wire [63:0] data, 
  input wire [3:0] data_len, 
  output wire [2:0] addr, 
  output wire valid
);

	// wire declarations
	wire[67:0] data_word;	
	wire[7:0] entry_matches;

	assign data_word = {data_len, data};	

	// init users
  wire[67:0] user0 = 68'h3_00000000004F454C; // leo
  wire[67:0] user1 = 68'h5_0000004E4F524141; // aaron
  wire[67:0] user2 = 68'h5_000000594C4C4F48; // holly
  wire[67:0] user3 = 68'h5_0000004449564144; // david
  wire[67:0] user4 = 68'h6_0000455249414C43; // claire
  wire[67:0] user5 = 68'h5_0000004B4E415246; // frank
  wire[67:0] user6 = 68'h5_00000045434E414C; // lance
  wire[67:0] user7 = 68'h4_000000004E415952; // ryan


	// 8 equality comparisons
	assign entry_matches[0] = (data_word == user0);
	assign entry_matches[1] = (data_word == user1);
	assign entry_matches[2] = (data_word == user2);
	assign entry_matches[3] = (data_word == user3);
	assign entry_matches[4] = (data_word == user4);
	assign entry_matches[5] = (data_word == user5);
	assign entry_matches[6] = (data_word == user6);
	assign entry_matches[7] = (data_word == user7);

	// encoder instantiation
	encoder ENC(.in(entry_matches), .out(addr));	

	// valid logic
	assign valid = |entry_matches;

endmodule
