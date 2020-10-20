module song_reader(
    input clk,
    input reset,
    input play,
    input [1:0] song,
    input note_done,
    output song_done,
    output [5:0] note,
    output [5:0] duration,
    output new_note
);
    
    
    
    // *** SONG_READER FSM ***
    `define RESET 2'b00
    `define INCREMENTED 2'b01
    `define ROM_OUT 2'b10
    `define CHECK_DONE 2'b11
    
    // State register
    reg [1:0] next_state_d;
    wire [1:0] current_state_q;

    dffr #(2) state(
        .clk(clk),
        .d(next_state_d),
        .q(current_state_q),
        .r(reset)
    );
    
    // Implement a 32-second timer. Updates song_done if all the notes have been played and only increases when note_done is enabled
    reg [4:0] n_state;
    wire [4:0] state;  
    dffre #(5) clock(.clk(clk), .r(reset), .d(n_state), .q(state)); 
   
    
    // Instantiate ROM module.
    wire [6:0] addr = {song, state};
    wire [11:0] returned_note;
    song_rom #() get_notes(.clk(clk), .addr(addr), .dout(returned_note));
    

    // Assign new note values if in check_done state, otherwise keep the values the same and set new_note to zero.
    assign {new_note, note, duration} = (current_state_q == `CHECK_DONE) ? {1'b1, returned_note} : {1'b0, note, duration}; 
    
    // Next state logic
    always @(*)
        case (current_state_q)
            // RESET: When the reset button is pressed, the increment clock starts at 0. This is also the wait state
            // in case pause is pressed. In this case, the increment clock retains its last value. In both cases,
            // we only proceed to the next state if play is pressed.
            `RESET : begin
                n_state = reset ? 5'b0 : n_state; // Reset if reset button is on, otherwise keep with previous state. Necessary for pausing and playing.
                if(play)
                    next_state_d = `INCREMENTED;
                else
                    next_state_d = `RESET;
            end
            
            // When play is pressed, we come to this state to represent that a cycle has passed and now state holds n_state value. Move to ROM_OUT no matter what.
            `INCREMENTED : begin
                next_state_d = `ROM_OUT;
                
            end
            
            // This state represents the cycle it takes to read from the ROM. At the end, 
            `ROM_OUT : begin
                next_state_d = `CHECK_DONE;
                
            end
            
            //
            `CHECK_DONE : begin
                n_state = state + 1; // Always increment one
                if(note_done && play && n_state != 0) //Maybe state != 31
                    next_state_d = `INCREMENTED;
                else
                    if (n_state == 0)
                        song_done = 1;
                    else
                        song_done = 0;
                    next_state_d = `WAIT;  
            end
            
            //
            default : begin
                next_state_d = `RESET;
                n_state = reset ? 5'b0 : n_state;
                
            end        
                        
        endcase

endmodule
