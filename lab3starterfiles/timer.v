// Code your design here
module timer (
  input clk, 
  input rst,
  input wire [3:0] load_value, 
  input wire count_en,
  input wire fast,
  output wire q
);
  
  reg [8:0] counter;
  
  always @(*) begin
    if (fast) begin
      if(load_value[0] == 1) begin
        counter = 9'd4;
      end 
      
      else if(load_value[1] == 1) begin
        counter = 9'd8;
      end 
      
      else if(load_value[2] == 1) begin
        counter = 9'd16;
      end 
      
      else if(load_value[3] == 1) begin
        counter = 9'd32;
      end 
    end 
      
    else begin 
      if(load_value[0] == 1) begin
        counter = 9'd32;
      end 
      
      else if(load_value[1] == 1) begin
        counter = 9'd64;
      end 
      
      else if(load_value[2] == 1) begin
        counter = 9'd128;
      end 
      
      else if(load_value[3] == 1) begin
        counter = 9'd256;
      end 
    end
  end
  
  wire[8:0] next;
  wire[8:0] out;
    
  dffre #(9) ff(.clk(clk),
                .r(rst), 
                .en(count_en),
                .d(next), 
                .q(out)
  );

  assign next = (out == 0) ? counter : out - 1;
  
  assign q = (out == 0) ? 1 : 0;
  
endmodule
