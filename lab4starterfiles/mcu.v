module mcu(
    input clk,
    input reset,
    input play_button,
    input next_button,
    output play,
    output reset_player,
    output [1:0] song,
    input song_done
);

    // Initiate the clock to move to next songs. Song four wraps around to one.
    wire [1:0] next_song;
    wire [1:0] cur_song;
    dffr #(2) clock(.clk(clk), .r(reset), .d(next_song), .q(cur_song)); 
    
    // Initiate the two states: PLAY and PAUSE
    `define PLAY 1'b0
    `define PAUSE 1'b1
    
    
    // State register
    reg next_state_d;
    wire current_state_q;

    dffr #(1) state(
        .clk(clk),
        .d(next_state_d),
        .q(current_state_q),
        .r(reset)
    );
    
    // The next song is one after the current song and is set when the song is done or next_button is pressed.
    // If reset is pressed, then it starts at the beggining, otherwise it continues as cur_song.
    assign next_song = (song_done || next_button) ? cur_song + 2'b1 : ( reset ? 2'b0 : cur_song);
    
    // Assign output song to be same as cur_song
    assign song = cur_song;
    
    // Play is high as long as we are in `PLAY state.
    assign play = (current_state_q == `PLAY) ? 1'b1 : 1'b0;
    
    // Send a reset signal when mcu is reset or we are moving on to the next song.
    assign reset_player = (reset || song_done || next_button) ? 1'b1 : 1'b0;
    
    // Next state logic
    always @(*)
        case (current_state_q)
               
            // PAUSE: Initial state from default and wait state until play_button is pressed.
            `PAUSE : begin
                next_state_d = play_button ? `PLAY : `PAUSE;
            end
            
            // PLAY: When play_button is pressed, we send play signal until play_button is pressed again, the song ends, or next_button is pressed.
            `PLAY : begin
                next_state_d = (play_button || song_done || next_button) ? `PAUSE : `PLAY;            
            end
            
            // Default start at PAUSE and wait for play button
            default : begin
                next_state_d = `PAUSE;                
            end        
                        
        endcase

endmodule
