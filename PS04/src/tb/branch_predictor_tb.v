`timescale 1ns / 1ps

module branch_predictor_tb;
    reg clk;
    reg reset;
    reg branch_taken;
    reg branch_not_taken;
    wire branch_prediction;

    // Module branch_predictor
    branch_predictor test (
        .clk(clk),
        .reset(reset),
        .branch_taken(branch_taken),
        .branch_not_taken(branch_not_taken),
        .branch_prediction(branch_prediction)
    );

    // Clock Generation
    initial begin
        clk = 0;
        forever #5 // every 5 ns
        clk = ~clk; // swap clk signal 0 -> 1, 1 -> 0
    end

    // Main Simulation
    initial begin
        
        // Initialize Inputs
        reset = 0; 
        branch_taken = 0; 
        branch_not_taken = 0; 

        $display("=====================================================================================");
        $display("     %-10s         | %-5s | %-5s | %-6s | %-10s | %-8s | %-8s", 
                 "Time", "Reset", "Taken", "NotTkn", "Prediction", "TakenCnt", "NotTknCnt");
        $display("=====================================================================================");

        // Step 0: Initial Reset
        reset = 1;
        #10
        reset = 0;
        #10

        // Step 1: Input Taken (3 times)
        repeat(3) begin
            branch_taken = 1; 
            #10;
            display_status();
            branch_taken = 0; 
            #10;
        end

        // Step 2: Input Not-Taken (5 times)
        repeat(5) begin
            branch_not_taken = 1; 
            #10;
            display_status();
            branch_not_taken = 0; 
            #10;
        end

        // Step 3: Reset Test
        reset = 1; 
        #10; 
        display_status();
        reset = 0; 
        #10;
        display_status();

        // Step 4: Input Taken (3 times)
        repeat(3) begin
            branch_taken = 1; 
            #10;
            display_status();
            branch_taken = 0; 
            #10;
        end

        // Step 5: Input Not-Taken (4 times)
        repeat(4) begin
            branch_not_taken = 1; 
            #10;
            display_status();
            branch_not_taken = 0; 
            #10;
        end

        // Step 6: Train Taken (3 times)
        repeat(2) begin
            branch_taken = 1; 
            #10;
            display_status();
            branch_taken = 0; 
            #10;
        end

        $display("=====================================================================================");
        $display("                           Simulation Completed Successfully");
        $display("=====================================================================================");
        #10; $finish;
    end

    // Task for display status
    task display_status;
        begin
            $display("%-7t ns |   %-3b |   %-3b |   %-3b  |     %-6b | %-8d | %-8d", 
                     $time, 
                     reset, 
                     branch_taken, 
                     branch_not_taken, 
                     branch_prediction, 
                     test.taken_count, 
                     test.not_taken_count);
        end
    endtask
    
endmodule