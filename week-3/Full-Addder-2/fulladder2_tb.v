`define TESTVECS 8

module tb_fulladder2;

reg i0, i1, cin;
wire sum, cout;

reg [2:0] test_vecs [0:7];

integer i;

fulladder2 FA1(i0, i1, cin, sum, cout);

initial
begin
    i0 = 0;
    i1 = 0;
    cin = 0;

    $dumpfile("fulladder2.vcd");
    $dumpvars(0, tb_fulladder2);

    for(i = 0; i < `TESTVECS; i = i + 1)
    begin
        #20 {i0, i1, cin} = test_vecs[i];
    end
    #20 $finish;
end

initial
begin
    test_vecs[0] = 3'b000;
    test_vecs[1] = 3'b001;
    test_vecs[2] = 3'b010;
    test_vecs[3] = 3'b011;
    test_vecs[4] = 3'b100;
    test_vecs[5] = 3'b101;
    test_vecs[6] = 3'b110;
    test_vecs[7] = 3'b111;
end

initial
begin
    $monitor($time,
             " i0=%b, i1=%b, cin=%b, sum=%b, cout=%b",
             i0, i1, cin, sum, cout);
end

endmodule