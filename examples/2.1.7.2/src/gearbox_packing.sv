// Code your design here
`default_nettype none 

module gearbox_packing
# (
  parameter n = 5, nb = n * 8
)
(
  input  wire             aclk,
  input  wire             aresetn,

  input  wire [nb - 1:0]  in_tdata,
  input  wire [n-1:0]     in_tkeep,
  input  wire             in_tvalid,
  output reg              in_tready,

  output reg [nb - 1:0]   out_tdata,
  output reg              out_tvalid,
  input  reg              out_tready
);

logic             flag_hf;


always @(posedge aclk)
  if( ~aresetn )
    flag_hf <= #1 '0;
  else if( out_tvalid & out_tready )
    flag_hf <= #1 ~flag_hf;



// assign   out_tdata = (flag_hf) ?  in_tdata[0+:nb] : in_tdata[nb+:nb];

// assign in_tready = flag_hf & out_tready;

// assign out_tvalid = in_tvalid;

  
// assign out_tdata = in_tdata;

// assign in_tready = out_tready;

// assign out_tvalid = in_tvalid;

logic [7:0]       byte_cnt; // TODO: set correct range 

logic [nb-1:0]    n_out_tdata;
logic             n_out_tvalid;
logic             n_in_tready;
logic [7:0]       n_byte_cnt; // TODO: set correct range 

logic [nb*2-1:0]  n_buf_tdata;
logic [nb*2-1:0]  buf_tdata;

  
always_comb begin

    n_out_tdata   = out_tdata;
    n_out_tvalid  = out_tvalid;
    n_in_tready   = in_tready;
    n_byte_cnt    = byte_cnt;
    n_buf_tdata   = buf_tdata;

    if( in_tready && in_tvalid ) begin
      for( int ii=n-1; ii>=0; ii-- ) begin
          if( in_tkeep[ii] ) begin
            n_buf_tdata[(2*n-1-n_byte_cnt)*8+:8] = in_tdata[ii*8+:8];
            n_byte_cnt++;
          end
      end
    end

    if( n_out_tvalid && out_tready ) begin
      n_out_tvalid = '0;
      n_buf_tdata[nb*2-1:nb] = n_buf_tdata[nb-1:0];
      n_byte_cnt = n_byte_cnt - n;
    end

    if( n_byte_cnt>=n && ~n_out_tvalid ) begin
      n_out_tdata = n_buf_tdata[nb*2-1:nb];
      n_out_tvalid = '1;
    end

    if( n_byte_cnt>=n )      
       n_in_tready = '0;
    else
      n_in_tready = '1;



end

always_ff @(posedge aclk) begin

  if( ~aresetn ) begin

    out_tdata   <= #1 '0;
    out_tvalid  <= #1 '0;
    in_tready   <= #1 '0;
    byte_cnt    <= #1 '0;
    buf_tdata   <= #1 '0;

  end else begin

    out_tdata   <= #1 n_out_tdata;
    out_tvalid  <= #1 n_out_tvalid;
    in_tready   <= #1 n_in_tready;
    byte_cnt    <= #1 n_byte_cnt;
    buf_tdata   <= #1 n_buf_tdata;

  end

end

endmodule

`default_nettype wire