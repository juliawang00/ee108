module blinker (
    input clk, switch, reset, // Clock, he enabler is the switch output from timer.v 
  output wire out	// Blinker is on if out is hot.
);
  
  wire in;

  // Switch is fed from timer, in should be intialized at one to start the blinker on.
  dffre #(1) blink(clk, reset, switch, in, out);
    
  assign in = (out == 1) ? 0 : 1;

endmodule
