module sine_reader(
    input clk,
    input reset,
    input [19:0] step_size,
    input generate_next,

    output sample_ready,
  output wire [15:0] sample,
  output wire [21:0] all,
  output wire [1:0] quad
);
  
    //Need to be adding 22 bits, using the first teo bits to understand what quadrant I am in 
    //if Q1 add step size, if Q2 subtract step size, if Q3 add step size negate reuslt, if Q4 subract step size negate result
    
  `define INITIAL_STATE  6'b000001
  `define GENERATE       6'b000010
  `define SEARCH         6'b001000
  `define WAIT           6'b010000
  `define SET            6'b100000
  
  reg sampleReady;
  reg genNext;
  reg searching;
  reg [2:0] quadrant;
  
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
 
  
  reg [5:0] next_state_d;
  wire [5:0] current_state_q;
  
  reg [15:0] curr_sample;
  
  dffr #(6) state(
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

            nextState = (quadrant[0]) ? current - step_size : current + step_size;
          end
          
          `SEARCH: begin
            //genNext = 1'b0;
            next_state_d = `WAIT;
            searching = 1'b1;
            curr_add = current >> 10;
          end
          
          `WAIT: begin
            next_state_d = `SET;
          end
          
          `SET: begin
            next_state_d = `INITIAL_STATE;
            
            curr_sample = (quadrant == 2 || quadrant == 2) ? 0 - curr_freq : curr_freq;
            sampleReady = 1'b1;
            
            if (current[20] && quadrant != 1) begin
              quadrant = quadrant + 1'b1;
            end
            
            if(!(|current)) begin
              quadrant = quadrant + 1'b1; 
            end
            
          end 
          
          default: begin 
            next_state_d = `INITIAL_STATE;
            sampleReady = 1'b0;
            searching = 1'b0;
            quadrant = 2'b00;
          end
        
   endcase
  
  assign sample = curr_sample;
  assign sample_ready = sampleReady;
  assign all = current;
  assign quad = quadrant;
  
endmodule
