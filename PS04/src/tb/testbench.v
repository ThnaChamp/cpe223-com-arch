`timescale 1ns / 1ps

module testbench;

localparam MAX_THRESHOLD = 100;
localparam MIN_THRESHOLD = 0;

reg clk;
reg rst;

reg signed [31:0] input_number;

wire [31:0] curr_reg_value;

pingpong_module #(
    .MAX_THRESHOLD(MAX_THRESHOLD),
    .MIN_THRESHOLD(MIN_THRESHOLD)
) dut(
    .clk(clk),
    .rst(rst),

    .input_number(input_number),

    .curr_reg_value(curr_reg_value)
);

task reset_dut();
    begin
        rst = 1;
        input_number <= 0;   
    end
endtask

task set_input_number(input [31:0] val);
    begin
        @(posedge clk);
        input_number = val;
    end
endtask

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset_dut();

    repeat (2) @(posedge clk);
    rst = 0;

    set_input_number(32'd5);
    set_input_number(32'd10);
    set_input_number(32'd2);
    set_input_number(32'd3);
    set_input_number(32'd31);
    set_input_number(32'd50);

    @(posedge clk);
    if (curr_reg_value != 32'h65) begin
        $display("TESTCASE 1 RESULT: FAILED | Expected = 101 (decimal), got = %d (decimal)", curr_reg_value);
        $finish;
    end else begin
        $display("TESTCASE 1 RESULT: PASSED");
    end

    set_input_number(32'd70);
    set_input_number(32'd8);
    set_input_number(32'd3);
    set_input_number(32'd9);
    set_input_number(32'd12);
    
    @(posedge clk);
    if (curr_reg_value != 32'hffffffff) begin
        $display("TESTCASE 1 RESULT: FAILED | Expected = 101 (decimal), got = %d (decimal)", curr_reg_value);
        $finish;
    end else begin
        $display("TESTCASE 1 RESULT: PASSED");
    end

    repeat (10) @(posedge clk);
    $display("ALL TESTCASE PASSED!");
    $finish;
end

endmodule
