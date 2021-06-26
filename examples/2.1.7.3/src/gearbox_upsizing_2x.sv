// Code your design here

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

  output wire [nb*2- 1:0] out_tdata,
  output wire             out_tvalid,
  input  wire             out_tready
);

logic             flag_hf;
logic [nb-1:0]    reg_hf;

always @(posedge aclk)
  if( ~aresetn )
    flag_hf <= #1 '0;
  else if( in_tvalid & in_tready )
    flag_hf <= #1 ~flag_hf;

always  @(posedge aclk) 
  if( in_tvalid & in_tready & ~flag_hf )
    reg_hf <= #1 in_tdata;

assign out_tdata = { reg_hf, in_tdata };

assign in_tready = ~flag_hf | out_tready;

assign out_tvalid = flag_hf & in_tvalid;



covergroup cvr  @ (posedge aclk iff aresetn);
    option.comment      = "Comment for the report: upsizing covergroup";
    option.per_instance = 1;

    // First we check that every signal was toggled

    coverpoint in_tvalid
    {
      bins ivld    = { 1 };
      bins no_ivld = { 0 };
    }

    coverpoint in_tready
    {
      bins irdy    = { 1 };
      bins no_irdy = { 0 };
    }
    
    coverpoint out_tvalid
    {
      bins ovld    = { 1 };
      bins no_ovld = { 0 };
    }
    
    coverpoint out_tready
    {
      bins ordy    = { 1 };
      bins no_ordy = { 0 };
    }

    coverpoint flag_hf
    {
      bins lower = { 1 };
      bins upper = { 0 };
    }

    // Crosses

    i_vld_rdy: cross in_tvalid,  in_tready;
    o_vld_rdy: cross out_tvalid, out_tready;

    // There is a coverage hole here. Can you find?
    
    i_vld_rdy_lower_upper: cross i_vld_rdy, flag_hf
    {
      illegal_bins illegal
        =    binsof (flag_hf) intersect { 0 };
          //&& binsof (i_vld_rdy) intersect { 0 };
    }


   // o_vld_rdy_lower_upper: cross out_tvalid, out_tready, flag_hf

    // o_vld_rdy_lower_upper: cross out_tvalid, out_tready, flag_hf
    // {
    //   illegal_bins illegal
    //     =    binsof (lower_bits) intersect { 1 }
    //       && binsof (out_tvalid) intersect { 1 };
    // }
    
    // Transitions
    
    o_rdy_transitions: coverpoint out_tready
    {
      bins ordy_010             = ( 0 => 1 => 0 );
      bins ordy_101             = ( 1 => 0 => 1 );
      bins ordy_1001            = ( 1 => 0 => 0 => 1 );
      bins ordy_101_or_1001     = ( 1 => 0 => 1 ), ( 1 => 0 => 0 => 1 );
      bins ordy_10001           = ( 1 => 0 [*3] => 1 );
      bins ordy_1_from_3_5_0_1  = ( 1 => 0 [*3:5] => 1 );
    }

endgroup
      
cvr cg = new ();    


endmodule

`default_nettype wire