`include "arbiter.sv"
`include "memory.sv"
`default_nettype none

/* 
 * Random Access Memory (RAM) with
 * N read ports and N write ports
 */
module multimemory
  #(
    parameter  REQUESTERS = 3,
    parameter  DATA_WIDTH = 32,
    parameter  ADDR_WIDTH = 4,
    localparam ADDR_MAX   = {ADDR_WIDTH{1'b1}}, 	// 2 ^ ADDR_WIDTH -1
    localparam DATA_LAT   = 2 //( >1 ) delay in cycles between data request and data output 
)(
    input clk,
    input rst,

    // read ports
    input  [REQUESTERS-1:0][ADDR_WIDTH-1:0] r_addr,
    input  [REQUESTERS-1:0]				r_avalid,
    
    output [REQUESTERS-1:0]     		r_dvalid,
    output [REQUESTERS-1:0][DATA_WIDTH-1:0] r_data,
    output [REQUESTERS-1:0]				r_aready,
    
    // write ports
    input  [REQUESTERS-1:0][ADDR_WIDTH-1:0] w_addr,
    input  [REQUESTERS-1:0][DATA_WIDTH-1:0] w_data,
    input  [REQUESTERS-1:0]  			w_valid,
    
    output [REQUESTERS-1:0]				w_ready
  );

  reg  [ADDR_WIDTH-1:0] mem_r_addr;
  reg       	    mem_r_avalid;
  wire			    mem_r_dvalid;  // not used
  wire [DATA_WIDTH-1:0] mem_r_data;
  reg  [ADDR_WIDTH-1:0] mem_w_addr;
  reg  [DATA_WIDTH-1:0] mem_w_data;
  reg				mem_w_valid;
  
  // memory
  pseudo_dual_port_memory #(DATA_WIDTH, ADDR_WIDTH, DATA_LAT-1) memory (
    .r_addr(mem_r_addr),
    .r_avalid(mem_r_avalid),
    .r_dvalid(mem_r_dvalid),  // not used
    .r_data(mem_r_data),
    .w_addr(mem_w_addr),
    .w_data(mem_w_data),
    .w_valid(mem_w_valid),
    .*
  );  
  
  // read arbiter
  wire [REQUESTERS-1:0] r_grant;
  arbiter #(REQUESTERS) r_arbiter (
    .req(r_avalid),
    .grant(r_grant),
	.*
  );

  // write arbiter
  wire [REQUESTERS-1:0] w_grant;
  arbiter #(REQUESTERS) w_arbiter (
    .req(w_valid),
    .grant(w_grant),
	.*
  );
  
  // Read data from memory with latency
  reg [REQUESTERS-1:0] r_dvalid_shift [DATA_LAT];
  reg [REQUESTERS-1:0] sync_r_aready;
  reg [REQUESTERS-1:0] sync_w_ready;

  always @(posedge clk) begin

    mem_r_addr  <= #1 '0;
    mem_r_avalid <= #1 '0;
    // mem_w_addr  <= #1 '0;
    // mem_w_data  <= #1 '0;
    // mem_w_valid <= #1 '0;

    if (rst) begin
      mem_r_addr  <= #1 '0;
      mem_r_avalid <= #1 '0;
      // mem_w_addr  <= #1 '0;
      // mem_w_data  <= #1 '0;
      // mem_w_valid <= #1 '0;

    end else begin

      // Put
      for (int r = 0; r < REQUESTERS; r++) begin

        if(r_aready[r]=='1 && r_avalid[r]=='1 ) begin
          mem_r_addr  <= #1 r_addr[r];
          mem_r_avalid <= #1 '1;
          r_dvalid_shift[0][r] <= #1 '1;
        end else begin
          r_dvalid_shift[0][r] <= #1 '0;
        end

        // if(w_ready[r]=='1 && w_valid[r]=='1 )  begin
        //   mem_w_addr  <= #1 w_addr[r];
        //   mem_w_data  <= #1 w_data[r];
        //   mem_w_valid <= #1 '1;
        // end 
      end

      // Shift
      if (rst) begin
        r_dvalid_shift <= #1 '{DATA_LAT{0}};
      end else begin
        for (int i = 1; i < DATA_LAT; i++)
          r_dvalid_shift[i] <= #1 r_dvalid_shift[i - 1];
      end
    end
  end
  
  assign r_aready = r_grant;
  assign w_ready  = w_grant;
  assign r_dvalid = r_dvalid_shift[DATA_LAT-1];
  
  always_comb begin

    mem_w_addr  <= '0;
    mem_w_data  <= '0;
    mem_w_valid <= '0;

    for( int ii=0; ii<REQUESTERS; ii++ ) begin
      if( 1==w_grant[ii] ) begin
          mem_w_addr  <= w_addr[ii];
          mem_w_data  <= w_data[ii];
          mem_w_valid <= w_valid[ii];
      end
    end

  end
  // connect all requesters to the data wire
  genvar i; generate
    for (i=0; i<REQUESTERS; i=i+1)
      assign r_data[i] = mem_r_data;
  endgenerate

endmodule
