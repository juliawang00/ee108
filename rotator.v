module rotator #(parameter WIDTH=8, parameter DISTANCE=8) 
(
  input wire[WIDTH-1:0] in, 
  input wire direction,
  input wire[DISTANCE-1:0] distance,
  output wire[WIDTH-1:0] out
);

  // Declarations
  wire[WIDTH*2-1:0] double_in, double_rot_l, double_rot_r; 
  wire[WIDTH-1:0] rot_l, rot_r;
	
	// Rotating logic
  assign double_in = {2{in}};
  
  // right rotation
  assign double_rot_r = double_in >> distance; 
  assign rot_r = double_rot_r[WIDTH-1:0];
  
  // left rotation
  assign double_rot_l = double_in << distance;
  assign rot_l = double_rot_l[WIDTH*2-1:WIDTH];
	
	// Output mux logic
  assign out = direction ? rot_l : rot_r;
	
endmodule
