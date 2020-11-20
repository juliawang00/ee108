`define SONG_WIDTH 8 // 128bits
`define NOTE_WIDTH 6
`define DURATION_WIDTH 6
`define MSB 1
`define OPTIONS 3

// ----------------------------------------------
// Define State Assignments
// ----------------------------------------------
`define SWIDTH 2
`define PAUSED             2'b00
`define WAIT               2'b01
`define RETRIEVE_NOTE      2'b10


module song_reader(
    input clk,
    input reset,
    input play,
    input [1:0] song,
    input note_done1, note_done2, note_done3,
    output wire song_done,
    output wire [5:0] note1,duration1, note2,duration2, note3,duration3,
    output wire new_note1, new_note2, new_note3
);
    wire [`SONG_WIDTH-1:0] curr_note_num, next_note_num;    // Counter for addresses of a song. Up to 128.
    wire [`MSB + `NOTE_WIDTH + `DURATION_WIDTH + `OPTIONS -1:0] note_and_duration; // 16 bits. Value read from the rom and as specified in lab directions. MSB specifies if reading a note or wait period.
    //     wire [`SONG_WIDTH + 1:0] rom_addr = {song, curr_note_num}; // Address in the rom to read.
    wire [`SONG_WIDTH - 1:0] rom_addr = curr_note_num; // Address in the rom to read.
    wire [2:0] notes_done = {note_done1, note_done2, note_done3}; // Used in arbiter to see which note_player modules are available.
    wire [2:0] player_available;

    wire [`SWIDTH-1:0] state;
    reg  [`SWIDTH-1:0] next;
    
    wire [1:0] cur_note_module;
    wire [1:0] next_note_module;

    // For identifying when we reach the end of a song
    wire overflow;

    dffr #(`SONG_WIDTH) note_counter (
        .clk(clk),
        .r(reset),
        .d(next_note_num),
        .q(curr_note_num)
    );
    
    dffr #(`SWIDTH) fsm (
        .clk(clk),
        .r(reset),
        .d(next),
        .q(state)
    );
    
    dffre #(`DURATION_WIDTH) wait_countdown (
        .clk(clk),
        .r(reset),
        .en(note_and_duration[15]),
        .d(duration_to_load),
        .q(countdown)
    );

    // Get back the note and duration from the Song_Rom, including if it is a note or a hold period (as determined by MSB).
    song_rom rom(.clk(clk), .addr(rom_addr), .dout(note_and_duration));
    
    // Count down when we are in the WAIT state, otherwise set the note to the duration value. It will be properly set before we reach state WAIT.
    wire[5:0] countdown;
    wire[5:0] duration_to_load = (state==`WAIT) ? countdown - 1 : note_and_duration[7:2];
    wire done_wait = (countdown==6'b0);            

    always @(*) begin
        case (state)
            `PAUSED:            next = play ? `RETRIEVE_NOTE : `PAUSED;
            // HAVE ONLY ONE RETRIEVE STATE THAT GOES TO WAIT WHEN ARBITER OUTPUTS 0
            `RETRIEVE_NOTE:    next = (!play || overflow) ? `PAUSED : note_and_duration[15] ? `WAIT : `RETRIEVE_NOTE;
          
            `WAIT:              next = !play ? `PAUSED
                                             : (done_wait ? `RETRIEVE_NOTE
                                                          : `WAIT);
            default:            next = `PAUSED;
        endcase
    end

    // We increment when we are in one of the retrieve_note states with the MSB high, or if we are in increment address. Overflow is set high when the last note of 
    // a song is played, eg {1'd0,8'd127} + 1 = {1'd1, 8'd0}
    assign {overflow, next_note_num} =
        (state == `RETRIEVE_NOTE) ? {1'b0, curr_note_num} + 1 : {1'b0, curr_note_num};

    arbiter open_player(.bit_i(notes_done), .bit_o(player_available));
    assign {new_note1, note1, duration1} = (((state == `RETRIEVE_NOTE) && ~note_and_duration[15] && player_available == 3'b100) || note_and_duration[0]) ? {1'b1, note_and_duration[14:3]} : {13'b0};
    assign {new_note2, note2, duration2} = (((state == `RETRIEVE_NOTE) && ~note_and_duration[15] && player_available == 3'b010) || note_and_duration[1]) ? {1'b1, note_and_duration[14:3]} : {13'b0};
    assign {new_note3, note3, duration3} = (((state == `RETRIEVE_NOTE) && ~note_and_duration[15] && player_available == 3'b001) || note_and_duration[2]) ? {1'b1, note_and_duration[14:3]} : {13'b0};
    
    assign song_done = overflow;

endmodule
