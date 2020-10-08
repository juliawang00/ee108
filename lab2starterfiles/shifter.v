// Shifts the bits of in by distance to the
// left if direction = 0, right if direction = 1
module shifter (
  input [4:0] in,
  input [2:0] distance,
  input direction,
  output [4:0] out
);
  out = 5{0};
  int shift_size = out.size - distance
  
  if(direction == 0) begin
    out[4:shift_size] = in[shift_size:0];
  end
  
  else if(direction == 1) begin
    out[shift_size:0] = in[4:shift_size];
  end

endmodule
