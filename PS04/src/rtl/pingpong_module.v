`timescale 1ns / 1ps

module pingpong_module(
    parameter MAX_THRESHOLD = 100,
    parameter MIN_THRESHOLD = 0
)(
    input clk,
    input rst,

    input signed [31:0] input_number,
    
    output [31:0] curr_reg_value
);

    reg signed [31:0] storing_number;
    reg state;

    assign curr_reg_value = storing_number;

    always @(posedge clk) begin
        if (rst) begin 
            storing_number <= 0;
            state <= 0;
        end else begin
            case (state)
                1'b0: begin
                    if (storing_number >= MAX_THRESHOLD)
                        state <= 1;
                    else
                        storing_number <= storing_number + input_number;
                end
                
                1'b1: begin
                    if (storing_number <= MIN_THRESHOLD)
                        state <= 0;
                    else
                        storing_number <= storing_number - input_number;
                end
            endcase
        end
    end
endmodule
