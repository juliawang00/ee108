module beat32_tb ();
  reg clk, reset;
  reg [21:0] load;
  wire [21:0]done;
  
  
  // Initiate beat module
  beat32 #() DUT(.clk(clk), .rst(reset), .load(load), .done(done));
  
  // Initiate clock. Set to 10 unit intervals for testing purposes (3125000 cycles is too much)
  initial
    forever begin
      #5 clk = 1;
      #5 clk = 0;
    end
  
  // Initiate by resetting the clock and beginning countdown. There should be an output of one every ten cycles.
  initial begin
    load = 22'd10;
    $display("Load value: %d", load);
    
    #10 reset = 0; // start without reset (x state)
    #10 $display("Reset at Zero, done should be high next: done %d", done);
    #10 reset = 1;
    #10 $display("Reset at One, Load is set: done %d", done);
    #10 reset = 0; // remove reset  
    
    #10 $display("2: Reset back at zero: done %d", done);
    #10
    $display("3: The output has gone to %d", done);
    #10
    $display("4: The output has gone to %d", done);
    #10
    $display("5: The output has gone to %d", done);
    #10
    $display("6: The output has gone to %d", done);
    #10
    $display("7: The output has gone to %d", done);
    #10
    $display("8: The output has gone to %d", done);
    #10
    $display("9: The output has gone to %d", done);
    #10
    $display("10: The output has gone to %d", done);
    #10
    $display("11: The output has gone to %d", done);
    #10
    $display("12: The output has gone to %d", done);
    #10
    $display("13: The output has gone to %d", done);
    #10
    $display("14: The output has gone to %d", done);
    #10
    $display("15: The output has gone to %d", done);
    #10
    $display("16: The output has gone to %d", done);
    #10
    $display("17: The output has gone to %d", done);
    #10
    $display("18: The output has gone to %d", done);
    #10
    $display("19: The output has gone to %d", done);
    #10
    $display("20: The output has gone to %d", done);
    #10
    $display("21: The output has gone to %d", done);
    #10
    $display("22: The output has gone to %d", done);
    #10
    $display("23: The output has gone to %d", done);
    #10
    $display("24: The output has gone to %d", done);
    #10
    $display("25: The output has gone to %d", done);
    #10
    $display("26: The output has gone to %d", done);
    #10
    $display("27: The output has gone to %d", done);
    #10
    $display("28: The output has gone to %d", done);
    #10
    $display("29: The output has gone to %d", done);
    #10
    $display("30: The output has gone to %d", done);
    #10
    $display("31: The output has gone to %d", done);
    #10
    
    $stop;
    
  end

endmodule
