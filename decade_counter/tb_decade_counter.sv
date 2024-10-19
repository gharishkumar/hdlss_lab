module tb_decade_counter;

    reg clk;
    reg reset;
    wire [3:0] count;

    // Instantiate the decade counter
    decade_counter uut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    // Clock generation
    // initial begin
    //     clk = 0;
    //     always #5 clk = ~clk; // 10 time unit period
    // end

    // Test sequence
    initial begin
        reset = 1;
        #10 reset = 0; // Release reset after 10 time units
        #100; // Run for some time
        reset = 1; // Assert reset
        #10 reset = 0; // Release reset again
        // #100 $finish; // End the simulation
    end

    // Waveform dump for GTKWave
    initial begin
        $dumpfile("tb_decade_counter.vcd");
        $dumpvars(0, tb_decade_counter);
    end

endmodule
