module ripple_tb;

reg [3:0] a;
reg [3:0] b;
reg cin;

wire [3:0] sum;
wire cout;

ripple uut(
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
);

initial begin
    $dumpfile("ripple.vcd");
    $dumpvars(0, ripple_tb);

    $display("Test  A     B     Cin   Sum   Cout");

    a = 4'b0000; b = 4'b0000; cin = 1'b0;
    #1;
    $display("1     %b  %b    %b    %b    %b", a, b, cin, sum, cout);

    a = 4'b0001; b = 4'b0010; cin = 1'b0;
    #1;
    $display("2     %b  %b    %b    %b    %b", a, b, cin, sum, cout);

    a = 4'b0011; b = 4'b0101; cin = 1'b0;
    #1;
    $display("3     %b  %b    %b    %b    %b", a, b, cin, sum, cout);

    a = 4'b0110; b = 4'b0011; cin = 1'b0;
    #1;
    $display("4     %b  %b    %b    %b    %b", a, b, cin, sum, cout);

    a = 4'b1001; b = 4'b0110; cin = 1'b0;
    #1;
    $display("5     %b  %b    %b    %b    %b", a, b, cin, sum, cout);

    a = 4'b1010; b = 4'b0101; cin = 1'b1;
    #1;
    $display("6     %b  %b    %b    %b    %b", a, b, cin, sum, cout);

    a = 4'b1111; b = 4'b0001; cin = 1'b0;
    #1;
    $display("7     %b  %b    %b    %b    %b", a, b, cin, sum, cout);

    a = 4'b1111; b = 4'b1111; cin = 1'b1;
    #1;
    $display("8     %b  %b    %b    %b    %b", a, b, cin, sum, cout);

    $finish;
end

endmodule