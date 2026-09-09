module TB;

reg clk, in;
wire out;

// Instantiate D flip-flop
df df_1 (
    .clk(clk),
    .in(in),
    .out(out)
);

// Clock generation
initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end

// VCD dump for GTKWave
initial begin
    $dumpfile("dff_test.vcd");
    $dumpvars(0, TB);
end

// Input stimulus
initial begin
    in = 1'b1;

    #7  in = 1'b0;
    #10 in = 1'b1;
    #10 in = 1'b1;
    #10 in = 1'b0;
    #10 in = 1'b0;
    #10 in = 1'b1;
    #10 in = 1'b1;
    #10 in = 1'b0;

    #10 $finish;
end

// Monitor
initial begin
    $monitor($time, " clk=%b, in=%b, out=%b", clk, in, out);
end

endmodule