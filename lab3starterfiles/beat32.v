module beat32 #(parameter n = 22)
  ( input clk, 
//     input reset, 	// Standard system clock and reset
    input load, 	// Value to be loaded into countdown: 22'd3125000
    output wire done	// 
);
  reg [n-1:0] next;
  wire [n-1:0] nextState;
  
  dff #(n) count(clk, next, nextState);
  
  
  always @(*) begin
    if (!(|next)) begin
      nextState = load;
    end
    else if((|next)) begin
      nextState = next - 1'b1;
    end
    else begin
      next = nextState;
    end
  end
  
//   always @(*) begin
//     case(out)
//       22'b0: next = in;
//       1'b0: next = out + 22'b1;      
//     endcase
//   end
  
  assign done = !(|next);

endmodule
