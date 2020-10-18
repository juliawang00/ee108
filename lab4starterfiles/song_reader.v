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
    reg [4:0] next;
    reg [4:0] new_note;
    
    dffr #(5) clock(.clk(clk), ,r(reset), .d(next), .q(new_note));
  
    wire [5:0] addr = {song, };
    wire [11:0] note;
    song_rom #() get_notes(.clk(clk), .addr(), .dout(note));
    
    
    
    always@(*) begin
        
    end

    // Implementation goes here!

endmodule

