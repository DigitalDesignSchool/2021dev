`include "defines.svh"

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

  // Functional coverage

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

    i_vld_rdy: cross in_tvalid,  in_tready;
    o_vld_rdy: cross out_tvalid, out_tready;

    // There is a coverage hole here. Can you find?
    
    i_vld_rdy_lower_upper: cross i_vld_rdy, lower_bits;

    o_vld_rdy_lower_upper: cross out_tvalid, out_tready, lower_bits
    {
      illegal_bins illegal
        =    binsof (lower_bits) intersect { 1 }
          && binsof (out_tvalid) intersect { 1 };
    }
    
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

    // Data
    
    in_tdata_auto: coverpoint in_tdata;

    in_tdata_fancy: coverpoint in_tdata
      iff (in_tvalid & in_tready)
    {
      bins          ABCDE                       = {   40'h4142434445 };
      bins          ABCDE_or_PQRST              = {   40'h4142434445 , 40'h5051525354   };
      bins          from_ABCDE_till_PQRST       = { [ 40'h4142434445 : 40'h5051525354 ] };
      bins          from_ABCDE_till_PQRST_3 [3] = { [ 40'h4142434445 : 40'h5051525354 ] };

      bins          mixed                       = { [ 40'h4142434445 : 40'h5051525354 ],
                                                      40'h5a61626364 };
      
      illegal_bins  AABCD                       = {   40'h4141424344 };
      ignore_bins   FGHIJ                       = {   40'h464748494a };
      bins          others                      = default;
    }

    out_tdata_wild: coverpoint out_tdata
      iff (out_tvalid & out_tready)
    {
      wildcard bins all_4X          = { 80'h4?4?4?4?4?_4?4?4?4?4? };
      wildcard bins five_4X_five_5X = { 80'h4?4?4?4?4?_5?5?5?5?5? };
      wildcard bins four_4X_six_5X  = { 80'h4?4?4?4?5?_5?5?5?5?5? };
      wildcard bins end_with_4      = { 80'h??????????_?????????4 };
      wildcard bins end_with_hexA   = { 80'h??????????_?????????A };
    }

    i_vld_lower_o_vld_o_rdy: coverpoint
      { in_tvalid, lower_bits, out_tvalid, out_tready }
    {
      bins         i_vld_lower_o_vld_o_rdy_0000 = { 4'b0000 };
      illegal_bins i_vld_lower_o_vld_o_rdy_0110 = { 4'b0110 };
      
      // TODO
      
  // 16 cases:
  //
  // in_valid=0 out_ready=0 lower_bits=0 out_valid=0 -> out_valid=0
  // in_valid=0 out_ready=0 lower_bits=0 out_valid=1 -> out_valid=1
  // in_valid=0 out_ready=0 lower_bits=1 out_valid=0 -> out_valid=0
  // in_valid=0 out_ready=0 lower_bits=1 out_valid=1 -> impossible
  //
  // in_valid=0 out_ready=1 lower_bits=0 out_valid=0 -> out_valid=0
  // in_valid=0 out_ready=1 lower_bits=0 out_valid=1 -> out_valid=0 remove valid
  // in_valid=0 out_ready=1 lower_bits=1 out_valid=0 -> out_valid=0
  // in_valid=0 out_ready=1 lower_bits=1 out_valid=1 -> impossible
  //
  // in_valid=1 out_ready=0 lower_bits=0 out_valid=0 -> out_valid=0 
  // in_valid=1 out_ready=0 lower_bits=0 out_valid=1 -> out_valid=1
  // in_valid=1 out_ready=0 lower_bits=1 out_valid=0 -> out_valid=1 fill right
  // in_valid=1 out_ready=0 lower_bits=1 out_valid=1 -> impossible
  //
  // in_valid=1 out_ready=1 lower_bits=0 out_valid=0 -> out_valid=0
  // in_valid=1 out_ready=1 lower_bits=0 out_valid=1 -> out_valid=0 fill left, remove valid
  // in_valid=1 out_ready=1 lower_bits=1 out_valid=0 -> out_valid=1 fill right
  // in_valid=1 out_ready=1 lower_bits=1 out_valid=1 -> impossible
    }
    
    i_vld_lower_o_vld_o_rdy_transitions: coverpoint
      { in_tvalid, lower_bits, out_tvalid, out_tready }
    {
      bins i_vld_lower_o_vld_o_rdy = (4'b0000 => 4'b0000);

      // illegal_bins others = default; 
      
      // TODO
      
  // 16 cases:
  //
  // in_valid=0 out_ready=0 lower_bits=0 out_valid=0 -> out_valid=0
  // in_valid=0 out_ready=0 lower_bits=0 out_valid=1 -> out_valid=1
  // in_valid=0 out_ready=0 lower_bits=1 out_valid=0 -> out_valid=0
  // in_valid=0 out_ready=0 lower_bits=1 out_valid=1 -> impossible
  //
  // in_valid=0 out_ready=1 lower_bits=0 out_valid=0 -> out_valid=0
  // in_valid=0 out_ready=1 lower_bits=0 out_valid=1 -> out_valid=0 remove valid
  // in_valid=0 out_ready=1 lower_bits=1 out_valid=0 -> out_valid=0
  // in_valid=0 out_ready=1 lower_bits=1 out_valid=1 -> impossible
  //
  // in_valid=1 out_ready=0 lower_bits=0 out_valid=0 -> out_valid=0 
  // in_valid=1 out_ready=0 lower_bits=0 out_valid=1 -> out_valid=1
  // in_valid=1 out_ready=0 lower_bits=1 out_valid=0 -> out_valid=1 fill right
  // in_valid=1 out_ready=0 lower_bits=1 out_valid=1 -> impossible
  //
  // in_valid=1 out_ready=1 lower_bits=0 out_valid=0 -> out_valid=0
  // in_valid=1 out_ready=1 lower_bits=0 out_valid=1 -> out_valid=0 fill left, remove valid
  // in_valid=1 out_ready=1 lower_bits=1 out_valid=0 -> out_valid=1 fill right
  // in_valid=1 out_ready=1 lower_bits=1 out_valid=1 -> impossible
    }
    
  endgroup
      
  cvr cg = new ();
      
  `endif

endmodule
