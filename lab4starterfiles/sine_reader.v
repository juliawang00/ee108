module sine_reader(
    input clk,
    input reset,
    input [19:0] step_size,
    input generate_next,

    output sample_ready,
  	output wire [15:0] sample
);
  
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
