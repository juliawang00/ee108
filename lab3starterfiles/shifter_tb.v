module shifter_tb ();

  reg shift_right;
  reg [3:0] state;
  
  wire [3:0] out;
  
  shifter dut(.shift_right(shift_right), .state(state), .out(out));
  
  initial begin
    
    shift_right = 1'b1;
    state = 4'b0001;
    #100 $display("Input is %b, we are shifting %b result is  %b", state, shift_right, out);
    
    shift_right = 1'b1;
    state = 4'b0010;
    #100 $display("Input is %b, we are shifting %b result is  %b", state, shift_right, out);
    
    shift_right = 1'b1;
    state = 4'b0100;
    #100 $display("Input is %b, we are shifting %b result is  %b", state, shift_right, out);
    
    shift_right = 1'b1;
    state = 4'b1000;
    #100 $display("Input is %b, we are shifting %b result is  %b", state, shift_right, out);
    
    shift_right = 1'b0;
    state = 4'b1000;
    #100 $display("Input is %b, we are shifting %b result is  %b", state, shift_right, out);
    
    shift_right = 1'b0;
    state = 4'b0100;
    #100 $display("Input is %b, we are shifting %b result is  %b", state, shift_right, out);
    
     shift_right = 1'b0;
    state = 4'b0010;
    #100 $display("Input is %b, we are shifting %b result is  %b", state, shift_right, out);
    
    shift_right = 1'b0;
    state = 4'b0001;
    #100 $display("Input is %b, we are shifting %b result is  %b", state, shift_right, out);
    
  end

endmodule
