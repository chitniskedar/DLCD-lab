module and2(c, b, w1);
    input c, b;
    output w1;
    assign w1 = c & b;
endmodule


module or2(w1, a, d);
    input w1, a;
    output d;
    assign d = w1 | a;
endmodule

module simple_circuit(a, b, c, d);
    input a, b, c;
    output d;
    wire w1;
    and2 M1(c, b, w1);
    or2  M2(w1, a, d);

endmodule