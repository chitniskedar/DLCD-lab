module comparator_tb;

    reg [3:0] a;
    reg [3:0] b;

    wire gt;
    wire eq;
    wire lt;

    comparator uut (
        .a(a),
        .b(b),
        .gt(gt),
        .eq(eq),
        .lt(lt)
    );

    // GTKWave dump
    initial begin
        $dumpfile("comparator_tb.vcd");
        $dumpvars(0, comparator_tb);
    end

    initial begin

        $monitor("a=%b b=%b | gt=%b eq=%b lt=%b",
                 a, b, gt, eq, lt);

        a = 4'b0000; b = 4'b0000;
        #10;

        a = 4'b0101; b = 4'b0011;
        #10;

        a = 4'b0011; b = 4'b0101;
        #10;

        a = 4'b1010; b = 4'b1010;
        #10;

        a = 4'b1111; b = 4'b0001;
        #10;

        $finish;
    end

endmodule