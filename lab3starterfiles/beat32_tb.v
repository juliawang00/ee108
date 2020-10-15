module beat32_tb ();
  reg clk;
  reg [21:0] load;
  wire done;
  
  beat32 #() DUT(.clk(clk), .load(load), .done(done));
  initial
    forever begin
      #5 clk = 1;
      #5 clk = 0;
    end
  
  initial begin
    load = 22'd3125000;
    $display(load);
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
