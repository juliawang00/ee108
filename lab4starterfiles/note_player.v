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
    `define INITIAL_STATE  3'b0
    `define LOOK_UP 3'b1
    `define SINE_WAVE 3'b10
    `define PAUSED 3'b11
    `define NOTE_COMPLETE 3'b100
    `define PLAYING_NOTE 3'b101
    
  reg [2:0] next_state; 
  wire [2:0] state;
  dffr #(3) count(.clk(clk), .r(reset), .d(next_state), .q(state));
    
    wire [5:0] counter;
    wire [5:0] counter_next;
    dffre #(6) duration(.clk(clk), .r(reset), .en(beat), .d(counter_next), .q(counter));
    
    assign counter_next = (state == `PLAYING_NOTE && play_enable == 1'b1) ? counter + 1 : counter;
    
    wire [19:0] step_size;
    frequency_rom #() ROM(.clk(clk), .addr(note_to_load), .dout(step_size));
    
    wire should_generate = load_new_note || generate_next_sample;
    wire sample_ready;
    wire [15:0] sample; // holds sine wave generated
    sine_reader #() SIN(.clk(clk), .reset(reset), .step_size(step_size), .generate_next(should_generate), .sample_ready(sample_ready), .sample(sample));
    
    reg note_done = 1'd0;

    always @(*) begin
        case(state)
            `INITIAL_STATE: begin
                if(load_new_note == 1'd1) begin
                    next_state = `SINE_WAVE;
                end else begin
                    next_state = `INITIAL_STATE;
                end
            end
            `SINE_WAVE: begin
                next_state = `PLAYING_NOTE;
            end
            `PAUSED: begin
                // if we are in pause, wait for the play enable to go again
                if(play_enable == 1) begin
                    next_state = `PLAYING_NOTE;
                end
            end
            `PLAYING_NOTE: begin
                // increment counter for duration
                if(play_enable == 0) begin
                    next_state = `PAUSED;
                end
                else if(counter >= duration_to_load) begin
                    next_state = `NOTE_COMPLETE;
                end
                else begin
                    next_state = `INITIAL_STATE;
                end
            end
            `NOTE_COMPLETE: begin
                // tell all modules the current note has finished
                next_state = `INITIAL_STATE;
            end
            default: begin
                next_state = `INITIAL_STATE;
            end
        endcase
    end
    
  	
    assign new_sample_ready = sample_ready;
    assign done_with_note = (state == `NOTE_COMPLETE) ? 1'd1 : 1'd0;
    assign sample_out = sample;

endmodule
