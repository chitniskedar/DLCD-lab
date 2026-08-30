module TB;

reg [0:3] I;
reg J1, J0;
wire O;

initial
begin
    $dumpfile("mux4_test.vcd");
    $dumpvars(0,TB);
end

initial
begin
    $monitor("Time=%0t  I=%b  J1=%b  J0=%b  O=%b", $time, I, J1, J0, O);
end

mux4 newMUX(.i(I), .j1(J1), .j0(J0), .o(O));

initial
begin
    I = 4'b0000; J1 = 1'b0; J0 = 1'b0;
    #5 I = 4'b0001; J1 = 1'b0; J0 = 1'b1;
    #5 I = 4'b0010; J1 = 1'b1; J0 = 1'b0;
    #5 I = 4'b0100; J1 = 1'b1; J0 = 1'b1;
    #5 I = 4'b1000; J1 = 1'b0; J0 = 1'b0;
    #5 I = 4'b1111; J1 = 1'b0; J0 = 1'b1;
    #5 I = 4'b1010; J1 = 1'b1; J0 = 1'b0;
    #5 I = 4'b0101; J1 = 1'b1; J0 = 1'b1;
end

endmodule