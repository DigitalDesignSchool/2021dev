`include "arbiter.sv"
`include "memory.sv"
`default_nettype none

/* 
 * Random Access Memory (RAM) with
 * N read ports and N write ports
 */
module multiport_memory
  #(
    parameter  READ_PORTS  = 3,
    parameter  WRITE_PORTS = 3,
    parameter  DATA_WIDTH = 32,
    parameter  ADDR_WIDTH = 4,
    localparam ADDR_MAX   = {ADDR_WIDTH{1'b1}}, 	// 2 ^ ADDR_WIDTH -1
    localparam DATA_LAT   = 2 //( >=1 ) delay in cycles between data request and data output 
)(
    input wire clk,
    input wire rst,

    // read ports
    input wire [READ_PORTS-1:0][ADDR_WIDTH-1:0]  r_addr,
    input wire [READ_PORTS-1:0]					 r_avalid,
    
    output wire [READ_PORTS-1:0]     			 r_dvalid,
    output wire [READ_PORTS-1:0][DATA_WIDTH-1:0] r_data,
    output wire [READ_PORTS-1:0]				 r_aready,
    
    // write ports
    input wire [WRITE_PORTS-1:0][ADDR_WIDTH-1:0]  w_addr,
    input wire [WRITE_PORTS-1:0][DATA_WIDTH-1:0]  w_data,
    input wire [WRITE_PORTS-1:0]  				 w_valid,
    
    output wire [WRITE_PORTS-1:0]			     w_ready
  );

  reg  [ADDR_WIDTH-1:0] mem_r_addr;
  reg       		    mem_r_avalid;
  wire			   	 	mem_r_dvalid;  // not used
  wire [DATA_WIDTH-1:0] mem_r_data;
  reg  [ADDR_WIDTH-1:0] mem_w_addr;
  reg  [DATA_WIDTH-1:0] mem_w_data;
  reg					mem_w_valid;
  
  // memory
  pseudo_dual_port_memory 
  #(
    .DATA_WIDTH(DATA_WIDTH), 
    .ADDR_WIDTH(ADDR_WIDTH), 
    .DATA_LAT(DATA_LAT-1)
  ) memory (
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
  wire [READ_PORTS-1:0] r_grant;
  arbiter #( .N(READ_PORTS) ) r_arbiter (
    .req(r_avalid & ~r_aready),
    .grant(r_grant),
	.*
  );

  // write arbiter
  wire [WRITE_PORTS-1:0] w_grant;
  arbiter #( .N(WRITE_PORTS) ) w_arbiter (
    .req(w_valid & ~w_ready),
    .grant(w_grant),
	.*
  );
  
  // Read data from memory with latency
  reg [READ_PORTS-1:0] r_dvalid_shift [DATA_LAT-1:0];
  reg [READ_PORTS-1:0] sync_r_aready;
  reg [WRITE_PORTS-1:0] sync_w_ready;

  always @(posedge clk) begin
    mem_r_avalid <= #1 0;
    mem_w_valid  <= #1 0;

    if (rst)
      r_dvalid_shift <= #1 '{DATA_LAT{0}};
    else begin
      sync_r_aready <= #1 r_grant;
      sync_w_ready  <= #1 w_grant;

      r_dvalid_shift[0] <= #1 r_grant;
      
      // Put
      for (int r = 0; r < WRITE_PORTS; r++)
        if(w_grant[r]) begin
          mem_w_addr  <= #1 w_addr[r];
          mem_w_data  <= #1 w_data[r];
          mem_w_valid <= #1 1;
        end
      for (int r = 0; r < READ_PORTS; r++)
        if(r_grant[r]) begin
          mem_r_addr   <= #1 r_addr[r];
          mem_r_avalid <= #1 1;
        end

      // Shift
      for (int i = 1; i < DATA_LAT; i++)
        r_dvalid_shift[i] <= #1 r_dvalid_shift[i - 1];
    end
  end
  
  assign r_aready = sync_r_aready;
  assign w_ready  = sync_w_ready;
  assign r_dvalid = r_dvalid_shift[DATA_LAT-1];
  
  // connect all requesters to the data wire
  genvar i; generate
    for (i=0; i<READ_PORTS; i=i+1)
      assign r_data[i] = r_dvalid[i]? mem_r_data : 0;
  endgenerate

endmodule

`default_nettype wire
