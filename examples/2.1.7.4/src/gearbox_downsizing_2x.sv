// Code your design here

`default_nettype none 

module gearbox_downsizing_2x
# (
  parameter n = 5, nb = n * 8
)
(
  input  wire             aclk,
  input  wire             aresetn,

  input  wire [nb*2 - 1:0]  in_tdata,
  input  wire             in_tvalid,
  output wire             in_tready,

  output wire [nb - 1:0] out_tdata,
  output wire             out_tvalid,
  input  wire             out_tready
);

logic             flag_hf;


always @(posedge aclk)
  if( ~aresetn )
    flag_hf <= #1 '0;
  else if( out_tvalid & out_tready )
    flag_hf <= #1 ~flag_hf;



assign   out_tdata = (flag_hf) ?  in_tdata[0+:nb] : in_tdata[nb+:nb];

assign in_tready = flag_hf & out_tready;

assign out_tvalid = in_tvalid;



covergroup cvr  @ (posedge aclk iff aresetn);
    option.comment      = "Comment for the report: downsizing covergroup";
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

    i_vld_rdy: cross in_tvalid,  in_tready
    {
      illegal_bins illegal
        =    binsof (in_tvalid.no_ivld) && binsof (in_tready.irdy);
    }

    o_vld_rdy: cross out_tvalid, out_tready;

    // There is a coverage hole here. Can you find?
    
    i_vld_rdy_lower_upper: cross in_tvalid, in_tready, flag_hf
    {

    
      // illegal_bins illegal
      //   =    (binsof (flag_hf) intersect { 0 }
      //     && binsof (in_tready) intersect { 1 }) 
          
      //     || ( 
      //       binsof (in_tvalid) intersect { 0 }
      //       && binsof (in_tready) intersect { 1 }
      //     )
      //     ;

      illegal_bins illegal
        =    (binsof (flag_hf.lower) && binsof (in_tready.irdy))
          
          || (binsof (in_tvalid.no_ivld)  && binsof (in_tready.irdy))
        ;


    }


    o_vld_rdy_lower_upper: cross out_tvalid, out_tready, flag_hf;
    
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