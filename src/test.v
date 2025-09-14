module top_module
  (input  clk,
   input  rst_n,
   input  ena,
   input  [7:0] ui_in,
   input  [7:0] uio_in,
   output [7:0] uo_out,
   output [7:0] uio_out,
   output [7:0] uio_oe);
  reg [7:0] n8;
  localparam [7:0] n9 = 8'bZ;
  localparam [7:0] n10 = 8'bZ;
  assign uo_out = n8; //(module output)
  assign uio_out = n9; //(module output)
  assign uio_oe = n10; //(module output)
  /* test.vhdl:26:9  */
  always @(posedge clk)
    n8 <= ui_in;
endmodule

