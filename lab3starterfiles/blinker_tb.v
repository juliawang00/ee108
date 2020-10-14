module blinker_tb ();
  
  reg clk, switch, reset;
  wire out;
  
  blinker #() DUT(.clk(clk), .switch(switch), .reset(reset), .out(out));
  
	initial 
  	forever
   	begin
     	#5 clk = 1 ; 
     	#5 clk = 0 ;
   	end

  
 initial begin

   #10 reset = 0; // start without reset (x state)
   #10 $display("First Reset: out %b", out);
   #20 reset = 1;
   #10 $display("Second Reset: out %b", out);
   #10 reset = 0; // remove reset
   #10 $display("Third Reset: out %b", out);
   
   // switch on, input 1
   #50 switch = 1'b1;
   //in = 1'b1;
   #100 $display("Switch is %b, output is %b", switch, out);
   
   // switch on, input 0
   #50 switch = 1'b1;
   //in = 1'b0;
   #100 $display("Switch is %b, output is %b", switch, out);
   
   // switch off, input 1
   #50 switch = 1'b0;
   //in = 1'b1;
   #100 $display("Switch is %b, output is %b", switch, out);
   
   // switch off, input 0
   #50 switch = 1'b0;
   //in = 1'b0;
   #100 $display("Switch is %b, output is %b", switch, out);
   
   $stop;
   
 end 
endmodule
