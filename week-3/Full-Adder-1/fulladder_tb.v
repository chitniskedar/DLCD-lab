module tb_fulladder;

reg i0, i1, cin;
wire sum, cout;

fa FA1(i0, i1, cin, sum, cout);

initial
begin
    $dumpfile("fulladder.vcd");
    $dumpvars(0, tb_fulladder);

    $monitor($time,
             " i0=%b, i1=%b, cin=%b, sum=%b, cout=%b",
             i0, i1, cin, sum, cout);

    #0  i0=0; i1=0; cin=0;
    #20 i0=0; i1=0; cin=1;
    #20 i0=0; i1=1; cin=0;
    #20 i0=0; i1=1; cin=1;
    #20 i0=1; i1=0; cin=0;
    #20 i0=1; i1=0; cin=1;
    #20 i0=1; i1=1; cin=0;
    #20 i0=1; i1=1; cin=1;

    #20 $finish;
end

endmodule