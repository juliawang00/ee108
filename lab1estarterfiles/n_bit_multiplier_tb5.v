`timescale 1ns / 1ps

module n_bit_multiplier_tb ();

  reg [4:0] in0, in1 ;

  wire [9:0] out;


  n_bit_multiplier #(5) DUT(.a(in0), .b(in1), .p(out));

initial begin
    in0 = 5'd0; in1 = 5'd0;
    #100 $display("%03d * %03d = %03d ", in0, in1, out) ;
    // Check all possibilities for two different width multiplier modules of Width >= 3
    
    in0 = 5'b00001; in1 = 5'b10010;
  #100 $display("%03b * %03b = %03b ", in0, in1, out) ;
    
    in0 = 5'b10110; in1 = 5'b01110;
  #100 $display("%b * %b = %b ", in0, in1, out) ;
  
      in0 = 5'b00110; in1 = 5'b11000;
  #100 $display("%03b * %03b = %03b ", in0, in1, out) ;
    
    in0 = 5'b10011; in1 = 5'b01010;
  #100 $display("%b * %b = %b ", in0, in1, out) ;

end

endmodule
