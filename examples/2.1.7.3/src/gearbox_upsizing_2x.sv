
`default_nettype none 

module gearbox_upsizing_2x
# (
  parameter n = 5, nb = n * 8
)
(
  input  wire             aclk,
  input  wire             aresetn,

  input  wire [nb - 1:0]  in_tdata,
  input  wire             in_tvalid,
  output wire             in_tready,

  output wire[nb - 1:0]   out_tdata,
  output wire             out_tvalid,
  input  wire             out_tready
);


endmodule

`default_nettype wire