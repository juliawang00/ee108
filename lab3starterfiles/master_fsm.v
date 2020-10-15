module master_fsm (
  input faster, 
  input slower,
  input clk,
  input rst,
  input next,
  input [3:0] state,
  output wire [1:0] mux_input,
  output wire shift_left_1,
  output wire shift_right_1,
  output wire shift_left_2,
  output wire shift_right_2
);
  
  reg in, sl1, sl2, sr1, sr2;
  always @(*) begin
    case(state)
      // ON --> call mux with high
      3'b001: begin
        in = 2'b01;
      end
       // FLASH 1
      3'b011: begin
        in = 2'b10;
        sl1 = shift_left_1;
        sr1 = shift_right_1;
        sl2 = 1'b0;
        sr2 = 1'b0;
      end
      // FLASH 2
      3'b101: begin
        in = 2'b11;
        sl1 = 1'b0;
        sr1 = 1'b0;
        sl2 = shift_left_2;
        sr2 = shift_right_2;
      end
      // OFF --> call mux with low
      default: in = 2'b00;
    endcase
  end
  
  assign shift_left_1 = sl1;
  assign shift_right_1 = sr1;
  assign shift_left_2 = sl2;
  assign shift_right_2 = sr2;
  assign mux_input = in;
  assign state = rst ? 3'b000 : state + next;

endmodule
