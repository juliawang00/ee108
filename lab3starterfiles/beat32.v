module beat32 #(parameter n = 22)
  ( input clk, rst,  	// Clock, Reset, Value to be loaded into 
   input [n-1:0] load,
   output wire [n-1:0] done	// Output high when counter reaches zero
);
  wire [n-1:0] next;
  wire [n-1:0] nextState;
  
  // Initiate flip flop
  dffr #(n) count(clk, rst, nextState, next);
  
  // Update the input state with load when output state is zero, otherwise -1
  assign nextState = (next == 0) ? load -1 : next - 1;

  // Output 1 if dffr output is zero
  assign done = (next == 0) ? 1 : 0;
  
endmodule
