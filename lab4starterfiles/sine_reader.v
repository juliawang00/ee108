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
    
  `define INITIAL_STATE  5'b00001
  `define GENERATE       5'b00010
  `define SEARCH         5'b00100
  `define WAIT           5'b01000
  `define SET            5'b10000
  
  reg sampleReady;
  reg genNext;
  wire [15:0] curr_sample;
  
  //Step Size flip flop
  wire [21:0] current;
  wire [21:0] nextState;
  
  dffre #(22) count(.clk(clk), 
                    .r(reset), 
                    .en(genNext), 
                    .d(nextState), 
                    .q(current));
  
  //ROM for frequency
  wire [9:0] curr_add;
  wire[15:0] curr_freq;
  
    sine_rom #() ROM(.clk(clk),
                     .addr(curr_add),
                     .dout(curr_freq));
 
  //State flip flop
  reg [5:0] next_state_d;
  wire [5:0] current_state_q;
 
  dffr #(6) state(
        .clk(clk),
        .d(next_state_d),
        .q(current_state_q),
        .r(reset));
  
  
  assign nextState = (genNext) ? current + step_size : current;
  
  assign curr_add = (current[20]) ?  0 - (current >> 10) : current >> 10; 
  
  assign curr_sample = (current[21]) ? 0 - curr_freq : curr_freq;
  	
  always @(*)
        case (current_state_q)
          
          `INITIAL_STATE: begin
            if(generate_next) begin
            	next_state_d = `GENERATE;	
            end
            else begin
              next_state_d = `INITIAL_STATE;
            end
            
			sampleReady = 1'b0;
            genNext = 1'b0;
          end
          
          `GENERATE: begin
            next_state_d = `SEARCH;
            sampleReady = 1'b0;
            genNext = 1'b1;
          end
          
          `SEARCH: begin
            next_state_d = `WAIT;
            sampleReady = 1'b0;
            genNext = 1'b0;
          end
          
          `WAIT: begin
            next_state_d = `SET;
            sampleReady = 1'b0;
            genNext = 1'b0;
          end
          
          `SET: begin
            next_state_d = `INITIAL_STATE;
            sampleReady = 1'b1;
            genNext = 1'b0;              
          end 
          
          default: begin 
            next_state_d = `INITIAL_STATE;
            sampleReady = 1'b0;
            genNext = 1'b0;
          end
        
   endcase
  
  assign sample_ready = sampleReady;
  assign sample = (sampleReady) ? curr_sample : 16'b0;

endmodule
