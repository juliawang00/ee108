module mux(input on,
  output wire rear_light);
  reg light;
  always @(*) begin
    case(on):
      1'b1: light = 1'b1;
      1'b0: light = 1'b0;
      default: light = 1'b0;
    endcase
  end
  assign rear_light = light;
endmodule
