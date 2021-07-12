`default_nettype none
/*
 * Round-robin arbiter {from Intel Cookbook} 
 * The round-robin pointer is updated by moving the pointer 
 * to the requester after the one which just received the grant (III type).
 */
module arbiter
  #(
    parameter N = 5 // Number of requesters
  )(
    input		    rst,
    input 			clk,
    input  [N-1:0] 	req,
    output [N-1:0]	grant
  );

  reg  [N-1:0] pointer_req;
  reg  [N-1:0] next_grant;

  wire [2*N-1:0] double_req = {req,req};
  wire [2*N-1:0] double_grant = double_req & ~(double_req - pointer_req);
  wire [N-1:0]	 async_next_grand =  double_grant[N-1:0] | double_grant[2*N-1:N];

  assign grant = next_grant;

  //Update the rotate pointer 
  wire [N-1:0]   new_req = req ^ async_next_grand;
  wire [2*N-1:0] new_double_req = {new_req,new_req};
  wire [2*N-1:0] new_double_grant  = new_double_req & ~(new_double_req - pointer_req);
  wire [N-1:0]	 async_pointer_req =  new_double_grant[N-1:0] | new_double_grant[2*N-1:N];
  
  always @ (posedge clk)
    if (rst)
      pointer_req <= #1 1;
  	else if (async_pointer_req == 0)
      pointer_req <= #1 1;
    else	 
      pointer_req <= #1 async_pointer_req;

  //Synchronous grant update
  always @ (posedge clk)
    if (rst) 
      next_grant[N-1:0] <= #1 {N{1'b0}}; 
    else 
      next_grant <= #1 async_next_grand;

endmodule
