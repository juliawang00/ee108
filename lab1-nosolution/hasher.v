module hasher (
  input wire[63:0] data, 
  input wire[3:0] data_len, 
  output wire[31:0] hash
);

  wire[31:0] out0, out1, out2, out3, out4, out5, out6, out7;
  wire[31:0] final_state = out6 ^ out7;
  
  hash_round #(.ROUND(0)) HR0(.in_byte(data[7:0]),   .in_state(32'h55555555), .out_state(out0));
  hash_round #(.ROUND(2)) HR2(.in_byte(data[23:16]), .in_state(out0),         .out_state(out2));
  hash_round #(.ROUND(4)) HR4(.in_byte(data[39:32]), .in_state(out2),         .out_state(out4));
  hash_round #(.ROUND(6)) HR6(.in_byte(data[55:48]), .in_state(out4),         .out_state(out6));
  
  hash_round #(.ROUND(1)) HR1(.in_byte(data[15:8]),  .in_state(32'hAAAAAAAA), .out_state(out1));
  hash_round #(.ROUND(3)) HR3(.in_byte(data[31:24]), .in_state(out1),         .out_state(out3));
  hash_round #(.ROUND(5)) HR5(.in_byte(data[47:40]), .in_state(out3),         .out_state(out5));
  hash_round #(.ROUND(7)) HR7(.in_byte(data[63:56]), .in_state(out5),         .out_state(out7));

  rotator #(.WIDTH(32), .DISTANCE(5)) ROT (.in(final_state), .out(hash), .distance(final_state[4:0]), .direction(^data_len));
	
endmodule
