module song_reader(
    input clk,
    input reset,
    input play,
    input [1:0] song,
    input note_done,
    output song_done,
    output [5:0] note,
    output [5:0] duration,
    output new_note
);
    
    // Implement a 32-second timer. Updates song_done if all the notes have been played and only increases when note_done is enabled
    wire [4:0] next_state = reset ? 0 : new_note + 1;; 
    wire [4:0] new_note;  
    song_done = (next_state == 0 && new_note == 31) ? 1 : 0;
    dffre #(5) clock(.clk(clk), ,r(reset), .en(note_done), .d(next_state), .q(new_note));
    
  
    wire [6:0] addr = {song, new_note};
    wire [11:0] note;
    song_rom #() get_notes(.clk(clk), .addr(addr), .dout(note));
    
    
    note_player #() nt_play (.clk(clk), .reset(reset), .play_enable(), .node_to_load(note[11:5]), .duration_to_load(note[5:0]));
    
    
    
    always@(*) begin
        case(rst)
            
        endcase
        
        
    end

    // Implementation goes here!

endmodule

