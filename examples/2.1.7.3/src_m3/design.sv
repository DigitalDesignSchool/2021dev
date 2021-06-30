`include "defines.svh"
`default_nettype none 

module upsizing
  #(
    parameter W = 40
  )
  (
    input aclk,
    input aresetn,

    input      [W     - 1:0] in_tdata,
    input                    in_tvalid,
    output                   in_tready,
  
    output reg [W * 2 - 1:0] out_tdata,
    output reg               out_tvalid,
    input                    out_tready
  );
  
  reg lower_bits;

  // We change the data in output register
  // if and only if the input transfer is accepted,
  // i.e. in_tvalid & in_tready
  
  always @(posedge aclk or negedge aresetn)
    if (! aresetn)
      lower_bits <= '0;
    else if (in_tvalid & in_tready)
      lower_bits <= ~ lower_bits;
  
  always @(posedge aclk)
    if (in_tvalid & in_tready)
      begin
        if (lower_bits)
          out_tdata [W     - 1:0] <= in_tdata;
        else
          out_tdata [W * 2 - 1:W] <= in_tdata;
      end

  always @(posedge aclk or negedge aresetn)
    if (! aresetn)
      out_tvalid <= '0;
    else if (in_tvalid & lower_bits)
      out_tvalid <= '1;
    else if (out_tready)
      out_tvalid <= '0;
  
  no_lower_bits_and_valid:
    assert property (@ (posedge aclk) disable iff (! aresetn)
      ~ (lower_bits & out_tvalid));
  
  // We are ready to accept the input transfer
  // in either of two cases:
  //
  // 1. the downstream is ready, which means that the currently waiting transfer (if ever) is going out now;
  // 2. if we have a space, i.e. lower_bits == 1
  
  assign in_tready = out_tready | lower_bits;
      
endmodule 	