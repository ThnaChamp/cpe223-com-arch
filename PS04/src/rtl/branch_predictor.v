module branch_predictor (
    input clk,                 // Clock signal
    input reset,               // Reset signal
    input branch_taken,        // Signal indicating branch was taken
    input branch_not_taken,    // Signal indicating branch was not taken
    output branch_prediction   // Prediction output: 1 = predict taken, 0 = predict not taken
);
    // Declare two 32-bit registers
    reg [31:0] taken_count; 
    reg [31:0] not_taken_count;
    
    // Logic for prediction
    // If taken_count > not_taken_count, predict it to 1 and else is 0
    assign branch_prediction = (taken_count > not_taken_count) ? 1'd1 : 1'd0;
        
    // Logic for updating the value of Register    
    always @(posedge clk) begin
        if (reset) begin
            // If reset to 1, clear both values to 0
            taken_count     <= 32'd0;
            not_taken_count <= 32'd0;
        end
        else begin
            // If branch_taken is 1, increment taken_count by 1
            if (branch_taken) begin
                taken_count <= taken_count + 32'd1;
            end
            // If branch_not_taken is 1, increment not_taken_count by 1
            else if (branch_not_taken) begin
                not_taken_count <= not_taken_count + 32'd1;
            end
        end
    end
endmodule
