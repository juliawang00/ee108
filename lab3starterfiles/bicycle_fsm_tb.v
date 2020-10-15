module bicycle_fsm_tb ();
  reg clk, faster, slower, next, reset;
  wire out;

  bicycle_fsm #() bike(.clk(clk), .faster(faster), .slower(slower), .next(next), .reset(reset), .rear_light(out));
  
  initial
    forever begin
      #5 clk = 0;
      #5 clk = 1;
    end
  
  initial begin
    reset = 1'b0;
    faster = 1'b1;
    slower = 1'b0;
    next = 1'b0;
    #100 $display("Out while hitting only the faster button: %b", out);
    
    faster = 1'b0;
    slower = 1'b0;
    #100 $display("Out while hitting neither button: %b", out);
    
    faster = 1'b1;
    slower = 1'b1;
    #100 $display("Out while hitting both faster and slower buttons: %b", out);
    
    faster = 1'b0;
    slower = 1'b1;
    #100 $display("Out while hitting only the slower button: %b", out);
    
    faster = 1'b0;
    slower = 1'b0;
    next = 1'b1;
    #100 $display("Out while hitting neither button and next: %b", out);
    
    faster = 1'b0;
    slower = 1'b0;
    next = 1'b0;
    reset = 1'b1;
    #100 $display("Out while hitting neither button and reset: %b", out);
  end

endmodule
