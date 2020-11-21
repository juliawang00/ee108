module song_reader_tb ();
  reg clk, reset, play, note_done;
  reg generate_next_sample;
  reg [1:0] song;
  wire [5:0] note1;
  wire [5:0] duration1;
  wire [5:0] note2;
  wire [5:0] duration2;
  wire [5:0] note3;
  wire [5:0] duration3;
  wire song_done;
  wire new_note1,new_note2,new_note3;
  wire note_done1,note_done2,note_done3;
  wire[15:0] sample_out1, sample_out2, sample_out3;
  
    beat_generator #(.WIDTH(5), .STOP(16)) beat_generator(
        .clk(clk),
        .reset(reset),
        .en(1),
        .beat(beat)
    );
  
  song_reader dut(
    .clk(clk),
    .reset(reset),
    .play(play),
    .beat(beat),
    .song(song),
    .note_done1(note_done1),
    .note_done2(note_done2),
    .note_done3(note_done3),
    .song_done(song_done),
    .note1(note1),
    .duration1(duration1),
    .note2(note2),
    .duration2(duration2),
    .note3(note3),
    .duration3(duration3),
    .new_note1(new_note1),
    .new_note2(new_note2),
    .new_note3(new_note3)
  );
  
  note_player np1(
        .clk(clk),
        .reset(reset),

        .play_enable(play),
        .note_to_load(note1),
        .duration_to_load(duration1),
        .load_new_note(new_note1),
        .done_with_note(note_done1),

        .beat(beat),
        .generate_next_sample(generate_next_sample),
        .sample_out(sample_out1),
        .new_sample_ready()
    );
    note_player np2(
        .clk(clk),
        .reset(reset),

        .play_enable(play),
        .note_to_load(note2),
        .duration_to_load(duration2),
        .load_new_note(new_note2),
        .done_with_note(note_done2),

        .beat(beat),
        .generate_next_sample(generate_next_sample),
        .sample_out(sample_out2),
        .new_sample_ready()
    );
    note_player np3(
        .clk(clk),
        .reset(reset),

        .play_enable(play),
        .note_to_load(note3),
        .duration_to_load(duration3),
        .load_new_note(new_note3),
        .done_with_note(note_done3),

        .beat(beat),
        .generate_next_sample(generate_next_sample),
        .sample_out(sample_out3),
        .new_sample_ready()
    );
  
  // Clock and reset
  initial begin
    clk = 1'b0;
    reset = 1'b1;
    repeat (4) #5 clk = ~clk;
    reset = 1'b0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    generate_next_sample = 1'b0;
    forever  begin
        #5 generate_next_sample = 0;
        #20 generate_next_sample =1;
    end
  end
  
  initial begin
    #20
    $display("First read from song ROM giving one note.");
    song = 2'b00;
    play = 1;
    note_done = 1;
    #10000
    //repeat(100) begin
      //#10
      
      //$display("Playing new_note %d in song %d, which is note1 %d duration %d., note2 %d duration %d., note3 %d duration %d., play: %d, note_done: %d", new_note, song, note1, duration1, note2, duration2, note3, duration3, song_done, play, note_done);
    //end
    
    #20
    $display("Second read from song ROM giving one note.");
    song = 2'b00;
    play = 1;
    note_done = 1;
    //repeat(100) begin
      //#10
      //$display("Playing new_note %d in song %d, which is note1 %d duration %d., note2 %d duration %d., note3 %d duration %d., play: %d, note_done: %d", new_note, song, note1, duration1, note2, duration2, note3, duration3, song_done, play, note_done);
    //end
    
    #20
    $display("Third read from song ROM giving one note.");
    song = 2'b00;
    play = 1;
    note_done = 1;
   // repeat(100) begin
//10
      //$display("Playing new_note %d in song %d, which is note1 %d duration %d., note2 %d duration %d., note3 %d duration %d., play: %d, note_done: %d", new_note, song, note1, duration1, note2, duration2, note3, duration3, song_done, play, note_done);
    //end
    
    #20
    $display("Fourth read from song ROM giving a 1 and wait duration.");
    song = 2'b00;
    play = 1;
    note_done = 1;
    //repeat(100) begin
    //  #10
      //$display("Playing new_note %d in song %d, which is note1 %d duration %d., note2 %d duration %d., note3 %d duration %d., play: %d, note_done: %d", new_note, song, note1, duration1, note2, duration2, note3, duration3, song_done, play, note_done);
    //end
  end
  
endmodule
