module and2(c, b, w1);
    input c, b;
    output w1;
    assign w1 = c & b;
endmodule

module or2(w1, a, d);
    input w1, a;
    output d;
    assign d = w1|a;
endmodule

module circuit3(a2, b2, c2, z);
    input a2, b2, c2;
    output z;
    wire w1, w2, w3;
    and2 M1(c2, b2, w1);
    or2  M2(w1, a2, w2);
    and2 M3(b2, a2, w3);
    or2  M4(w2, w3, z);
endmodule