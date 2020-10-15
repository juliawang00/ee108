module mux(
  input [1:0] state,
  input fast_blink,
  input slow_blink,
  output wire rear_light);
  
  
  reg light;
  always @(*) begin
    case(state):
      2'b00: light = 0'b0;
      2'b01: light = 0'b1;
      2'b10: light = fast_blink;
      2'b11: light = slow_blink;
  end
  assign rear_light = light;
endmodule
