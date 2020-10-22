module mcu_tb();
    reg clk, reset, play_button, next_button, song_done;
    wire play, reset_player;
    wire [1:0] song;

    mcu dut(
        .clk(clk),
        .reset(reset),
        .play_button(play_button),
        .next_button(next_button),
        .play(play),
        .reset_player(reset_player),
        .song(song),
        .song_done(song_done)
    );

    // Clock and reset
    initial begin
        clk = 1'b0;
        reset = 1'b1;
        repeat (4) #5 clk = ~clk;
        reset = 1'b0;
        forever #5 clk = ~clk;
    end

    // Tests: Want to make sure we are keeping track of the song currently being played and controlling state of overall system
    initial begin
        play_button = 1'b0;
        next_button = 1'b0;
        song_done = 1'b0;
        
        #20
        $display("Currently everything should be off.");
        
        #20
        $display("Play first song from the beginning.");
        play_button = 1'b1;
        #20
        play_button = 1'b0;
        repeat(30) begin
            #10
            $display("Should be playing: %b,   Moving on to next song: %b,   Currently on song: %d, Song done: %d, Next_button: %d, play_button: %d", play, reset_player, song, song_done, next_button, play_button);
        end
        
        #20
        $display("Pausing first song after 30 loops");
        play_button = 1'b1;
        #20
        play_button = 1'b0;
        repeat(20) begin
            #10
            $display("Should be playing: %b,   Moving on to next song: %b,   Currently on song: %d, Song done: %d, Next_button: %d, play_button: %d", play, reset_player, song, song_done, next_button, play_button);
        end
        
        #20
        $display("Playing first song after paused for 20 loops");
        play_button = 1'b1;
        #20
        play_button = 1'b0;
        repeat(20) begin
            #10
            $display("Should be playing: %b,   Moving on to next song: %b,   Currently on song: %d, Song done: %d, Next_button: %d, play_button: %d", play, reset_player, song, song_done, next_button, play_button);
        end
        
        #20
        $display("Skipping to next song, then should sit and wait paused");
        next_button = 1'b1;
        #20
        next_button = 1'b0;
        repeat(20) begin
            #10
            $display("Should be playing: %b,   Moving on to next song: %b,   Currently on song: %d, Song done: %d, Next_button: %d, play_button: %d", play, reset_player, song, song_done, next_button, play_button);
        end
        
        #20
        $display("Playing second song all the way to the end");
        play_button = 1'b1;
        #20
        play_button = 1'b0;
        repeat(200) begin //I don't actually know if this was enough cycles??
            #10
            $display("Should be playing: %b,   Moving on to next song: %b,   Currently on song: %d, Song done: %d, Next_button: %d, play_button: %d", play, reset_player, song, song_done, next_button, play_button);
        end
        
        #20
        $display("Should have reached third song and waiting in paused. Skipping to fourth song.");
        next_button = 1'b1;
        #20
        next_button = 1'b0;
        repeat(20) begin
            #10
            $display("Should be playing: %b,   Moving on to next song: %b,   Currently on song: %d, Song done: %d, Next_button: %d, play_button: %d", play, reset_player, song, song_done, next_button, play_button);
        end
        
        #20
        $display("Should have skipped to fourth song and waiting in paused. Skipping back to first song.");
        play_button = 1'b1;
        #20
        play_button = 1'b0;
        repeat(20) begin
            #10
            $display("Should be playing: %b,   Moving on to next song: %b,   Currently on song: %d, Song done: %d, Next_button: %d, play_button: %d", play, reset_player, song, song_done, next_button, play_button);
        end
        
        $stop;
        
    end

endmodule
