module shifter_tb (

);

  reg [4:0] i;
  reg [2:0] d;
  reg di;
  wire [4:0] o;

  shifter dut(.in(i), .distance(d), .direction(di), .out(o));
  
  initial begin
    // Test Case 1: Bit shifting right once
    i = 5'b01000;
    d = 3'b001;
    di = 1'b1;
    #5
    $display("Input is %b, we are shifting %b towards %b", i, d, di);
    $display("Output is %b, we expected %b", o, 5'b00100);
    
    // Test Case 2: Bit shifting right five times -> all zeros
    i = 5'b01101;
    d = 3'b111;
    di = 1'b1;
    #5
    $display("Input is %b, we are shifting %b towards %b", i, d, di);
    $display("Output is %b, we expected %b", o, 5'b00011);
    
    // Test Case 3: Bit shifting left zero times -> i is unchanged
    i = 5'b11111;
    d = 3'b0;
    di = 1'b1;
    #5
    $display("Input is %b, we are shifting %b towards %b", i, d, di);
    $display("Output is %b, we expected %b", o, 5'b00000);
    
    // Test Case 4: Bit shifting left three times
    i = 5'b00101;
    d = 3'b011;
    di = 1'b0;
    #5
    $display("Input is %b, we are shifting %b towards %b", i, d, di);
    $display("Output is %b, we expected %b", o, 5'b01000);
    
    // Test Case 5: Bit shifting left zero times -> i is unchanged
    i = 5'b11111;
    d = 3'b0;
    di = 1'b0;
    #5
    $display("Input is %b, we are shifting %b towards %b", i, d, di);
    $display("Output is %b, we expected %b", o, 5'b00000);
    
    // Test Case 6: Bit shifting left five times -> all zeros
    i = 5'b11111;
    d = 3'b111;
    di = 1'b0;
    #5
    $display("Input is %b, we are shifting %b towards %b", i, d, di);
    $display("Output is %b, we expected %b", o, 5'b00000);
  end



endmodule
