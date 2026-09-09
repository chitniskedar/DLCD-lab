module df (input clk, in, output out);
  reg df_out;
  always@(posedge clk) df_out <= in;
  assign out = df_out;
endmodule
