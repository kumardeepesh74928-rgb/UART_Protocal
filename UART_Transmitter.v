
module uart_transmitter(clk,clk_enb,wr_enb,rst,data_in,tx,busy);

input clk;
input rst;
input wr_enb;
input clk_enb;
input [7:0] data_in;

output reg tx;
output busy;

reg [7:0] data;
reg [1:0] state,next_state;
reg [2:0] index;

localparam IDLE  = 2'b00;
localparam START = 2'b01;
localparam DATA  = 2'b10;
localparam STOP  = 2'b11;



always @(posedge clk) begin

    if(rst) begin

        data <= 0;
        index <= 0;
        state <= IDLE;

    end

    else begin

        state <= next_state;

        if(state == IDLE && wr_enb) begin

            data <= data_in;
            index <= 3'b0;

        end

     

        else if(state == DATA && clk_enb) begin

            if(index < 3'd7)
                index <= index + 1'b1;

        end

    end

end


always @(*) begin

    next_state = state;
    tx = 1'b1;

    case(state)

    IDLE: begin

        tx = 1'b1;

        if(wr_enb)
            next_state = START;

    end

    START: begin

        tx = 1'b0;

        if(clk_enb)
            next_state = DATA;

    end

    DATA: begin

        tx = data[index];

        if(clk_enb) begin

            if(index == 3'd7)
                next_state = STOP;
            else
                next_state = DATA;

        end

    end

    STOP: begin

        tx = 1'b1;

        if(clk_enb)
            next_state = IDLE;

    end

    default: begin

        next_state = IDLE;
        tx = 1'b1;

    end

    endcase

end

assign busy = (state != IDLE);

endmodule

