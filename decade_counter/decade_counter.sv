module decade_counter (
    input  wire      clk,            // Clock input
    input  wire      reset,          // Asynchronous reset
    output reg [3:0] count           // 4-bit count output
);

    // Next count logic
    reg [3:0] next_count;

    // Combinational logic for next state
    always@* begin
        if (reset) begin
            next_count = 4'b0000;     // Reset to 0
        end else if (count == 4'b1001) begin
            next_count = 4'b0000;     // Reset to 0 after 9
        end else begin
            next_count = count + 1;   // Increment count
        end
    end

    // Sequential logic for count update
    always @(posedge clk) begin
        count <= next_count;          // Update count at the positive edge of the clock
    end

endmodule
