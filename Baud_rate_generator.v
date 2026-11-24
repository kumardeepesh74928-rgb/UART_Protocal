module baud_rate_generator(clk,rst,tx_enb,rx_enb);

input clk,rst;
output tx_enb;
output rx_enb;

reg [12:0] tx_counter;
reg [12:0] rx_counter;

always@(posedge clk) begin

if(rst)
    tx_counter <= 13'd0;


else if(tx_counter == 13'd5208)
    tx_counter <= 0;
  else
    tx_counter  <= tx_counter + 1'b1;

end

always@(posedge clk) begin

if(rst)
    rx_counter <= 13'd0;


else if(rx_counter == 13'd324)
    rx_counter <= 13'd0;
  else
    rx_counter  <= rx_counter + 1'b1;

end

assign tx_enb = (tx_counter == 0)? 1'b1 : 1'b0;
assign rx_enb = (rx_counter == 0)? 1'b1 : 1'b0;


endmodule
