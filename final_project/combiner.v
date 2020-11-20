module combiner(
  input [15:0] song_one, 
  input [15:0] song_two,
  input [15:0] song_three,

  output [15:0] out
);
  
  wire [17:0] added = (song_one + song_two + song_three);
  
  assign out = added[17] ? added[17:2] : added[16] ? added[16:1] : added[15:0];
 
endmodule
