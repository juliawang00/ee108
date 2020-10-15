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
    master_fsm #() master(.faster(faster), .slower(slower), .next(next));
    beat32 #() beat32(.clk(clk), .load(load) .done(count_en));
    // counten serves as the input to the timers for the programmable blinkers
    
    programmable_blinker #() fast_blinker(.up_button(faster), .down_button(slower), .shift_right(1'b1), .count_en(count_en), .rear_light(rear_light));
    pprogrammable_blinker #() fast_blinker(.up_button(faster), .down_button(slower), .shift_right(1'b0), .count_en(count_en), .rear_light(rear_light));

    // Output mux here

endmodule
