module adder_tb ();
  
  reg[4:0] in1;
  reg[4:0] in2;

  wire[4:0] out;
  wire cout;

  adder #() DUT(.in1(in1), .in2(in2), .sum(out), .cout(cout));

 initial begin
    in1 = 5'd25; 
  	in2 = 5'd24;
  
    #100 $display("%03d + %03d = %03d with %03d", in1, in2, out, cout);

    in1 = 5'd1; 
    in2 = 5'd2;

    #100 $display("%03d + %03d = %03d with %03d", in1, in2, out, cout);

    in1 = 5'd31; 
    in2 = 5'd2;

    #100 $display("%03d + %03d = %03d with %03d", in1, in2, out, cout);

    in1 = 5'd1; 
    in2 = 5'd0;

    #100 $display("%03d + %03d = %03d with %03d", in1, in2, out, cout);

    in1 = 5'd0; 
    in2 = 5'd0;

    #100 $display("%03d + %03d = %03d with %03d", in1, in2, out, cout);


  end

endmodule
