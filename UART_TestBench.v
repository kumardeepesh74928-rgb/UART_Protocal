
//`timescale 1ns/1ps

module uart_top_tb;

reg clk, rst;
reg [7:0] data_in;
reg wr_en;
reg rdy_clr;

wire rdy;
wire [7:0] dout;
wire busy;


uart_top dut(
    rst,
    data_in,
    wr_en,
    clk,
    rdy_clr,
    rdy,
    busy,
    dout
);

initial begin
    clk      = 1'b0;
    rst      = 1'b0;
    data_in  = 8'h00;
    wr_en    = 1'b0;
    rdy_clr  = 1'b0;
end


always #5 clk = ~clk;


initial begin
    $fsdbDumpfile("uart_pro.fsdb");
    $fsdbDumpvars(0, uart_top_tb);
end


task send_byte;
    input [7:0] din;
    begin
     
        wait(!busy);

        @(negedge clk);
        data_in = din;
        wr_en = 1'b1;

        @(negedge clk);
        wr_en = 1'b0;

        $display("[%0t] Transmitting data: %h", $time, din);
    end
endtask


task clear_ready;
    begin
        @(negedge clk);
        rdy_clr = 1'b1;

        @(negedge clk);
        rdy_clr = 1'b0;
    end
endtask


initial begin

    // Reset
    @(negedge clk);
    rst = 1'b1;

    @(negedge clk);
    rst = 1'b0;

    $display("[%0t] UART reset completed", $time);

  
    send_byte(8'h41);

  
    wait(!busy);

   
    wait(rdy == 1'b1);

    $display("[%0t] Received data: %h", $time, dout);

    clear_ready();

    
    send_byte(8'h55);

    wait(!busy);
    wait(rdy == 1'b1);

    $display("[%0t] Received data: %h", $time, dout);

    clear_ready();

    $display("[%0t] UART TEST COMPLETED", $time);

    #100;
    $finish;

end


initial begin
    #3000000;

    $display("ERROR: SIMULATION TIMEOUT!");
    $display("Check UART transmitter, receiver and baud rate generator.");

    $finish;
end

endmodule

