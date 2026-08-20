module tb_simple_circuit;
wire D, E;
reg A, B, C;

simple_circuit M1 (A, B, C, D, E);
initial
begin
    $dumpfile("simple.vcd");
    $dumpvars(1, tb_simple_circuit);

    A = 1'b0; B = 1'b0; C = 1'b0;
    #20;
    A = 1'b0; B = 1'b0; C = 1'b1;
    #20;
    A = 1'b0; B = 1'b1; C = 1'b0;
    #20;
    A = 1'b0; B = 1'b1; C = 1'b1;
    #20;
    A = 1'b1; B = 1'b0; C = 1'b0;
    #20;
    A = 1'b1; B = 1'b0; C = 1'b1;
    #20;
    A = 1'b1; B = 1'b1; C = 1'b0;
    #20;
    A = 1'b1; B = 1'b1; C = 1'b1;
    #20;
end

initial
#200 $finish;
endmodule