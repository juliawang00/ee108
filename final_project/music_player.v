//
//  music_player module
//
//  This music_player module connects up the MCU, song_reader, note_player,
//  beat_generator, and codec_conditioner. It provides an output that indicates
//  a new sample (new_sample_generated) which will be used in lab 5.
//

module music_player(
    // Standard system clock and reset
    input clk,
    input reset,

    // Our debounced and one-pulsed button inputs.
    input play_button,
    input next_button,
    input playback,

    // The raw new_frame signal from the ac97_if codec.
    input new_frame,

    // This output must go high for one cycle when a new sample is generated.
    output wire new_sample_generated,

    // Our final output sample to the codec. This needs to be synced to
    // new_frame.
    output wire [15:0] sample_out
);
    // The BEAT_COUNT is parameterized so you can reduce this in simulation.
    // If you reduce this to 100 your simulation will be 10x faster.
    parameter BEAT_COUNT = 1000;


//
//  ****************************************************************************
//      Master Control Unit
//  ****************************************************************************
//   The reset_player output from the MCU is run only to the song_reader because
//   we don't need to reset any state in the note_player. If we do it may make
//   a pop when it resets the output sample.
//
 
    wire play;
    wire reset_player;
    wire [1:0] current_song;
    wire song_done;
    mcu mcu(
        .clk(clk),
        .reset(reset),
        .play_button(play_button),
        .next_button(next_button),
        .play(play),
        .reset_player(reset_player),
        .song(current_song),
        .song_done(song_done)
    );

//
//  ****************************************************************************
//      Song Reader
//  ****************************************************************************
//
	wire [5:0] note_to_play1, note_to_play2, note_to_play3;
	wire [5:0] duration_for_note1, duration_for_note2, duration_for_note3;
    wire new_note1, new_note2, new_note3;
    wire note_done1, note_done2, note_done3;
    song_reader song_reader(
        .clk(clk),
        .reset(reset | reset_player),
        .play(play),
        .song(current_song),
        .song_done(song_done),
    	.note1(note_to_play1),
    	.note2(note_to_play2),
    	.note3(note_to_play3),
    	.duration1(duration_for_note1),
    	.duration2(duration_for_note2),
    	.duration3(duration_for_note3),
    	.new_note1(new_note1),
    	.new_note2(new_note2),
    	.new_note3(new_note3),
        .note_done1(note_done1), 
    	.note_done2(note_done2),
    	.note_done3(note_done3)
    );

//   
//  ****************************************************************************
//      Note Player
//  ****************************************************************************
//  
    
   wire [2:0] playback_speed;
   dffre #(3) duration (
		.clk(clk),
		.r(reset),
		.en(playback),
	   	.d(next_playback_speed+1'd1),
		.q(playback_speed)
    );
    
    wire beat;
    wire generate_next_sample;
    wire [15:0] note_sample1, note_sample2, note_sample3;
    wire note_sample_ready1, note_sample_ready2, note_sample_ready3;
	wire [5:0] playback_duration1;
    assign playback_duration1 = duration_for_note1 >> playback_speed[1:0];
	
    note_player note_player1(
        .clk(clk),
        .reset(reset),
        .play_enable(play),
        .note_to_load(note_to_play1),
        .duration_to_load(playback_duration1),
        .load_new_note(new_note1),
        .done_with_note(note_done1),
        .beat(beat),
        .generate_next_sample(generate_next_sample),
        .sample_out(note_sample1),
        .new_sample_ready(note_sample_ready1)
    );
      
    wire [5:0] playback_duration2;
    assign playback_duration2 = duration_for_note2 >> playback_speed[1:0];
    
    note_player note_player2(
        .clk(clk),
        .reset(reset),
        .play_enable(play),
        .note_to_load(note_to_play2),
        .duration_to_load(playback_duration2),
        .load_new_note(new_note2),
        .done_with_note(note_done2),
        .beat(beat),
        .generate_next_sample(generate_next_sample),
        .sample_out(note_sample2),
        .new_sample_ready(note_sample_ready2)
    );

    wire [5:0] playback_duration3;
    assign playback_duration3 = duration_for_note3 >> playback_speed[1:0];
    
    note_player note_player3(
        .clk(clk),
        .reset(reset),
        .play_enable(play),
        .note_to_load(note_to_play3),
        .duration_to_load(playback_duration3),
        .load_new_note(new_note3),
        .done_with_note(note_done3),
        .beat(beat),
        .generate_next_sample(generate_next_sample),
        .sample_out(note_sample3),
        .new_sample_ready(note_sample_ready3)
    );
//   
//  ****************************************************************************
//      Beat Generator
//  ****************************************************************************
//  By default this will divide the generate_next_sample signal (48kHz from the
//  codec's new_frame input) down by 1000, to 48Hz. If you change the BEAT_COUNT
//  parameter when instantiating this you can change it for simulation.
//  
    beat_generator #(.WIDTH(10), .STOP(BEAT_COUNT)) beat_generator(
        .clk(clk),
        .reset(reset),
        .en(generate_next_sample),
        .beat(beat)
    );

//  
//  ****************************************************************************
//      Codec Conditioner
//  ****************************************************************************
//  

    wire [15:0] combined_note;
    combiner combiner(
        .song_one(note_sample1),
        .song_two(note_sample2),
        .song_three(note_sample3),
        .out(combined_note)
    );
    

    assign new_sample_generated = generate_next_sample;
    codec_conditioner codec_conditioner(
        .clk(clk),
        .reset(reset),
        .new_sample_in(combined_note),
        .latch_new_sample_in(note_sample_ready1 || note_sample_ready2 || note_sample_ready3),
        .generate_next_sample(generate_next_sample),
        .new_frame(new_frame),
        .valid_sample(sample_out)
    );

endmodule
