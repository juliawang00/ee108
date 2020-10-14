module blinker_tb ();
  
  reg clk, switch, reset, in, out;
  
  blinker #() DUT(.clk(clk), .switch(switch), .reset(reset), .out(out));
  
  forever
   begin
     #5 clk = 1 ; 
     #5 clk = 0 ;
   end
  
 initial begin

   #10 reset = 0; // start without reset (x state)
   #20 reset = 1;
   #10 reset = 0; // remove reset
   
   // switch on, input 1
   #50 switch = 1'b1;
   in = 1'b1;
   #100 $display("Switch is %b, in is %b, output is %b", switch, in, out);
   
   // switch on, input 0
   #50 switch = 1'b1;
   in = 1'b0;
   #100 $display("Switch is %b, in is %b, output is %b", switch, in, out);
   
   // switch off, input 1
   #50 switch = 1'b0;
   in = 1'b1;
   #100 $display("Switch is %b, in is %b, output is %b", switch, in, out);
   
   // switch off, input 0
   #50 switch = 1'b0;
   in = 1'b0;
   #100 $display("Switch is %b, in is %b, output is %b", switch, in, out);
   
   $stop
   
 end 
endmodule
