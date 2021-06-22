`include "defines.svh"

module downsizing
  #(
    parameter W = 32
  )
  (
    input aclk,
    input aresetn,

    input      [W * 2 - 1:0]  in_tdata,
    input                     in_tvalid,
    output                    in_tready,
  
    output reg [W      - 1:0] out_tdata,
    output reg                out_tvalid,
    input                     out_tready
  );

  reg last_part;

  wire n_last_part
    = out_tvalid & out_tready ? ~ last_part : last_part;

  always @(posedge aclk or negedge aresetn)
    if (~ aresetn)
      last_part <= '1;
    else
      last_part <= n_last_part;
  
  always @(posedge aclk)
    if (out_tvalid & ~ out_tready)
      ;  // Waiting
    else if (n_last_part)
      out_tdata <= in_tdata [W * 2 - 1 : W];
    else
      out_tdata <= in_tdata [W     - 1 : 0];

  always @(posedge aclk)
    if (~ aresetn)
      out_tvalid <= '0;
    else if (in_tvalid)
      out_tvalid <= '1;
    else if (out_tready)
      out_tvalid <= '0;

  assign in_tready = out_tvalid & out_tready & last_part;

endmodule
