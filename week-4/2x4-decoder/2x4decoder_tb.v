`timescale 1ns/1ps

module dec2to4_tb;

reg [1:0] a;
reg en;
wire [3:0] y;

dec2to4 uut (
    .a(a),
    .en(en),
    .y(y)
);

initial begin
    $dumpfile("dec2to4.vcd");
    $dumpvars(0, dec2to4_tb);

    en = 0; a = 2'b00; #10;
    en = 1; a = 2'b00; #10;
    a = 2'b01; #10;
    a = 2'b10; #10;
    a = 2'b11; #10;
    en = 0; #10;

    $finish;
end

endmodule