module arbiter (
    input wire [7:0] in,
    output reg[2:0] out    
);
   
	// module body goes here
	 always @(*) begin
    casex (in)
      8'bxxxxxxx1: out = 8'b1;
      8'bxxxxxx10: out = 8'b10;
      8'bxxxxx100: out = 8'b100;
      8'bxxxx1000: out = 8'b1000;
      8'bxxx10000: out = 8'b10000;
      8'bxx100000: out = 8'b100000;
      8'bx1000000: out = 8'b1000000;
      8'b10000000: out = 8'b10000000;
      default: out = 8'b0;
    endcase
  end

endmodule
