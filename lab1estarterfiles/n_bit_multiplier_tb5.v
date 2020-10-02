`timescale 1ns / 1ps

module n_bit_multiplier_tb ();

reg [3:0] in0, in1 ;

wire [7:0] out;


n_bit_multiplier #(4) DUT(.a(in0), .b(in1), .p(out));

initial begin
    in0 = 4'd0; in1 = 4'd0;
    #100 $display("%03d * %03d = %03d ", in0, in1, out) ;
    // Check all possibilities for two different width multiplier modules of Width >= 3
    
    in0 = 4'b0001; in1 = 4'b0010;
  #100 $display("%03b * %03b = %03b ", in0, in1, out) ;
    
    in0 = 4'b0110; in1 = 4'b1110;
  #100 $display("%b * %b = %b ", in0, in1, out) ;
  
      in0 = 4'b0110; in1 = 4'b1000;
  #100 $display("%03b * %03b = %03b ", in0, in1, out) ;
    
    in0 = 4'b0011; in1 = 4'b1010;
  #100 $display("%b * %b = %b ", in0, in1, out) ;

end

endmodule
