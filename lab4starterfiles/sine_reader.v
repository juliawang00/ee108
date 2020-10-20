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
  reg searching;

  wire [21:0] current;
  reg [21:0] nextState;
  
  dffre #(22) count(.clk(clk), 
                    .r(reset), 
                    .en(genNext), 
                    .d(nextState), 
                    .q(current));
  
  reg [9:0] curr_add;
  wire[15:0] curr_freq;
  
    sine_rom #() ROM(.clk(clk),
                     .addr(curr_add),
                     .dout(curr_freq));
 
  
  reg [4:0] next_state_d;
  wire [4:0] current_state_q;
  
  reg [15:0] curr_sample;
  
  dffr #(5) state(
        .clk(clk),
        .d(next_state_d),
        .q(current_state_q),
        .r(reset));
  	
  always @(*)
        case (current_state_q)
          
          `INITIAL_STATE: begin
            sampleReady = 1'b0;
            searching = 1'b0;
            if(generate_next) begin
            	next_state_d = `GENERATE;	
            end
            else begin
              next_state_d = `INITIAL_STATE;
            end
          end
          
          `GENERATE: begin
            next_state_d = `SEARCH;
            genNext = 1'b1;
            nextState = (current[20]) ? current - step_size : current + step_size;
          end
          
          `SEARCH: begin
            next_state_d = `WAIT;
            searching = 1'b1;
            curr_add = current >> 10;
          end
          
          `WAIT: begin
            next_state_d = `SET;
          end
          
          `SET: begin
            next_state_d = `INITIAL_STATE;
            curr_sample = (current[21]) ? 0 - curr_freq : curr_freq;
            sampleReady = 1'b1;
          end 
          
          default: begin 
            next_state_d = `INITIAL_STATE;
            sampleReady = 1'b0;
            searching = 1'b0;
          end
        
   endcase
  
  assign sample = curr_sample;
  assign sample_ready = sampleReady;
  	
endmodule
