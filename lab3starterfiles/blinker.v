module blinker (
    input switch, // The clk input is the switch output from timer
    input reset, 	// Standard system clock and reset
    input in, 	// Initialized on (1'b1)
    output out	// 
);
  
  // Switch is fed from timer, in should be intialized at one to start the blinker on.
  dff #(1) blink(switch, in, out);
  
  always @(*) begin
    case(out) 
      1'b0: in = 1'b1;
      1'b1: in = 1'b0;
      default: in = 1'b1;
    endcase
  end


endmodule
