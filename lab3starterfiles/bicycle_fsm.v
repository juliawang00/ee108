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
    wire shift_left_1;
    wire shift_right_1;
    wire shift_left_2;
    wire shift_right_2;
    wire [1:0] mux_input;
    reg [2:0] state = 3'b000;
    wire light_output;
    
    master_fsm #() master(.faster(faster), .slower(slower), .clk(clk), .rst(reset), .next(next), .state(state), .mux_input(mux_input), .shift_left_1(shift_left_1), .shift_right_1(shift_right_1),.shift_left_2(shift_left_2), .shift_right_2(shift_right_2));
    beat32 #() beat32(.clk(clk), .rst(reset), .load(load), .done(count_en));
    // counten serves as the input to the timers for the programmable blinkers
    
    wire out_light1;
    wire out_light2;
    
    programmable_blinker #() fast_blinker(.up_button(shift_left_1), .down_button(shift_right_1), .clk(clk), .rst(reset), .out_light(out_light1));
    programmable_blinker #() slow_blinker(.up_button(shift_left_2), .down_button(shift_right_2), .clk(clk), .rst(reset), .out_light(out_light2));

    // Output mux here
    mux #() light(.state(mux_input), .fast_blink(out_light1), .slow_blink(out_light2), .rear_light(light_output));
    assign rear_light = light_output;
endmodule
