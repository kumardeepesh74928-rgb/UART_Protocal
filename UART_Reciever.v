
module uart_reciever(clk,rst,rx,rdy_clr,clk_en,rdy,data_out);

input clk;
input rst;
input rx;
input rdy_clr;
input clk_en;

output reg rdy;
output reg [7:0] data_out;

localparam start_state    = 2'b00;
localparam data_out_state = 2'b01;
localparam stop_state     = 2'b10;
localparam data_state     = 2'b11;

reg [1:0] state;
reg [3:0] sample;
reg [2:0] index;
reg [7:0] temp_register;

always @(posedge clk) begin

    if(rst) begin
        state         <= start_state;
        sample        <= 4'd0;
        index         <= 3'd0;
        temp_register <= 8'd0;
        data_out      <= 8'd0;
        rdy           <= 1'b0;
    end

    else begin

        if(rdy_clr)
            rdy <= 1'b0;

        if(clk_en) begin

            case(state)

                // Wait for start bit
                start_state: begin
                    if(rx == 1'b0) begin
                        state  <= data_out_state;
                        sample <= 4'd0;
                        index  <= 3'd0;
                    end
                end

                // Verify start bit at its middle
                data_out_state: begin

                    if(sample == 4'd7) begin
                        if(rx == 1'b0) begin
                            sample <= 4'd0;
                            state  <= data_state;
                        end
                        else begin
                            state  <= start_state;
                            sample <= 4'd0;
                        end
                    end
                    else begin
                        sample <= sample + 1'b1;
                    end

                end

                // Receive 8 data bits
               data_state : begin

                    if(sample == 4'd15) begin

                        temp_register[index] <= rx;
                        sample <= 4'd0;

                        if(index == 3'd7) begin
                            state <= stop_state;
                        end
                        else begin
                            index <= index + 1'b1;
                        end

                    end
                    else begin
                        sample <= sample + 1'b1;
                    end

                end

                // Check stop bit
                stop_state: begin

                    if(sample == 4'd15) begin

                        if(rx == 1'b1) begin
                            data_out <= temp_register;
                            rdy <= 1'b1;
                        end

                        state  <= start_state;
                        sample <= 4'd0;
                        index  <= 3'd0;

                    end
                    else begin
                        sample <= sample + 1'b1;
                    end

                end

                default: begin
                    state  <= start_state;
                    sample <= 4'd0;
                end

            endcase
        end
    end
end

endmodule

