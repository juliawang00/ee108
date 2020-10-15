// Code your testbench here
// or browse Examples
module beat32_tb ();
  reg clk, reset;
  reg [21:0] load;
  wire done;
  
  
  
  beat32 #() DUT(.clk(clk), .rst(reset), .load(load), .done(done));
  initial
    forever begin
      #5 clk = 1;
      #5 clk = 0;
    end
  
  initial begin
    load = 22'd3125000;
    $display(load);
    #10 reset = 0; // start without reset (x state)
    #10 $display("First Reset: out %b", done);
    #20 reset = 1;
    #10 $display("Second Reset: out %b", done);
    #10 reset = 0; // remove reset  
    
    #10 $display("Third Reset: out %b", done);
    #10
    $display("The output has gone to %b", done);
    #10
    $display("The output has gone to %b", done);
    #10
    $display("The output has gone to %b", done);
    #10
    $display("The output has gone to %b", done);
    #10
    $display("The output has gone to %b", done);
    #10
    $display("The output has gone to %b", done);
    #10
    $display("The output has gone to %b", done);
    #10
    $display("The output has gone to %b", done);
    #10
    $display("The output has gone to %b", done);
    #10
    $display("The output has gone to %b", done);
    #10
    $display("The output has gone to %b", done);
    #10
    $display("The output has gone to %b", done);
    #10
    $display("The output has gone to %b", done);
    #10
    $display("The output has gone to %b", done);
    #10
    $display("The output has gone to %b", done);
    #10
    $display("The output has gone to %b", done);
    #10
    $display("The output has gone to %b", done);
    #10
    $display("The output has gone to %b", done);
    #10
    $display("The output has gone to %b", done);
    #10
    $display("The output has gone to %b", done);
    #10
    $display("The output has gone to %b", done);
    #10
    $display("The output has gone to %b", done);
    #10
    $display("The output has gone to %b", done);
    #10
    $display("The output has gone to %b", done);
    #10
    $display("The output has gone to %b", done);
    #10
    $display("The output has gone to %b", done);
    #10
    $display("The output has gone to %b", done);
    #10
    $display("The output has gone to %b", done);
    #10
    $display("The output has gone to %b", done);
    #10
    $display("The output has gone to %b", done);
    #10
    $display("The output has gone to %b", done);
    #10
    $display("The output has gone to %b", done);
    $stop;
    
  end

endmodule
