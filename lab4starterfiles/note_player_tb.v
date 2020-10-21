module note_player_tb();

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
      // this is just a general test
		#20
      	note_to_load = 5'b00101;
      	duration_to_load = 5'b01111;
      	load_new_note = 1'b1;
      	generate_next_sample = 1'b0;
      play_enable = 1'b1;
      repeat(100) begin
        #10
        $display("Output: %b", sample_out);
      end
      
      // test pausing
      $display("Playing note");
      #20
      	note_to_load = 5'b00101;
      	duration_to_load = 5'b01111;
      	load_new_note = 1'b1;
      	generate_next_sample = 1'b0;
      repeat(100) begin
        #10
        $display("Output: %b", sample_out);
      end
      repeat(20) begin
        #10
        $display("playing: %b, output is %b", play_enable, sample_out);
      end
      
      play_enable = 1'b0;
      $display("Paused note");
      repeat(10) begin
        #10
        $display("playing: %b, output is %b", play_enable, sample_out);
      end
      
      
      $stop;
    end

endmodule
