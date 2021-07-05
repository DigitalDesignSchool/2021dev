`include "defines.svh"

module downsizing
  #(
    parameter W = 32 	//4 * 8 = 32 
  )
  (
    input aclk,
    input aresetn,

    input      [W * 2 - 1:0]  in_tdata,		// 8 symbols in string (input)
    input                     in_tvalid,
    output                    in_tready,
  
    output reg [W      - 1:0] out_tdata,	// 4 symbols in string (output)
    output reg                out_tvalid,
    input                     out_tready
  );

reg last_part;

  
always @(posedge aclk or negedge aresetn)
  if (! aresetn)
      last_part <= '0;
  else if (out_tvalid & out_tready | in_tvalid & in_tready & out_tready) 
      last_part <= ~ last_part;

always @(posedge aclk or negedge aresetn)
   if (! aresetn)
      out_tvalid <= '0;
   else if (out_tvalid & out_tready & ~ last_part)
      out_tvalid <= 1;
   else if (out_tvalid & out_tready &   last_part)
     if (in_tready & in_tvalid)
       out_tvalid <= '1;
  	 else
       out_tvalid <= '0;  
   else if ( in_tready &  in_tvalid)
      out_tvalid <= 1;
   
         

always @(posedge aclk)
  begin
    if (out_tvalid & out_tready)
      if (last_part)
        out_tdata <= in_tdata [W     - 1 : 0];
      else
        out_tdata <= in_tdata [W * 2 - 1 : W];
    else if (in_tready & in_tvalid)
      if (out_tready)
        if (~last_part)
          out_tdata <= in_tdata [W * 2 - 1 : W];
        else
          out_tdata <= in_tdata [W     - 1 : 0];
  end
  	

  
assign in_tready = ~ last_part & ~ out_tvalid | out_tready & out_tvalid & last_part;
  
endmodule