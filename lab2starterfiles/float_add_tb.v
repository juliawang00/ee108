module float_add_tb ();

// your implementation goes here!
  reg [7:0] aIn;
  reg [7:0] bIn;
  
  wire[7:0] out;
  
  
  float_add #() DUT(.aIn(aIn), .bIn(bIn), .result(out));
  
   initial begin
    aIn = 8'b00001000; 
  	bIn = 8'b00000011;
  
     #100 $display("%b + %b = %b", aIn, bIn, out);
     
    aIn = 8'b00110001; 
  	bIn = 8'b00001100;
  
     #100 $display("%b + %b = %b", aIn, bIn, out);
     
    aIn = 8'b10010010; 
  	bIn = 8'b01011111;
  
     #100 $display("%b + %b = %b", aIn, bIn, out);
     
    aIn = 8'b11111110; 
  	bIn = 8'b11111000;
  
     #100 $display("%b + %b = %b", aIn, bIn, out);
     
    aIn = 8'b11111110; 
  	bIn = 8'b11111110;
  
     #100 $display("%b + %b = %b", aIn, bIn, out);
     
    aIn = 8'b00000000; 
  	bIn = 8'b00000000;
  
     #100 $display("%b + %b = %b", aIn, bIn, out);
     
    aIn = 8'b00000000; 
  	bIn = 8'b00010000;
  
     #100 $display("%b + %b = %b", aIn, bIn, out);
     
    aIn = 8'b00000000; 
  	bIn = 8'b11111111;
  
     #100 $display("%b + %b = %b", aIn, bIn, out);
     
   end



endmodule
