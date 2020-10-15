module master_fsm (
  input faster, 
  input slower, 
  input [3:0] next,
  output wire mux_input,
  output wire shift_left_1,
  output wire shift_right_1,
  output wire shift_left_2,
  output wire shift_right_2
);
  
  wire [3:0] state; // total of 6 possible states
  reg in, sl1, sl2, sr1, sr2;
  always @(*) begin
    case(state)
      // ON --> call mux with high
      3'b001: begin
        in = 1'b1;
      end
       // FLASH 1
      3'b011: begin
        sl1 = shift_left_1;
        sr1 = shift_right_1;
        sl2 = 1'b0;
        sr2 = 1'b0;
      end
      // FLASH 2
      3'b101: begin
        sl1 = 1'b0;
        sr1 = 1'b0;
        sl2 = shift_left_2;
        sr2 = shift_right_2;
      end
      // OFF --> call mux with low
      default: in = 1'b0;
    endcase
  end
  
  assign shift_left_1 = sl1;
  assign shift_right_1 = sr1;
  assign shift_left_2 = sl2;
  assign shift_right_2 = sr2;
  assign mux_input = in;
  assign state = next;
  assign next = rst ? 3'b000 : next + 1;

endmodule
