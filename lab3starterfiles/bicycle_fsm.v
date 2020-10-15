// Bicycle Light FSM
//
// This module determines how the light functions in the given state and what
// the next state is for the given state.
// 
// It is a structural module: it just instantiates other modules and hooks
// up the wires between them correctly.

/* For this lab, you need to implement the finite state machine following the
 * specifications in the lab hand-out */

module bicycle_fsm(
    input clk, 
    input faster, 
    input slower, 
    input next, 
    input reset, 
    output wire rear_light
);
    
    // Instantiations of master_fsm, beat32, fast_blinker, slow_blinker here
    reg [21:0]load = 22'd3125000;
    wire count_en;
    wire shift_left;
    wire shift_right;
    wire [1:0] mux_input;
    
    master_fsm #() master(.faster(faster), .slower(slower), .next(next), .mux_input(mux_input), .shift_left(shift_left), .shift_right(shift_right));
    beat32 #() beat32(.clk(clk), .load(load) .done(count_en));
    // counten serves as the input to the timers for the programmable blinkers
    
    programmable_blinker #() fast_blinker(.up_button(shift_left), .down_button(shift_right), .clk(clk), .rst(reset), .rear_light(rear_light));
    programmable_blinker #() slow_blinker(.up_button(shift_left), .down_button(shift_right), .clk(clk), .rst(reset), .rear_light(rear_light));

    // Output mux here
    mux #() light(.on(mux_input));
endmodule
