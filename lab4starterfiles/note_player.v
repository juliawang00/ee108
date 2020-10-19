module note_player(
    input clk,
    input reset,
    input play_enable,  // When high we play, when low we don't.
    input [5:0] note_to_load,  // The note to play
    input [5:0] duration_to_load,  // The duration of the note to play
    input load_new_note,  // Tells us when we have a new note to load
    output done_with_note,  // When we are done with the note this stays high.
    input beat,  // This is our 1/48th second beat
    input generate_next_sample,  // Tells us when the codec wants a new sample
    output [15:0] sample_out,  // Our sample output
    output new_sample_ready  // Tells the codec when we've got a sample
);
    
    // Define the states
    'define INITIAL_STATE  1'd0
    'define LOOK_UP 1'd0
    'define SINE_WAVE 1'd0
    'define PAUSED 1'd0
    'define NOTE_COMPLETE 1'd0
    
    reg [1:0] next_state, state;
    dffre #(48) count(.clk(clk), .r(reset), .en(play_enable), .d(next_state), .q(state));
    
    reg [19:0] step_size;
    frequency_rom #() ROM(.clk(clk), .addr(note_to_load), .dout(step_size));
    
    reg should_generate, sample_ready;
    wire [15:0] sample; // holds sine wave generated
    sine_reader #() SIN(.clk(clk), .reset(reset), .step_size(step_size), .generate_next(should_generate), .sample_ready(sample_ready), .sample(sample));

    always @(*) begin
        case(state)
            
        endcase
    end

endmodule
