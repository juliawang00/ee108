module combiner_echo(
  input [15:0] song_one, 
  input [15:0] song_two,
  input [15:0] song_three,

  output [15:0] out
);
  `define WIDTH 18
  
  wire [17:0] added = (song_one + song_two + song_three);
  wire [17:0] added_with_delay = (added + (delayed >> 2));
  wire [17:0] delayed = 18'b0;
  
  dffr #(`WIDTH) echo (
    .clk(clk),
    .r(reset),
    .d(added),
    .q(delayed)
  );
  
  assign out = added_with_delay >> ((added_with_delay[17]) ? 2 : (added_with_delay[16]) ? 1 : 0);
 
endmodule
