module song_reader_tb ();
  reg clk, reset, play, note_done;
  reg [1:0] song;
  wire [5:0] note1;
  wire [5:0] duration1;
  wire [5:0] note2;
  wire [5:0] duration2;
  wire [5:0] note3;
  wire [5:0] duration3;
  wire song_done, new_note;
  
  song_reader dut(
    .clk(clk),
    .reset(reset),
    .play(play),
    .song(song),
    .song_done(song_done),
    .note1(note1),
    .duration1(duration1),
    .note2(note2),
    .duration2(duration2),
    .note3(note3),
    .duration3(duration3),
    .new_note(new_note),
    .note_done(note_done)
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
    #20
    $display("First read from song ROM giving one note.");
    song = 2'b00;
    play = 1;
    note_done = 1;
    repeat(100) begin
      #10
      $display("Playing new_note %d in song %d, which is note1 %d duration %d., note2 %d duration %d., note3 %d duration %d., play: %d, note_done: %d", new_note, song, note1, duration1, note2, duration2, note3, duration3, song_done, play, note_done);
    end
    
    #20
    $display("Second read from song ROM giving one note.");
    song = 2'b00;
    play = 1;
    note_done = 1;
    repeat(100) begin
      #10
      $display("Playing new_note %d in song %d, which is note1 %d duration %d., note2 %d duration %d., note3 %d duration %d., play: %d, note_done: %d", new_note, song, note1, duration1, note2, duration2, note3, duration3, song_done, play, note_done);
    end
    
    #20
    $display("Third read from song ROM giving one note.");
    song = 2'b00;
    play = 1;
    note_done = 1;
    repeat(100) begin
      #10
      $display("Playing new_note %d in song %d, which is note1 %d duration %d., note2 %d duration %d., note3 %d duration %d., play: %d, note_done: %d", new_note, song, note1, duration1, note2, duration2, note3, duration3, song_done, play, note_done);
    end
    
    #20
    $display("Fourth read from song ROM giving a 1 and wait duration.");
    song = 2'b00;
    play = 1;
    note_done = 1;
    repeat(100) begin
      #10
      $display("Playing new_note %d in song %d, which is note1 %d duration %d., note2 %d duration %d., note3 %d duration %d., play: %d, note_done: %d", new_note, song, note1, duration1, note2, duration2, note3, duration3, song_done, play, note_done);
    end
  end
  
endmodule
