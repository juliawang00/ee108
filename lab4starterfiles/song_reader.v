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
    wire [4:0] next_state = reset ? 5'b0 : state + 1;
    wire [4:0] state;  
    assign song_done = (next_state == 0 && state == 31) ? 1 : 0;
    dffre #(5) clock(.clk(clk), .r(reset), .en(note_done), .d(next_state), .q(state)); // Not sure if I want enabler, because that would take a few cycles to compute next value.
    
    
//     one_pulse() on_puls(.clk(clk), .reset(reset), .in(), .out());
    
    wire [6:0] addr = {song, state};
    wire [11:0] returned_note;
    song_rom #() get_notes(.clk(clk), .addr(addr), .dout(returned_note));
    
    always @(*) begin
        case(note_done) begin
            1'b0: 
            
        endcase
    end
    
    
    //note_player #() nt_play (.clk(clk), .reset(reset), .play_enable(), .node_to_load(note[11:5]), .duration_to_load(note[5:0]));    
    
    always@(*) begin
        if(not_new_note != 0) begin
            assign notes, duration, new_note
        case(interim_note) begin // Case == Mux
            11'b0:  
            fff: note = interim_note[11:5]
            dddd: duration = interim_note[5:0]
            
        endcase 
    end


endmodule
