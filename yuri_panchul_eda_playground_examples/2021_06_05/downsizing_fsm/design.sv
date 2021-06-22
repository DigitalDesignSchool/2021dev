`include "defines.svh"

module downsizing
  #(
    parameter W = 32
  )
  (
    input aclk,
    input aresetn,

    input        [W * 2 - 1:0]  in_tdata,
    input                       in_tvalid,
    output logic                in_tready,
  
    output logic [W      - 1:0] out_tdata,
    output                      out_tvalid,
    input                       out_tready
  );

  typedef enum logic [1:0]
  {
    ST_NOT_VALID_LAST = 2'b01,
    ST_VALID_NOT_LAST = 2'b10,
    ST_VALID_LAST     = 2'b11
  }
  state_t;
  
  state_t state, new_state;
  
  assign out_tvalid = state [1];

  logic [W - 1:0] new_out_tdata;
  
  always @*
  begin
    in_tready     = '0;
    
    new_state     = state;
    new_out_tdata = out_tdata;
      
    case (state)
    ST_NOT_VALID_LAST:

      if (in_tvalid)
      begin
        new_state     = ST_VALID_NOT_LAST;
        new_out_tdata = in_tdata [W * 2 - 1 : W];
      end
            
    ST_VALID_NOT_LAST:

      if (out_tready)
      begin
        in_tready     = '1;
        new_state     = ST_VALID_LAST;
        new_out_tdata = in_tdata [W - 1 : 0];
      end
      
    ST_VALID_LAST:

      if (out_tready)
      begin
        if (in_tvalid)
        begin
          new_state     = ST_VALID_NOT_LAST;
          new_out_tdata = in_tdata [W * 2 - 1 : W];
        end
        else
        begin
          new_state     = ST_NOT_VALID_LAST;
        end
      end
    endcase
  end
        
  always @(posedge aclk or negedge aresetn)
    if (~ aresetn)
      state <= ST_NOT_VALID_LAST;
    else
      state <= new_state;

  always @(posedge aclk)
    out_tdata <= new_out_tdata;

endmodule
