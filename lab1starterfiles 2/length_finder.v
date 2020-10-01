module length_finder (
  input wire [63:0] string, 
  output wire [3:0] length
);

	// wire declarations
	wire [7:0] byte0 = string[7:0];
	wire [7:0] byte1 = string[15:8];
	wire [7:0] byte2 = string[23:16];
	wire [7:0] byte3 = string[31:24];
	wire [7:0] byte4 = string[39:32];
	wire [7:0] byte5 = string[47:40];
	wire [7:0] byte6 = string[55:48];
	wire [7:0] byte7 = string[63:56];

	wire[7:0] is_character_null;
	wire[7:0] first_null;

  // is_character_null logic: a byte is null all of the
  // bits in that byte are 0
	assign is_character_null[0] = ~(|byte0);
	assign is_character_null[1] = ~(|byte1);
	assign is_character_null[2] = ~(|byte2);
	assign is_character_null[3] = ~(|byte3);
	assign is_character_null[4] = ~(|byte4);
	assign is_character_null[5] = ~(|byte5);
	assign is_character_null[6] = ~(|byte6);
	assign is_character_null[7] = ~(|byte7);
	
	// arbiter
  arbiter ARB (.in(is_character_null), .out (first_null));	
	encoder ENC (.in(first_null),        .out(length[2:0]));
	assign length[3] = (is_character_null == 8'b0);
	
endmodule
