module prefix_adder_tb;

    reg [3:0] a;
    reg [3:0] b;
    reg cin;

    wire [3:0] sum;
    wire cout;

    prefix_adder uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    // GTKWave dump
    initial begin
        $dumpfile("prefix_adder_tb.vcd");
        $dumpvars(0, prefix_adder_tb);
    end

    initial begin

        $monitor("a=%b b=%b cin=%b | sum=%b cout=%b",
                 a, b, cin, sum, cout);

        a = 4'b0000; b = 4'b0000; cin = 0;
        #10;

        a = 4'b0101; b = 4'b0011; cin = 0;
        #10;

        a = 4'b1010; b = 4'b0101; cin = 0;
        #10;

        a = 4'b1111; b = 4'b0001; cin = 0;
        #10;

        a = 4'b1111; b = 4'b1111; cin = 0;
        #10;

        $finish;
    end

endmodule