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
    wire [4:0] next_count;
    wire [4:0] count;  
    dffr #(5) clock(.clk(clk), .r(reset), .d(next_count), .q(count)); 
   
    
    // Instantiate ROM module.
    wire [6:0] addr = {song, count};
    wire [11:0] returned_note;
    song_rom #() get_notes(.clk(clk), .addr(addr), .dout(returned_note));
    

    // Assign new note values if in check_done state, otherwise keep the values the same and set new_note to zero.
    assign {new_note, note, duration} = (current_state_q == `ROM_OUT) ? {1'b1, returned_note} : {1'b0, note, duration}; 
    
    // Counter for the next notes to play. Constantly increment instead of reset or note is not done.
    assign next_count = reset ? 5'b0 : ((current_state_q == `CHECK_DONE) && note_done && play) ? count + 5'b1 : next_count;
    
    // Song is done when we are in check_done state and count has reached the last note.
    assign song_done = ((current_state_q == `CHECK_DONE) && note_done && count == 31) ? 1 : 0;

    
    // Next state logic
    always @(*)
        case (current_state_q)
               
            // RESET: Initial state from default and wait state when player is paused.
            `RESET : begin
                next_state_d = play ? `INCREMENTED : `RESET;
            end
            
            // When play is pressed, we come to this state to represent that a cycle has passed and now state holds n_state value. Move to ROM_OUT no matter what.
            `INCREMENTED : begin
                next_state_d = `ROM_OUT;             
            end
            
            // This state represents the cycle it takes to read from the ROM. At the end, new values for duration and song have been found.
            // The assign statement above this mux assigns these values for note_reader to read.
            `ROM_OUT : begin
                next_state_d = `CHECK_DONE;
                
            end
            
            // This is the wait state for note_reader to tell us to get a new note
            `CHECK_DONE : begin             
                next_state_d = !note_done ? `CHECK_DONE : (play && count != 31) ? `INCREMENTED : `RESET;
            end
            
            // Default.
            default : begin
                next_state_d = `RESET;                
            end        
                        
        endcase

endmodule
