// Code your design here
module timer (
  input clk, 
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
  
  reg[8:0] hold = counter;
  wire next = 1'b0;
    
  dffre #(1) ff(.clk (clk),
               .r (0), 
               .en(count_en),
                .d (1), 
                .q(next)
  );
  
  //counter = counter - 1'b1;
  
  assign q = !(|counter);
  
  always @(*) begin
  
    if(counter == 0)begin 
      counter = hold;
    end
    
    else begin 
      counter = counter;
    end
    
  end
  
endmodule
