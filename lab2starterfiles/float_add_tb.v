module float_add_tb ();

// your implementation goes here!
  reg [7:0] aIn;
  reg [7:0] bIn;
  
  wire[7:0] out;
  
  
  float_add #() DUT(.aIn(aIn), .bIn(bIn), .result(out));
  
   initial begin
     
     // Test Case 1: Exponents 0, no carry
    aIn = 8'b00001000; 
  	bIn = 8'b00000011;
  
     #100 $display("%b + %b = %b", aIn, bIn, out);
     
     // Test Case 2: Exponent one, no carry
    aIn = 8'b00110001; 
  	bIn = 8'b00001100;
  
     #100 $display("%b + %b = %b", aIn, bIn, out);
     
     // Test Case 3: High Exponents, with carry
    aIn = 8'b10010010; 
  	bIn = 8'b01111111;
  
     #100 $display("%b + %b = %b", aIn, bIn, out);
     
     // Test Case 4: Saturation
    aIn = 8'b11111110; 
  	bIn = 8'b11111000;
  
     #100 $display("%b + %b = %b", aIn, bIn, out);
     
     // Test Case 5: Saturation
    aIn = 8'b11111110; 
  	bIn = 8'b11111110;
  
     #100 $display("%b + %b = %b", aIn, bIn, out);
     
     //Test Case 6: Adding zeros
    aIn = 8'b00000000; 
  	bIn = 8'b00000000;
  
     #100 $display("%b + %b = %b", aIn, bIn, out);
     
     // Test Case 7: Adding with zero
    aIn = 8'b00000000; 
  	bIn = 8'b00010000;
  
     #100 $display("%b + %b = %b", aIn, bIn, out);
     
     // Test Case 8: Adding the extremities
    aIn = 8'b00000000; 
  	bIn = 8'b11111111;
  
     #100 $display("%b + %b = %b", aIn, bIn, out);
     
     //Test Case 9: Adding to get highest representable number without saturation
     aIn = 8'b11011111; 
  	 bIn = 8'b11011111;
  
     #100 $display("%b + %b = %b", aIn, bIn, out);
   end



endmodule
