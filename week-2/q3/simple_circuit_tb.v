module tb_circuit3;
    wire z;
    reg a2, b2, c2;
    circuit3 M1(a2, b2, c2, z);

    initial
    begin
        $dumpfile("circuit3.vcd");
        $dumpvars(1, tb_circuit3);

        a2 = 1'b0; b2 = 1'b0; c2 = 1'b0;
        #20;
        a2 = 1'b0; b2 = 1'b0; c2 = 1'b1;
        #20;
        a2 = 1'b0; b2 = 1'b1; c2 = 1'b0;
        #20;
        a2 = 1'b0; b2 = 1'b1; c2 = 1'b1;
        #20;
        a2 = 1'b1; b2 = 1'b0; c2 = 1'b0;
        #20;
        a2 = 1'b1; b2 = 1'b0; c2 = 1'b1;
        #20;
        a2 = 1'b1; b2 = 1'b1; c2 = 1'b0;
        #20;
        a2 = 1'b1; b2 = 1'b1; c2 = 1'b1;
        #20;

        $finish;
    end
endmodule