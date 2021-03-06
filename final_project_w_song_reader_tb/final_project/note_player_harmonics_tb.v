module note_player_harmonics_tb();

    reg clk, reset, play_enable, generate_next_sample;
    reg [5:0] note_to_load;
    reg [5:0] duration_to_load;
    reg load_new_note;
    wire done_with_note, new_sample_ready, beat;
    wire [15:0] sample_out;

    note_player np(
        .clk(clk),
        .reset(reset),

        .play_enable(play_enable),
        .note_to_load(note_to_load),
        .duration_to_load(duration_to_load),
        .load_new_note(load_new_note),
        .done_with_note(done_with_note),

        .beat(beat),
        .generate_next_sample(generate_next_sample),
        .sample_out(sample_out),
        .new_sample_ready(new_sample_ready)
    );

    beat_generator #(.WIDTH(17), .STOP(1500)) beat_generator(
        .clk(clk),
        .reset(reset),
        .en(1'b1),
        .beat(beat)
    );

    // Clock and reset
    initial begin
        clk = 1'b0;
        reset = 1'b1;
        repeat (4) #5 clk = ~clk;
        reset = 1'b0;
        forever #5 clk = ~clk;
    end

    // Tests
    initial begin
			#20
			note_to_load = 5'b00101;
			duration_to_load = 5'b00101;
			load_new_note = 1'b1;
			generate_next_sample = 1'b0;
      play_enable = 1'b1;
      #20
      repeat(20) begin
        #10
				$display("Currently on note: %d, Duration: %d, Output: %d", note_to_load, duration_to_load, sample_out);
        $display("Playing: %d, Sample Ready: %d, Note done playing: %d", play_enable, new_sample_ready, done_with_note);
      end
      
      	play_enable = 1'b0;
		$display("Pausing the note.");
      	#10
      repeat(20) begin
		#10
		$display("Currently on note: %d, Duration: %d, Output: %d", note_to_load, duration_to_load, sample_out);
		  $display("Playing: %d, Sample Ready: %d, Note done playing: %d",play_enable, new_sample_ready, done_with_note);
      end
	    
	    $display("Playing the note.");
	    play_enable = 1'b1;
      #10
      repeat(12000) begin
			#10
			$display("Currently on note: %d, Duration: %d, Output: %d", note_to_load, duration_to_load, sample_out);
	    	$display("Playing: %d, Sample Ready: %d, Note done playing: %d", play_enable, new_sample_ready, done_with_note);
	    end
		
		$display("Note should have ended.");
      
      
      $stop;
    end

endmodule
