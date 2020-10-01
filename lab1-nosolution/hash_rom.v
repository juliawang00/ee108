module hash_rom(
  input wire [2:0] addr, 
  output reg [31:0] data
);

  always@(*) begin
    case(addr)
      3'd0: data = 32'hDC1A2C9E;
      3'd1: data = 32'hDC2EA8E4;
      3'd2: data = 32'h355FACC3;
      3'd3: data = 32'hAAF4ADC9;
      3'd4: data = 32'h13D41CED;
      3'd5: data = 32'h7EBCF8A8;
      3'd6: data = 32'hF3CDDB9B;
      3'd7: data = 32'h9948E6BE;
      default: data = 0; 
    endcase
  end 

endmodule
