module sine_reader(
    input clk,
    input reset,
    input [19:0] step_size,
    input generate_next,

    output sample_ready,
  	output wire [15:0] sample
);
  
    //Need to be adding 22 bits, using the first teo bits to understand what quadrant I am in 
    //if Q1 add step size, if Q2 subtract step size, if Q3 add step size negate reuslt, if Q4 subract step size negate result
    
  	wire [19:0] current;
  	wire [19:0] nextState;
  
  dffre #(20) count(.clk(clk), 
                    .r(reset), 
                    .en(generate_next), 
                    .d(nextState), 
                    .q(current));
  
    assign nextState = current + step_size;
  
  	wire [9:0] curr_add;
  	assign curr_add = current >> 10;
  	wire[15:0] curr_freq;
  
  sine_rom #() ROM(.clk(clk),
                   .addr(curr_add),
                   .dout(curr_freq));
  
  assign sample = curr_freq;
  //figure out what im supposed to do for 4 qudrants ^^ only gets first
  	
  
endmodule
