module mux(
  input [1:0] state,
  input fast_blink,
  input slow_blink,
  output wire rear_light);
  
  
  reg light;
  always @(*) begin
    case(state)
      2'b00: light = 1'b0; // OFF STATE
      2'b01: light = 1'b1; // ON STATE
      2'b10: light = fast_blink; // FLASH 1
      2'b11: light = slow_blink; // FLASH 2
      default: light = 1'b0;
    endcase
  end
  assign rear_light = light;
endmodule
