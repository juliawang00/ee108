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
    assign song_done = (note_done && next_state == 0 && state == 31) ? 1 : 0;
    dffre #(5) clock(.clk(clk), .r(reset), .en(note_done), .d(next_state), .q(state)); 
    
    // Instantiate two one-pulses to count one cycle after incrementing and after reading from ROM.
    wire added;
    wire ROM_read;
    one_pulse #() first_puls(.clk(clk), .reset(reset), .in(note_done), .out(added));
    one_pulse #() second_puls(.clk(clk), .reset(reset), .in(added), .out(ROM_read));
   
    
    
    wire [6:0] addr = {song, state};
    wire [11:0] past_note;
    wire [11:0] returned_note;
    song_rom #() get_notes(.clk(clk), .addr(addr), .dout(returned_note));
    
    dffre #(5) clock(.clk(clk), .r(reset), .en(added), .d(returned_note), .q(past_note));
    
    assign {note, duration} = returned_note;
    
    always @(*) begin
        case(ROM_read) begin
            1'b0: {new_note, note, duration} = {1'b0, past_note};
            1'b1: {new_note, note, duration} = {1'b1, returned_note};
            default: {new_note, note, duration} = 13'b0;    
        endcase
    end
    
    
    //note_player #() nt_play (.clk(clk), .reset(reset), .play_enable(), .node_to_load(note[11:5]), .duration_to_load(note[5:0]));    
    
//     always@(*) begin
//         if(not_new_note != 0) begin
//             assign notes, duration, new_note
//         case(interim_note) begin // Case == Mux
//             11'b0:  
//             fff: note = interim_note[11:5]
//             dddd: duration = interim_note[5:0]
            
//         endcase 
//     end


endmodule
