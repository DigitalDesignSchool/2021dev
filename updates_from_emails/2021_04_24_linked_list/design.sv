`define LONG_PATH_NO_GAP

parameter n     = 256,
          w_ptr = $clog2 (n);

typedef logic [w_ptr - 1:0] ptr_t;

module start_req_gen
(
  input        clk,
  input        rst,

  output ptr_t start,
  output       start_vld,
  input        start_rdy
);

  logic [3:0] n_req;

  always_ff @ (posedge clk or posedge rst)
    if (rst)
      n_req <= '0;
    else if (start_rdy)
      n_req <= n_req + 4'd1;

  /*
  assign start_vld = 1'b1;
  assign start     = ptr_t' (9);
  */

  assign start_vld = n_req != 4'd8;

  always_comb
    case (n_req)
    4'd0:    start = ptr_t' (7);
    4'd1:    start = ptr_t' (6);
    4'd2:    start = ptr_t' (2);
    4'd3:    start = ptr_t' (1);
    4'd4:    start = ptr_t' (0);
    default: start = ptr_t' (9);
    endcase

endmodule

module ptr_seq_gen
(
  input        clk,
  input        rst,

  input  ptr_t start,
  input        start_vld,
  output       start_rdy,

  output ptr_t out_ptr,
  output logic out_ptr_vld
);

  wire ptr_t [n - 1:0] next =
  '{
     1:  5,  5:  3,  3: 10, 10: 0,
     2:  4,  4:  0,
     6:  0,
     7: 15, 15:  8,  8:  0,
     9: 14, 14: 11, 11: 13, 13: 12, 12: 0,
    default: 0
  };

  /*

  Verilog-2001 / 2005

  wire [w_ptr - 1:0] next [0:n - 1];
  
  assign next [1] = w_ptr' (5);
  assign next [5] = w_ptr' (3);

  */
  
  ptr_t cur;
  logic cur_vld;

  always_comb
  begin
    cur = '0;
    
    `ifdef LONG_PATH_NO_GAP
    // Long path, no gap - check with Qflow
    
    if (out_ptr_vld)
      cur = next [out_ptr];

    if (cur == '0 & start_vld)
      cur = start;

    `else
    // short path, gap - check with Qflow
    
    if (out_ptr_vld)
      cur = next [out_ptr];
    else if (start_vld)
      cur = start;

    `endif
    
    cur_vld = (cur != '0);
  end

  always_ff @ (posedge clk or posedge rst)
    if (rst)
      out_ptr_vld <= '0;
    else
      out_ptr_vld <= cur_vld;

  always_ff @ (posedge clk)
    out_ptr <= cur;

  `ifdef LONG_PATH_NO_GAP
  assign start_rdy = cur == '0 | next [cur] == '0;
  `else
  assign start_rdy = ~ cur_vld;
  `endif
  
endmodule

module req_gen(
  input        clk,
  input        rst,
  output ptr_t out_ptr,
  output       out_ptr_vld
);
  
  ptr_t start;
  wire start_vld, start_rdy;

  start_req_gen i_start_req_gen (.*);
  ptr_seq_gen   i_ptr_seq_gen   (.*);

endmodule
