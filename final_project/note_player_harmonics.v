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

    wire [19:0] step_size;
    wire [5:0] freq_rom_in;
    wire [15:0] fund_sample_out, overtone_sample_out;
    wire [17:0] added;

    dffre #(.WIDTH(6)) freq_reg (
        .clk(clk),
        .r(reset),
        .en(load_new_note),
        .d(note_to_load),
        .q(freq_rom_in)
    );

    frequency_rom freq_rom(
        .clk(clk),
        .addr(freq_rom_in),
        .dout(step_size)
    );

    // Sine_reader for the fundamental frequency.
    sine_reader sine_read_fund(
        .clk(clk),
        .reset(reset),
        .step_size(step_size),
        .generate_next(play_enable && generate_next_sample),
        .sample_ready(new_sample_ready),
        .sample(fund_sample_out)
    );
    
    // Second sine_reader for the overtone.
    sine_reader sine_read_overtone(
        .clk(clk),
        .reset(reset),
        .step_size(step_size<<1), // Multiplies the fundamental frequency by 2
        .generate_next(play_enable && generate_next_sample),
        .sample_ready(new_sample_ready),
        .sample(overtone_sample_out)
    );

    wire [5:0] state, next_state;
    dffre #(.WIDTH(6)) state_reg (
        .clk(clk),
        .r(reset),
        .en((beat || load_new_note) && play_enable),
        .d(next_state),
        .q(state)
    );
    assign next_state = (reset || done_with_note || load_new_note)
                        ? duration_to_load : state - 1;

    assign done_with_note = (state == 6'b0);
    
    assign added = fund_sample_out + (overtone_sample_tone >> 1); // The right bitshift decreases the amplitude by half.
    assign sample_out = added[17] ? added[17:2] : added[16] ? added[16:1] : added[15:0];

endmodule
