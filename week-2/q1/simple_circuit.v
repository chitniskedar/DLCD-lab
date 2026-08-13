module and2(a, b, w1);
    input a, b;
    output w1;
    assign w1 = a&b;
endmodule


module or2(w1, e, d);
    input w1, e;
    output d;
    assign d = w1|e;
endmodule


module not2(c, e);
    input c;
    output e;
    assign e=!c;
endmodule


module simple_circuit(a, b, c, d, e);
    input a, b, c;
    output d, e;
    wire w1;

    and2 g1(a, b, w1);
    not2 g2(c, e);
    or2 g3(w1, e, d);

endmodule