module tb_simple_circuit;
    wire d;
    reg a, b, c;

    simple_circuit M1(a, b, c, d);
    initial
    begin
        $dumpfile("simple.vcd");
        $dumpvars(1, tb_simple_circuit);

        a = 1'b0; b = 1'b0; c = 1'b0;
        #20;
        a = 1'b0; b = 1'b0; c = 1'b1;
        #20;
        a = 1'b0; b = 1'b1; c = 1'b0;
        #20;
        a = 1'b0; b = 1'b1; c = 1'b1;
        #20;
        a = 1'b1; b = 1'b0; c = 1'b0;
        #20;
        a = 1'b1; b = 1'b0; c = 1'b1;
        #20;
        a = 1'b1; b = 1'b1; c = 1'b0;
        #20;
        a = 1'b1; b = 1'b1; c = 1'b1;
        #20;
    end

    initial
    #200 $finish;
endmodule