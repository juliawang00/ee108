module master_fsm_tb ();
  reg clk, faster, slower, reset, next;
  wire [1:0] mux_input;
  wire shift_left_1;
  wire shift_left_2;
  wire shift_right_1;
  wire shift_right_2;
  reg [2:0] state;

  master_fsm #() m(.clk(clk), .faster(faster), .slower(slower), .next(next), .rst(reset), .mux_input(mux_input), .shift_left_1(shift_left_1),
                   .shift_right_1(shift_right_1), .shift_left_2(shift_left_2), .shift_right_2(shift_right_2), .state(state));
  
  initial
    forever begin
      #5 clk = 0;
      #5 clk = 1;
    end
  
  initial begin
    state = 3'b000;
    next = 1'b0;
    
    state = 3'b000;
    next = 1'b1;
    
    state = 3'b001;
    next = 1'b0;
    
    state = 3'b001;
    next = 1'b1;
  end

endmodule
