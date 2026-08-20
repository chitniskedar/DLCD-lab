module fulladder2(i0, i1, cin, sum, cout);

input i0, i1, cin;
output sum, cout;
assign sum = i0 ^ i1 ^ cin;
assign cout = (i0 & i1) | (i1 & cin) | (i0 & cin);

endmodule