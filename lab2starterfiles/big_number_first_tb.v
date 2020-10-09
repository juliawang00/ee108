module shifter_tb ();

  reg [7:0] aIn;
  reg [7:0] bIn;
  wire [7:0] aOut;
  wire [7:0] bOut;

  big_number_first dut(.aIn(aIn), .bIn(bIn), .aOut(aOut), .bOut(bOut));
  
  initial begin
    // Test Case 1
    aIn = 8'b00100000;
    bIn = 8'b01000000;
    #5
    $display("aIn is %b, and bIn is %b", aIn, bIn);
    $display("Expected: aOut is %d, bOut is %d", aOut, bOut); 
    $display("Expected aOut: %d, Expected bOut: %d", 8'b01000000, 8'b00100000); 
    
    
    // Test Case 2
    aIn = 8'b01100000;
    bIn = 8'b01000000;
    #5
    $display("aIn is %b, and bIn is %b", aIn, bIn);
    $display("aOut is %d, bOut is %d", aOut, bOut); 
    $display("Expected aOut: %d, Expected bOut: %d", 8'b01100000, 8'b01000000); 
    
    // Test Case 3
    aIn = 8'b01000010;
    bIn = 8'b01000000;
    #5
    $display("aIn is %b, and bIn is %b", aIn, bIn);
    $display("aOut is %d, bOut is %d", aOut, bOut); 
    $display("Expected aOut: %d, Expected bOut: %d", 8'b01000000, 8'b01000010); 
    $display("Since these numbers' 3 most significant bits are the same, the outputs do not matter. Chose these two to show that a smaller number could be a valid aOut output");
    
  end



endmodule
