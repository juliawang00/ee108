module bicycle_fsm_tb ();
  reg clk, faster, slower, next, reset;
  wire out;

  bicycle_fsm #() bike(.clk(clk), .faster(faster) .slower(slower), .next(next), .reset(reset), .rear_light(out));
  
  initial
    forever begin
      #5 clk = 0;
      #5 clk = 1;
    end
  
  initial begin
    #10 faster = 1'b1;
    #10 slower = 1'b0;
    #10 $display("Out while hitting only the faster button: %b", out);
    
    #10 faster = 1'b0;
    #10 slower = 1'b0;
    #10 $display("Out while hitting neither button: %b", out);
    
    #10 faster = 1'b1;
    #10 slower = 1'b1;
    #10 $display("Out while hitting both faster and slower buttons: %b", out);
    
    #10 faster = 1'b0;
    #10 slower = 1'b1;
    #10 $display("Out while hitting only the slower button: %b", out);
  end

endmodule
