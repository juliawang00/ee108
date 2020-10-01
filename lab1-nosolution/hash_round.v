module hash_round #(parameter ROUND = 0)
(
  input wire [31:0] in_state, 
  input wire [7:0] in_byte, 
  output wire [31:0] out_state
);
	// Declarations
	wire [7:0] mixed_a = mix + a + in_byte;
	wire [7:0] rotated_mixed_a;	
	reg [7:0] mix;	
	
	// State splitting
	wire [7:0] a, b, c, d;
	assign {d, c, b, a} = in_state;

	// Mix function
	always @(*) begin
    if (ROUND>=0 && ROUND<=2) begin
      mix = (c & b) | (d & ~b);
		end else if(ROUND >= 3 && ROUND <=4) begin
      mix = (c & b) | (b & d) | (d & c);
		end else begin
      mix = c ^ b ^ d;
		end
  end

	// Rotator
	rotator #(.WIDTH(8), .DISTANCE(8)) ROT (.in(mixed_a), .out(rotated_mixed_a), .direction(1'b1), .distance(ROUND));		
	// Output state assignment
	assign out_state = {c, b, rotated_mixed_a, d};
endmodule
