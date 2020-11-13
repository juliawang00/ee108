// Module Name: arbiter.v


module arbiter(
    input  wire [2:0] bit_i,
    output reg [2:0] bit_o
    );
    
    always @ (*) begin
      if bit_i[2]
          bit_o = 3'b100;
      else if bit_i[1]
          bit_o = 3'b010;
      else if bit_i[0] 
          bit_o = 3'b001;
      else
          bit_o = 3'b000;
    end

endmodule
