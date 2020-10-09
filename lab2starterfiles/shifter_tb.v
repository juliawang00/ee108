module shifter_tb (

);

  reg [4:0] i;
  reg [2:0] d;
  reg di;
  wire [4:0] o;

  shifter dut(.in(i), .distance(d), .direction(di), .out(o));
  
  initial begin
    // Test Case 1
    i = 5'b01000;
    d = 3'b001;
    di = 1'b1;
    #5
    $display("Input is %b, we are shifting %b", i, d);
    $display("Output is %b, we expected %b", o, 5'b00100);
    
    // Test Case 2
    i = 5'b01101;
    d = 3'b010;
    di = 1'b1;
    #5
    $display("Input is %b, we are shifting %b", i, d);
    $display("Output is %b, we expected %b", o, 5'b00011);
    
    // Test Case 3
    i = 5'b00101;
    d = 3'b011;
    di = 1'b1;
    #5
    $display("Input is %b, we are shifting %b", i, d);
    $display("Output is %b, we expected %b", o, 5'b01000);
  end



endmodule
