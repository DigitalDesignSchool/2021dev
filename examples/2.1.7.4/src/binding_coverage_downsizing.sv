//`include "defines.svh"


module binding_coverage_downsizing
# (
  parameter n = 5, nb = n * 8
)
(
  input  wire              aclk,
  input  wire              aresetn,

  input  wire [nb*2 - 1:0] in_tdata,
  input  wire              in_tvalid,
  input  wire              in_tready,

  input  wire [nb - 1:0]   out_tdata,
  input  wire              out_tvalid,
  input  wire              out_tready,
  
  input	wire			   flag_hf
);
  
    `ifdef COVERAGE
  
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
      bins true = { 1 };
      bins false = { 0 };
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
      illegal_bins illegal
      =        (binsof (in_tvalid.no_ivld) && binsof (in_tready.irdy))
            || (binsof (flag_hf.false)  && binsof (in_tready.irdy))
            || (binsof(in_tvalid.no_ivld) && binsof(flag_hf.true));

    //   illegal_bins illegal
    //   =    (binsof (flag_hf.true) && binsof (in_tready.no_irdy))
    //       || (binsof (in_tvalid.no_ivld)  && binsof (in_tready.irdy))
    //   || (binsof(in_tvalid.ivld) && binsof(in_tready.irdy) && binsof(flag_hf.false));
    }


    o_vld_rdy_lower_upper: cross out_tvalid, out_tready, flag_hf
    {
    //   illegal_bins illegal 
    //   = (binsof(out_tvalid.ovld) && binsof(out_tready.no_ordy) && binsof(flag_hf.true)) || (binsof(out_tvalid.no_ovld) && binsof(flag_hf.true));
       illegal_bins illegal 
       = (binsof(out_tvalid.no_ovld) && binsof(flag_hf.true));
    }
    
    // Transitions
    
    o_rdy_transitions: coverpoint out_tready
    {
      bins ordy_101             = ( 1 => 0 => 1 );
      bins ordy_101_or_1001     = ( 1 => 0 => 1 ), ( 1 => 0 => 0 => 1 );
      bins ordy_1_from_3_5_0_1  = ( 1 => 0 [*3:5] => 1 );
    }

endgroup
      
cvr cg = new ();    

  `endif
  
endmodule