module beat32 #(parameter n = 22)
  ( input clk, 
    input load, 	// Value to be loaded into countdown: 22'd3125000
    output wire done	// Output high when counter reaches zero
);
  wire [n-1:0] next;
  reg [n-1:0] nextState;
  
  dff #(n) count(clk, nextState, next);
  
  // Counter: Decrement unless next is all zeros. Then set to load.
  always @(*) begin
    if (!(|next)) begin
      nextState = load;
    end
    else if((|next)) begin
      nextState = next - 1'b1;
    end
    else begin
       nextState = next;
    end
  end
  
  // Output high when counter reaches zero
  assign done = !(|next);

endmodule
