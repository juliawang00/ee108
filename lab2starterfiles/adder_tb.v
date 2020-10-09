module adder_tb ();
  
  reg[4:0] in1;
  reg[4:0] in2;

  wire[4:0] out;
  wire cout;

  adder #() DUT(.in1(in1), .in2(in2), .sum(out), .cout(cout));

 initial begin
   
    // Test Case 1: Random Numbers to have cout
    in1 = 5'd25; 
  	in2 = 5'd24;
  
    #100 $display("%03d + %03d = %03d with %03d", in1, in2, out, cout);

   // Test Case 2: Random Numbers to not have cout
    in1 = 5'd1; 
    in2 = 5'd2;

    #100 $display("%03d + %03d = %03d with %03d", in1, in2, out, cout);

   // Test Case 3: Large Number with small number with cout
    in1 = 5'd31; 
    in2 = 5'd2;

    #100 $display("%03d + %03d = %03d with %03d", in1, in2, out, cout);

   // Test Case 4: Low Numbers with no cout
    in1 = 5'd1; 
    in2 = 5'd0;

    #100 $display("%03d + %03d = %03d with %03d", in1, in2, out, cout);

   //Test Case 5: All zeros
    in1 = 5'd0; 
    in2 = 5'd0;

    #100 $display("%03d + %03d = %03d with %03d", in1, in2, out, cout);
   
   //Test Case 6: Max numbers
    in1 = 5'd31; 
    in2 = 5'd31;

    #100 $display("%03d + %03d = %03d with %03d", in1, in2, out, cout);


  end

endmodule
