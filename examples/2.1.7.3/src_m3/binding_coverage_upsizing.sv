//`include "defines.svh"

module  binding_coverage_upsizing
  #(
    parameter W = 40
  )
  (
    input aclk,
    input aresetn,

    input      [W     - 1:0] in_tdata,
    input                    in_tvalid,
    input                   in_tready,
  
    input reg [W * 2 - 1:0] out_tdata,
    input reg               out_tvalid,
    input                    out_tready
  );
  
  reg lower_bits;
  
  `ifdef COVERAGE

  wire [3:0] all_cases
      = { in_tvalid, lower_bits, out_tvalid, out_tready };

  covergroup cvr @ (posedge aclk iff aresetn);
    option.comment      = "Comment for the report: upsizing covergroup";
    option.per_instance = 1;

    // First we check that every signal was toggled

    coverpoint in_tvalid
    {
      bins ivld    = { 1 };
      bins no_ivld = { 0 };
    }

    coverpoint_without_bins_for_illustration: coverpoint in_tvalid;
    
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
    
    coverpoint lower_bits
    {
      bins lower = { 1 };
      bins upper = { 0 };
    }
    
    // Crosses

    o_vld_rdy: cross out_tvalid, out_tready;

    // There is a coverage hole here
    
    i_vld_i_rdy_lower_upper: cross in_tvalid,  in_tready, lower_bits
    {
//       bins illegal
//         = (binsof (lower_bits) intersect { 1 }) && (binsof (in_tready) intersect { 0 });
		illegal_bins illegal
        =    binsof (lower_bits.lower) && binsof (in_tready.no_irdy);
// 		bins illegal
//         = (binsof (lower_bits.lower) && binsof (in_tready.no_irdy);
    }

`ifdef UNDEFINED
    o_vld_o_rdy_lower_upper: cross out_tvalid, out_tready, lower_bits
    {
      illegal_bins illegal
        =    binsof (lower_bits) intersect { 1 }
          && binsof (out_tvalid) intersect { 1 };
    }
    
    
    // Transitions
    i_vld_lower_o_vld_o_rdy_transitions: coverpoint
    { in_tvalid, out_tready, lower_bits, out_tvalid }
    {
      bins i_vld_o_rdy_lower_o_vld_0000 = (4'b0000 => 4'b0000);
      bins i_vld_o_rdy_lower_o_vld_0001 = (4'b0001 => 4'b0001);
      bins i_vld_o_rdy_lower_o_vld_0010 = (4'b0010 => 4'b0010);
      
      bins i_vld_o_rdy_lower_o_vld_0100 = (4'b0100 => 4'b0100);
      bins i_vld_o_rdy_lower_o_vld_0101 = (4'b0101 => 4'b0100);//remove valid
      bins i_vld_o_rdy_lower_o_vld_0110 = (4'b0110 => 4'b0110);
      
      bins i_vld_o_rdy_lower_o_vld_1000 = (4'b1000 => 4'b1000);
      bins i_vld_o_rdy_lower_o_vld_1001 = (4'b1001 => 4'b1001);
      bins i_vld_o_rdy_lower_o_vld_1010 = (4'b1010 => 4'b1011);//fill right
      
      bins i_vld_o_rdy_lower_o_vld_1100 = (4'b1100 => 4'b1100);
      bins i_vld_o_rdy_lower_o_vld_1101 = (4'b1101 => 4'b1100);//fill left, remove valid
      bins i_vld_o_rdy_lower_o_vld_1110 = (4'b1110 => 4'b1111);//fill right

      illegal_bins others = default; 
    }
    
`endif
        
    o_rdy_transitions: coverpoint out_tready
    {
      bins ordy_010             = ( 0 => 1 => 0 );
      bins ordy_101             = ( 1 => 0 => 1 );
      bins ordy_1001            = ( 1 => 0 => 0 => 1 );
      bins ordy_101_or_1001     = ( 1 => 0 => 1 ), ( 1 => 0 => 0 => 1 );
      bins ordy_10001           = ( 1 => 0 [*3] => 1 );
      bins ordy_1_from_3_5_0_1  = ( 1 => 0 [*3:5] => 1 );
    }
    
    
    i_vld_lower_o_vld_o_rdy: coverpoint
    { in_tvalid, out_tready, lower_bits, out_tvalid }
    {
      bins         i_vld_o_rdy_lower_o_vld_0000 = { 4'b0000 };
      bins 		   i_vld_o_rdy_lower_o_vld_0001 = { 4'b0001 };
      illegal_bins i_vld_o_rdy_lower_o_vld_0011 = { 4'b0011 };
      
      bins         i_vld_o_rdy_lower_o_vld_0100 = { 4'b0100 };
      bins         i_vld_o_rdy_lower_o_vld_0101 = { 4'b0101 };
      bins         i_vld_o_rdy_lower_o_vld_0110 = { 4'b0110 };
      illegal_bins i_vld_o_rdy_lower_o_vld_0111 = { 4'b0111 };
      
      bins         i_vld_o_rdy_lower_o_vld_1000 = { 4'b1000 };
      bins         i_vld_o_rdy_lower_o_vld_1001 = { 4'b1001 };
      bins         i_vld_o_rdy_lower_o_vld_1010 = { 4'b1010 };
      illegal_bins i_vld_o_rdy_lower_o_vld_1011 = { 4'b1011 };
      
      bins         i_vld_o_rdy_lower_o_vld_1100 = { 4'b1100 };
      bins         i_vld_o_rdy_lower_o_vld_1101 = { 4'b1101 };
      bins         i_vld_o_rdy_lower_o_vld_1110 = { 4'b1110 };
      illegal_bins i_vld_o_rdy_lower_o_vld_1111 = { 4'b1111 };
    }
  endgroup
      
	cvr cg = new ();
      
	`endif
  
    logic [15:0] ccc;
      
 always @ (posedge aclk)
   ccc <= cg.o_rdy_transitions.get_coverage ();

      wire debug1 = { in_tvalid, out_tready, lower_bits, out_tvalid } == 4'b0010;
  
endmodule