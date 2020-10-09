// Shifts the bits of in by distance to the
// left if direction = 0, right if direction = 1
module shifter (
  input wire [4:0] in,
  input wire [2:0] distance,
  input wire direction,
  output wire [4:0] out
);
  reg [4:0] shifted;
  always @* begin
    if(direction == 1'b0) begin
      shifted = in << distance;
    end

    if(direction == 1'b1) begin
      shifted = in >> distance;
    end
  end
  
  assign out = shifted;

endmodule
