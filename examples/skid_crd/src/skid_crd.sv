// Code your design here
`default_nettype none 

module skid_crd
# (
  parameter n = 5, nb = n * 8
)
(
  input  wire             aclk,
  input  wire             aresetn,

  input  wire [nb - 1:0]  in_tdata,
  input  wire             in_tvalid,
  output reg              in_tready,

  output reg [nb - 1:0]   out_tdata,
  output reg              out_tvalid,
  input  reg              out_tready
);


logic [1:0]         state; // 10 - empty, 11 - half, 01 - full
logic [nb-1:0]      buf_tdata;

logic [nb-1:0]      reg_tdata;

logic               is_write;
logic               is_read;

logic               is_write_z;
logic  [1:0]        crd_cnt;

assign  is_write    = in_tvalid & in_tready;
assign  is_read     = out_tvalid & out_tready;

assign in_tready    = crd_cnt[1];
assign out_tvalid   = state[0];

always_ff @(posedge aclk) begin

    if( ~aresetn )
        crd_cnt <= #1 2'b11;
    else 
            case( {is_write, is_read })
                2'b01: begin  // read
                        crd_cnt <= #1 crd_cnt + 1;
                end

                2'b10: begin   // write
                        crd_cnt <= #1 crd_cnt - 1;
                end

                2'b11: begin   // write & read
                        // crd_cnd don't change
                end
            endcase
end

always_ff @(posedge aclk) begin

    is_write_z <= #1 in_tvalid & in_tready;

    reg_tdata <= #1 in_tdata;

    if( is_write_z )
        buf_tdata <= #1 reg_tdata;

    case( state )
        2'b10: begin // empty: in_tready=1, out_tvalid=0
            out_tdata <= #1 reg_tdata;
            if( is_write_z ) begin
                state <= #1 2'b11;
            end
        end

        2'b11: begin // half: in_tready=1, out_tvalid=1
            case( {is_write_z, is_read })
                2'b01: begin  // read
                        state <= #1 2'b10;
                end

                2'b10: begin   // write
                        state <= #1 2'b01;
                end

                2'b11: begin   // write & read
                    out_tdata <= #1 reg_tdata;
                end
            endcase

        end

        2'b01: begin    // full: in_tready=0, out_tvalid=1
               if( is_read ) begin
                   state <= #1 2'b11;
                   out_tdata <= #1 buf_tdata;
               end 
        end

    endcase

    if( ~aresetn ) begin
        state <= 2'b10;
    end 
end
  
endmodule

`default_nettype wire