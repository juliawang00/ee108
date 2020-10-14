module shifter ( 
  input wire shift_right, 
  input wire [3:0] state, 
  output wire [3:0] out
);

  reg [3:0] shifted;
  
  always @* begin
    if(shift_right) begin
      
      if(state[0] != 1)begin
      	shifted = state >> 1;
      end
      
      else begin
        shifted = state;
      end 
      
    end

    else begin
      if(state[3] != 1'b1) begin
      	shifted = state << 1;
      end
      else begin
        shifted = state;
      end
    end
  end
  
  assign out = shifted;
  
  
endmodule
