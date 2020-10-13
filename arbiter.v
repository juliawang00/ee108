module arbiter (
  input wire [7:0] in, 
  output reg [7:0] out
);

  // Output a one hot value where the 1 bit is
  // in the same location as the least significant 1 of 
  // the in wire. If no 1s in the input, then output 0.
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
