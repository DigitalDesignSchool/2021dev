
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

  //always @(posedge aclk)
  reg [8*N*2   - 1:0] temp_tdata;   
  
//assign   out_tdata = in_tdata[8*N -1] && in_tkeep [7]

  assign in_tready = 1;

  //assign out_tvalid = (cnt_en_bytes >= (N - 1));


  always @ (posedge aclk)// or negedge aresetn)
    if (!aresetn)
      begin
        temp_tdata [8*N   - 1:0] <=  #1 0;
  	  	cnt_en_bytes 			 <=	 #1 0;
      //cnt_dis_bytes <= #1 0;  
      end
  
  integer i;

  
//always @(posedge aclk iff in_tvalid)
always @(*)
begin    
  if (in_tvalid && in_tready)
 begin  
  //temp_tdata [8*N : 0] <= in_tdata[8*N : 0];// && in_tkeep [N     - 1:0];
 //generate
   for (i=N-1; i >= 0; i= i - 1)//for (i=0; i < N; i= i + 1)
   //for (i=0 + end_bytes; i < N; i= i + 1)
    begin
      if (in_tkeep [i]) 
        begin 
          //temp_tdata [8*(i - cnt_dis_bytes) +: 8] = in_tdata[8*i +: 8];
           
          //temp_tdata = {temp_tdata [8*(i) +: 0], in_tdata[8*i +: 8]};	 
          //temp_tdata [8*(i + cnt_dis_bytes)  +: 8] = in_tdata[8*i +: 8];
     	  
          temp_tdata [8*(N-1 - cnt_en_bytes)  +: 8] = in_tdata[8*i +: 8];
          cnt_en_bytes++;
        end
/*      else
        begin
        	cnt_dis_bytes++;
        end
      
      if (i >= N)
   	begin	
      cnt_dis_bytes = 0;
      end_bytes = cnt_en_bytes;
    end */ 
    end
    

 //endgenerate
  
   
 end  
end 
  
  //always @(posedge aclk)
  always @(*)
    begin
      if (cnt_en_bytes >= N)
        begin
          temp_tdata [8*N*2 - 1: N*8] =  temp_tdata [8*N   - 1:0];
          out_tdata [8*N  - 1:0] = temp_tdata [8*N*2   - 1 : N*8];
          temp_tdata [8*N   - 1:0] = 0;
          out_tvalid =  1; 
    	  cnt_en_bytes =  0;
    		//cnt_dis_bytes <= #1 0;
          	//end_bytes <= #1 0;
          
    	 end 
      //else 
        //out_tvalid = 0;
    
    end 
  
  always @(posedge aclk)
    begin
      if (cnt_en_bytes < N) out_tvalid <= #1 0;
        
    end
  
endmodule
    