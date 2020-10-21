module song_reader_tb();

    reg clk, reset, play, note_done;
    reg [1:0] song;
    wire [5:0] note;
    wire [5:0] duration;
    wire song_done, new_note;

    song_reader dut(
        .clk(clk),
        .reset(reset),
        .play(play),
        .song(song),
        .song_done(song_done),
        .note(note),
        .duration(duration),
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

    // Tests
    initial begin
        #20
        $display("This first test is to see if we proceed through the first song with no problems.");
        song = 2'b00;
        play = 1;
        note_done = 1;
        repeat(34) begin
            #10
            $display("Playing new_note %d in song %d, which is note %d duration %d and song_done %d", new_note, song, note, duration, song_done);
        end
        
        
        
        
        $display("This test starts and stops the second song after ten iterations.");
        song = 2'b01;
        play = 1;
        note_done = 1;
        repeat(10) begin
            #10
            $display("Playing new_note %d in song %d, which is note %d duration %d and song_done %d", new_note, song, note, duration, song_done);
        end
        #10
        $display("Song paused");
        play = 0;
        repeat(10) begin
            #10
            $display("Playing new_note %d in song %d, which is note %d duration %d and song_done %d", new_note, song, note, duration, song_done);
        end
        #10
        $display("Start it up again");
        play = 0;
        repeat(10) begin
            #10
            $display("Playing new_note %d in song %d, which is note %d duration %d and song_done %d", new_note, song, note, duration, song_done);
        end
        
        
        $display("This test plays the third song and after ten iterations turns note_done to 0.");
        play = 1;
        note_done = 1;
        repeat(10) begin
            #10
            $display("Playing new_note %d in song %d, which is note %d duration %d and song_done %d", new_note, song, note, duration, song_done);
        end
        #10
        $display("Set note_done to 0.");
        note_done = 0;
        repeat(10) begin
            #10
            $display("Playing new_note %d in song %d, which is note %d duration %d and song_done %d", new_note, song, note, duration, song_done);
        end
        #10
        $display("Set note_done to 1.");
        note_done = 1;
        repeat(10) begin
            #10
            $display("Playing new_note %d in song %d, which is note %d duration %d and song_done %d", new_note, song, note, duration, song_done);
        end
        
        
        
//         play = 1;
//         note_done = 0;
//         repeat(34) begin
//             #10
//             $display("Playing song %d, which is note %d duration %d", song, note, duration);
//         end
        
        
        
//         play = 1;
//         note_done = 1;
//         repeat(34) begin
//             #10
//             $display("Playing song %d, which is note %d duration %d", song, note, duration);
//         end
        
        
//         play = 1;
//         note_done = 0;
//         repeat(34) begin
//             #10
//             $display("Playing song %d, which is note %d duration %d", song, note, duration);
//         end
        
        
//         play = 1;
//         note_done = 1;
//         repeat(34) begin
//             #10
//             $display("Playing song %d, which is note %d duration %d", song, note, duration);
//         end
        
//         play = 0;
//         note_done = 0;
//         repeat(34) begin
//             #10
//             $display("Playing song %d, which is note %d duration %d", song, note, duration);
//         end
        
        
       
        $stop;
    end

endmodule


