module combiner(
  input [15:0] song_one, 
  input [15:0] song_two,
  input [15:0] song_three,

  output [15:0] out
);
  
  wire [15:0] added = ((song_one>>2) + (song_two>>2) + (song_three>>2));
  
  assign out = added;
 
endmodule
