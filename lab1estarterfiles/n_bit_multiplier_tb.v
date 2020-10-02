`timescale 1ns / 1ps

module n_bit_multiplier_tb ();

reg [3:0] in0, in1 ;

wire [7:0] out;


n_bit_multiplier #(4) DUT(.a(in0), .b(in1), .p(out));

initial begin
    in0 = 4'd0; in1 = 4'd0;
    #100 $display("%03d * %03d = %03d ", in0, in1, out) ;
    // Check all possibilities for two different width multiplier modules of Width >= 3

end

endmodule