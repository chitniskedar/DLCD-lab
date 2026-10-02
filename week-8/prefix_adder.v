module prefix_adder (
    input  [3:0] a,
    input  [3:0] b,
    input  cin,
    output [3:0] sum,
    output cout
);

    wire [3:0] p, g;
    wire [3:0] P, G;
    wire [4:0] c;

    //generate
    assign p = a ^ b;
    assign g = a & b;

    assign P[0] = p[0];
    assign G[0] = g[0];

    assign P[1] = p[1] & p[0];
    assign G[1] = g[1] | (p[1] & g[0]);

    assign P[2] = p[2] & p[1] & p[0];
    assign G[2] = g[2] |
                  (p[2] & g[1]) |
                  (p[2] & p[1] & g[0]);

    assign P[3] = p[3] & p[2] & p[1] & p[0];
    assign G[3] = g[3] |
                  (p[3] & g[2]) |
                  (p[3] & p[2] & g[1]) |
                  (p[3] & p[2] & p[1] & g[0]);

    // carry
    assign c[0] = cin;
    assign c[1] = G[0] | (P[0] & cin);
    assign c[2] = G[1] | (P[1] & cin);
    assign c[3] = G[2] | (P[2] & cin);
    assign c[4] = G[3] | (P[3] & cin);

    // sum
    assign sum = p ^ c[3:0];

    assign cout = c[4];

endmodule