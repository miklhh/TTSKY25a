module test
  (input  clk,
   input  rst_n,
   input  ena,
   input  [7:0] ui_in,
   input  [7:0] uio_in,
   output [7:0] uo_out,
   output [7:0] uio_out,
   output [7:0] uio_oe);
  wire n6;
  wire [7:0] n8;
  reg [7:0] n11;
  localparam [7:0] n12 = 8'bZ;
  localparam [7:0] n13 = 8'bZ;
  assign uo_out = n11; //(module output)
  assign uio_out = n12; //(module output)
  assign uio_oe = n13; //(module output)
  /* test.vhdl:26:22  */
  assign n6 = ~rst_n;
  /* test.vhdl:26:13  */
  assign n8 = n6 ? 8'b00000000 : ui_in;
  /* test.vhdl:25:9  */
  always @(posedge clk)
    n11 <= n8;
endmodule

