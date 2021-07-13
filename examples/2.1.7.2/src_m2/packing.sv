
`include "defines.sv"


// Code your design here
module packing
  #(
    parameter N = 10
  )
  (
    input wire aclk,
    input wire aresetn,

    input  wire    [8*N   - 1:0] in_tdata,
    input  wire    [N     - 1:0] in_tkeep,
    input  wire              in_tvalid,
    output reg               in_tready,
  
    output reg [8*N   - 1:0] out_tdata,
    output reg               out_tvalid,
    input  wire              out_tready
  );
 
  integer cnt_en_bytes = 0;
  integer cnt_dis_bytes = 0;
  integer end_bytes = 0;
  
/*****************************************
Input:

Такт  in_tdata    in_tkeep
1     ABCDEFGHIJ  0001101011
2     KLMONPQRST  1001001111
3     UVWXYabcde  1011110000
4     fghijklmno  1010101000
...

Output:

Такт  out_tdata
1     DEGIJKOQRS
2     TUWXYZfhjl
******************************************/

  reg [8*N*2   - 1:0] temp_tdata;   
  
  logic [8*N   - 1:0] n_out_tdata;
  logic               n_out_tvalid;
  logic               n_in_tready;
  integer 			  n_cnt_en_bytes;
  logic [8*N*2   - 1:0] n_temp_tdata;
  
 


always @(*)
begin    
  
  n_out_tdata    = out_tdata;
  n_out_tvalid   = out_tvalid;
  n_in_tready    = in_tready;
  n_cnt_en_bytes = cnt_en_bytes;
  n_temp_tdata   = temp_tdata;
  
  
 if (in_tvalid && in_tready)
 begin  

   for (integer i=N-1; i >= 0; i= i - 1)
    begin
      if (in_tkeep [i]) 
        begin 
          n_temp_tdata [8*(2*N-1 - n_cnt_en_bytes)  +: 8] = in_tdata[8*i +: 8];
          n_cnt_en_bytes++;
        end
    end
 end  

  
 
  
  if( n_out_tvalid && out_tready )
       begin
      	
         n_temp_tdata [8*N*2 - 1: N*8] =  n_temp_tdata [8*N   - 1:0];
         n_cnt_en_bytes =  n_cnt_en_bytes - N;
         n_out_tvalid = 0;
    	end
      		  
  if ( (n_cnt_en_bytes >= N) && ~n_out_tvalid)
     	begin
        
          n_out_tdata [8*N  - 1:0] = n_temp_tdata [8*N*2   - 1 : N*8];
         
          n_out_tvalid =  1; 
       	end
  
  if (n_cnt_en_bytes > N)
          n_in_tready = 0;
  		else 
          n_in_tready = 1;
end 
  
    always @ (posedge aclk)
    if (!aresetn)
      begin
        temp_tdata [8*N*2   - 1:0] <=  #1 0;
        out_tdata  [8*N  - 1:0]    <=  #1 0; 
  	  	cnt_en_bytes 			   <=  #1 0;
        in_tready				   <=  #1 0;
        out_tvalid 				   <=  #1 0;
      end
  	else 
      begin
        temp_tdata [8*N*2   - 1:0] <=  #1 n_temp_tdata [8*N*2   - 1:0];
        out_tdata  [8*N  - 1:0]    <=  #1 n_out_tdata  [8*N  - 1:0]; 
  	  	cnt_en_bytes 			   <=  #1 n_cnt_en_bytes;
        in_tready				   <=  #1 n_in_tready;
        out_tvalid 				   <=  #1 n_out_tvalid; 
        
      end  

endmodule
    