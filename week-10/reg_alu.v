module reg_file(
    input clk,
    input reset,
    input wr,

    input [2:0] rd_addr_a,
    input [2:0] rd_addr_b,
    input [2:0] wr_addr,

    input [15:0] d_in,

    output [15:0] d_out_a,
    output [15:0] d_out_b
);

    wire [15:0] r1;
    wire [15:0] r2;
    wire [15:0] r3;
    wire [15:0] r4;
    wire [15:0] r5;
    wire [15:0] r6;
    wire [15:0] r7;

    // Register 1
    dfrl reg1(
        .clk(clk),
        .reset(reset),
        .load(wr && (wr_addr == 3'd1)),
        .d(d_in),
        .q(r1)
    );

    // Register 2
    dfrl reg2(
        .clk(clk),
        .reset(reset),
        .load(wr && (wr_addr == 3'd2)),
        .d(d_in),
        .q(r2)
    );

    // Register 3
    dfrl reg3(
        .clk(clk),
        .reset(reset),
        .load(wr && (wr_addr == 3'd3)),
        .d(d_in),
        .q(r3)
    );

    // Register 4
    dfrl reg4(
        .clk(clk),
        .reset(reset),
        .load(wr && (wr_addr == 3'd4)),
        .d(d_in),
        .q(r4)
    );

    // Register 5
    dfrl reg5(
        .clk(clk),
        .reset(reset),
        .load(wr && (wr_addr == 3'd5)),
        .d(d_in),
        .q(r5)
    );

    // Register 6
    dfrl reg6(
        .clk(clk),
        .reset(reset),
        .load(wr && (wr_addr == 3'd6)),
        .d(d_in),
        .q(r6)
    );

    // Register 7
    dfrl reg7(
        .clk(clk),
        .reset(reset),
        .load(wr && (wr_addr == 3'd7)),
        .d(d_in),
        .q(r7)
    );

    // Read Port A
    assign d_out_a =
        (rd_addr_a == 3'd0) ? 16'd0 :
        (rd_addr_a == 3'd1) ? r1 :
        (rd_addr_a == 3'd2) ? r2 :
        (rd_addr_a == 3'd3) ? r3 :
        (rd_addr_a == 3'd4) ? r4 :
        (rd_addr_a == 3'd5) ? r5 :
        (rd_addr_a == 3'd6) ? r6 :
                              r7;

    // Read Port B
    assign d_out_b =
        (rd_addr_b == 3'd0) ? 16'd0 :
        (rd_addr_b == 3'd1) ? r1 :
        (rd_addr_b == 3'd2) ? r2 :
        (rd_addr_b == 3'd3) ? r3 :
        (rd_addr_b == 3'd4) ? r4 :
        (rd_addr_b == 3'd5) ? r5 :
        (rd_addr_b == 3'd6) ? r6 :
                              r7;

endmodule

// Register File + ALU

module reg_alu(
    input clk,
    input reset,
    input wr,

    input [2:0] rd_addr_a,
    input [2:0] rd_addr_b,
    input [2:0] wr_addr,

    input [15:0] d_in,

    input sel,
    input [3:0] op,

    output [15:0] d_out_a,
    output [15:0] d_out_b,

    output cout
);

    wire [15:0] alu_out;
    wire alu_cout;
    wire [15:0] write_data;
    // MUX
    // sel = 0 -> external d_in
    // sel = 1 -> ALU output
    assign write_data = sel ? alu_out : d_in;

    // Register File

    reg_file rf(
        .clk(clk),
        .reset(reset),
        .wr(wr),

        .rd_addr_a(rd_addr_a),
        .rd_addr_b(rd_addr_b),
        .wr_addr(wr_addr),

        .d_in(write_data),

        .d_out_a(d_out_a),
        .d_out_b(d_out_b)
    );
    // ALU
    alu alu1(
        .i0(d_out_a),
        .i1(d_out_b),
        .op(op),
        .out(alu_out),
        .cout(alu_cout)
    );
    // Register ALU carry output
    dfr cout_reg(
        .clk(clk),
        .reset(reset),
        .d(alu_cout),
        .q(cout)
    );

endmodule