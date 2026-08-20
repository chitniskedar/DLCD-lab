
module xor2(a, b, c);
input a, b;
output c;
assign c = a ^ b;
endmodule


module and2(a, b, c);
input a, b;
output c;
assign c = a & b;
endmodule


module or2(a, b, c);
input a, b;
output c;
assign c = a | b;
endmodule


module fa(i0, i1, cin, sum, cout);
input i0, i1, cin;
output sum, cout;
wire w1, w2, w3;
xor2 G1(i0, i1, w1);
xor2 G2(w1, cin, sum);
and2 G3(i0, i1, w2);
and2 G4(w1, cin, w3);
or2 G5(w2, w3, cout);

endmodule