module beat32 #(parameter n = 22)
  ( input clk, 
//     input reset, 	// Standard system clock and reset
    input in, 	// Value to be loaded into countdown: 22'd3125000
    output wire done	// 
);
  reg [n-1:0] next;
  wire [n-1:0] nextstate;
  
  DFF #(n) count(clk, next, nextstate);
  
  
  always@(*) begin
    if (!(|next)) begin
      next = in;
    end
    else if((|next)) begin
      next = nextstate - 1'b1;
    end
    else begin
      next = nextstate;
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
