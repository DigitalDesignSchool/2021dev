// Code your testbench here
// or browse Examples

`default_nettype none

`include "transaction_pkg.sv"

import transaction_pkg::*;

module tb
  ();
  
  
  string	test_name[1:0]=
  {
   "randomize", 
   "direct" 
  };
  
task test_finish;
  		input int 	test_id;
  		input string	test_name;
  		input int		result;
begin
  automatic int fd = $fopen( "global.txt", "a" );
  
  if( 1==result ) begin
    $fdisplay( fd, "test_id=%-5d test_name: %15s         TEST_PASSED", test_id, test_name );
    $display( "test_id=%-5d test_name: %15s         TEST_PASSED", test_id, test_name );
  end else begin
    $fdisplay( fd, "test_id=%-5d test_name: %15s         TEST_FAILED *******", test_id, test_name );
    $display( "test_id=%-5d test_name: %15s         TEST_FAILED *******", test_id, test_name );
  end
  
  $stop();
end endtask  
  
localparam  n = 10, nb = n * 8;
localparam  maxkeep = 2**n;

logic               clk=0;
logic               rst;

  
int                 cnt_wr=0;
int                 cnt_rd=0;
int                 cnt_ok=0;  
int                 cnt_error=0;

int                 test_id=0;
logic               test_start=0;
logic               test_timeout=0;
logic               test_done=0;
int                 out_ready_cnt=0;

// Queue
// type_transaction_rd q0_transaction_drive_rd  [$];
// type_transaction_rd q1_transaction_drive_rd  [$];
// type_transaction_rd q2_transaction_drive_rd  [$];

// type_transaction_rd current_drive_rd_0;
// type_transaction_rd current_drive_rd_1;
// type_transaction_rd current_drive_rd_2;


// type_transaction_rd q0_transaction_check_rd  [$];
// type_transaction_rd q1_transaction_check_rd  [$];
// type_transaction_rd q2_transaction_check_rd  [$];

type_transaction_rd qa_transaction_drive_rd[REQUESTERS-1:0]  [$];
type_transaction_rd qa_transaction_check_rd[REQUESTERS-1:0]  [$];
type_transaction_rd current_drive_rd[REQUESTERS-1:0];

type_uut  u[REQUESTERS-1:0];

// localparam  REQUESTERS = 3;
// localparam  DATA_WIDTH = 16;
// localparam  ADDR_WIDTH = 16;


// logic [ADDR_WIDTH-1:0]  r0_addr;
// logic 				          r0_avalid;
// logic      		          r0_dvalid;
// logic [DATA_WIDTH-1:0]  r0_data;
// logic                   r0_aready;

// logic [ADDR_WIDTH-1:0]  r1_addr;
// logic 				          r1_avalid;
// logic      		          r1_dvalid;
// logic [DATA_WIDTH-1:0]  r1_data;
// logic                   r1_aready;

// logic [ADDR_WIDTH-1:0]  r2_addr;
// logic 				          r2_avalid;
// logic      		          r2_dvalid;
// logic [DATA_WIDTH-1:0]  r2_data;
// logic                   r2_aready;






//logic [REQUESTERS-1:0][ADDR_WIDTH-1:0]  r_addr;
//logic [REQUESTERS-1:0]				          r_avalid;
// logic [REQUESTERS-1:0]     		          r_dvalid;
// logic [REQUESTERS-1:0][DATA_WIDTH-1:0]  r_data;
// logic [REQUESTERS-1:0]				          r_aready;
// logic [REQUESTERS-1:0][ADDR_WIDTH-1:0]  w_addr;
// logic [REQUESTERS-1:0][DATA_WIDTH-1:0]  w_data;
// logic [REQUESTERS-1:0]  			          w_valid;
// logic [REQUESTERS-1:0]				          w_ready;

multimemory
#(
    .REQUESTERS     (   REQUESTERS  ),
    .DATA_WIDTH     (   DATA_WIDTH  ),
    .ADDR_WIDTH     (   ADDR_WIDTH  )
) uut
(
    .r_addr         (   {u[2].r_addr,   u[1].r_addr,    u[0].r_addr   } ),
    .r_avalid       (   {u[2].r_avalid, u[1].r_avalid,  u[0].r_avalid } ),
    .r_dvalid       (   {u[2].r_dvalid, u[1].r_dvalid,  u[0].r_dvalid } ),
    .r_data         (   {u[2].r_data,   u[1].r_data,    u[0].r_data   } ),
    .r_aready       (   {u[2].r_aready, u[1].r_aready,  u[0].r_aready } ),

    .w_addr         (   {u[2].w_addr,   u[1].w_addr,    u[0].w_addr   } ),
    .w_data         (   {u[2].w_data,   u[1].w_data,    u[0].w_data   } ),
    .w_valid        (   {u[2].w_valid,  u[1].w_valid,   u[0].w_valid } ),
    .w_ready        (   {u[2].w_ready,  u[1].w_ready,   u[0].w_ready } ),

                    .*

                    
);


// Fill memory 
initial begin
  for( int ii=0; ii<(2**ADDR_WIDTH-1); ii++ )
  begin
    uut.memory.memory[ii] = ii;
  end
end 

initial begin
  $dumpfile("dump.vcd");
  $dumpvars(1);
end
always #5 clk = ~clk;

// // Driver
// always @(posedge clk) begin

// end


// // Monitor
// always @(posedge clk) begin

// end

genvar ii;
generate
  for( ii=0; ii<REQUESTERS; ii++ ) begin

    initial begin

      //r_avalid[0]  <= #1 '0;
      u[ii].r_avalid  <= #1 '0;

      while(1) begin
          @(posedge clk iff(qa_transaction_drive_rd[ii].size()>0));

          current_drive_rd[ii] = qa_transaction_drive_rd[ii].pop_front();
          u[ii].r_addr   <= #1 current_drive_rd[ii].addr;
          u[ii].r_avalid <= #1 '1;

          // r_addr[0]  <= #1 current_drive_rd_0.addr;
          // r_avalid[0]  <= #1 '1;

          @(posedge clk iff u[ii].r_aready & u[ii].r_avalid);

          if( current_drive_rd[ii].delay>0 ) begin
            //r_avalid[0]  <= #1 '0;
            u[ii].r_avalid  <= #1 '0;
          end else begin
            repeat(current_drive_rd[ii].delay) @(posedge clk);
          end
          //current_drive_rd_0 = null;
      end

    end

  end
endgenerate


// initial begin

//   //r_avalid[0]  <= #1 '0;
//   r0_avalid  <= #1 '0;

//   while(1) begin
//       @(posedge clk iff(q0_transaction_drive_rd.size()>0));

//       current_drive_rd_0 = q0_transaction_drive_rd.pop_front();
//       r0_addr   <= #1 current_drive_rd_0.addr;
//       r0_avalid <= #1 '1;

//       // r_addr[0]  <= #1 current_drive_rd_0.addr;
//       // r_avalid[0]  <= #1 '1;

//       @(posedge clk iff r0_aready & r0_avalid);

//       if( current_drive_rd_0.delay>0 ) begin
//         //r_avalid[0]  <= #1 '0;
//         r0_avalid  <= #1 '0;
//       end else begin
//         repeat(current_drive_rd_0.delay) @(posedge clk);
//       end
//       //current_drive_rd_0 = null;
//   end

// end

// initial begin

//   //r_avalid[1]  <= #1 '1;
//   r1_avalid  <= #1 '0;

//   while(1) begin
//       @(posedge clk iff(q1_transaction_drive_rd.size()>0));

//       current_drive_rd_1 = q1_transaction_drive_rd.pop_front();
//       r1_addr   <= #1 current_drive_rd_1.addr;
//       r1_avalid <= #1 '1;
//       // r_addr[1]  <= #1 current_drive_rd_1.addr;
//       // r_avalid[1]  <= #1 '1;

//       @(posedge clk iff r1_aready & r1_avalid);

//       if( current_drive_rd_1.delay>0 ) begin
//         //r_avalid[1]  <= #1 '1;
//         r1_avalid  <= #1 '0;
//       end else begin
//         repeat(current_drive_rd_1.delay) @(posedge clk);
//       end
//       //current_drive_rd_1 = null;
//   end

// end

// initial begin

//   //r_avalid[2]  <= #1 '0;
//   r2_avalid  <= #1 '0;

//   while(1) begin
//       @(posedge clk iff(q2_transaction_drive_rd.size()>0));

//       current_drive_rd_2 = q2_transaction_drive_rd.pop_front();
//       r2_addr   <= #1 current_drive_rd_2.addr;
//       r2_avalid <= #1 '1;
//       // r_addr[2]  <= #1 current_drive_rd_2.addr;
//       // r_avalid[2]  <= #1 '1;

//       @(posedge clk iff r2_aready & r2_avalid);

//       if( current_drive_rd_2.delay>0 ) begin
//         //r_avalid[2]  <= #1 '0;
//         r2_avalid  <= #1 '0;
//       end else begin
//         repeat(current_drive_rd_2.delay) @(posedge clk);
//       end
//       //current_drive_rd_2 = null;
//   end

// end


task read_data;
  input int     qn;
  input int     addr;
  input int     delay;
begin

  //type_transaction_rd tr_rd  = new( addr, delay );
  automatic type_transaction_rd tr_rd;
    tr_rd.addr = addr;
    tr_rd.delay =delay;

  case( qn )
    0: begin 
        //q0_transaction_drive_rd.push_back(tr_rd);
        //q0_transaction_check_rd.push_back(tr_rd);
        qa_transaction_drive_rd[0].push_back(tr_rd);
        qa_transaction_check_rd[0].push_back(tr_rd);
    end
    1: begin
        //q1_transaction_drive_rd.push_back(tr_rd);
        //q1_transaction_check_rd.push_back(tr_rd);
        qa_transaction_drive_rd[1].push_back(tr_rd);
        qa_transaction_check_rd[1].push_back(tr_rd);
    end
    2: begin  
        //q2_transaction_drive_rd.push_back(tr_rd);
        //q2_transaction_check_rd.push_back(tr_rd);
        qa_transaction_drive_rd[2].push_back(tr_rd);
        qa_transaction_check_rd[2].push_back(tr_rd);
    end
  endcase;

end endtask;

task write_data;
  input int     qn;
  input int     addr;
  input int     data;
  input int     delay;
begin

end endtask;


task test_seq0;
begin
      read_data( 0, 16'h0010, 2 );
      read_data( 0, 16'h0011, 2 );
      read_data( 0, 16'h0012, 2 );
      write_data( 0, 16'h0212, 16'hA012, 1 );
end endtask;

task test_seq1;
begin
      // read_data( 1, 16'h0110, 2 );
      // read_data( 1, 16'h0111, 2 );
      // read_data( 1, 16'h0112, 2 );

end endtask;

task test_seq2;
begin
      // read_data( 2, 16'h0210, 2 );
      // read_data( 2, 16'h0211, 2 );
      // read_data( 2, 16'h0212, 0 );
      // read_data( 2, 16'h0212, 0 );
      // read_data( 2, 16'h0212, 0 );
      // read_data( 2, 16'h0212, 0 );
      // read_data( 2, 16'h0212, 0 );
      // read_data( 2, 16'h0212, 0 );
      // read_data( 2, 16'h0212, 0 );

end endtask;


// Generate test sequence 
initial begin

  @(posedge clk iff test_start=='1);

  case( test_id )
  0: begin
      $display("Test 0: %s", test_name[0]);

          fork
            begin
              test_seq0();
            end
            begin
              fork
                test_seq1();
                test_seq2();
              join
            end
          join


  end
  1: begin
      $display("Test 1: %s", test_name[1]);
  end
  endcase

  // Wait for empty queues
  while(1) begin

    if(   
             0==qa_transaction_drive_rd[0].size() 
          && 0==qa_transaction_drive_rd[1].size() 
          && 0==qa_transaction_drive_rd[2].size() 
    ) begin
      break;
    end

    @(posedge( clk ));

  end

  #500;

  test_done=1;

end 

initial begin
    #100000;
    $display( "Timeout");
    test_timeout = '1;
end

initial begin  

  int args=-1;
   
  if( $value$plusargs( "test_id=%0d", args )) begin
    if( args>=0 && args<2 )
      test_id = args;

    $display( "args=%d  test_id=%d", args, test_id );

  end


  $display("Test multi_memory test_id=%d  name:", test_id, test_name[test_id] );
  
  rst = '1;

  #100;

  rst =  '0;

  @(posedge clk );
  test_start = '1;

  @(posedge clk iff test_done=='1 || test_timeout=='1);

  if( test_timeout )
    cnt_error++;

  $display( "cnt_wr: %d", cnt_wr );
  $display( "cnt_rd: %d", cnt_rd );
  $display( "cnt_ok: %d", cnt_ok );
  $display( "cnt_error: %d", cnt_error );


  // $display("overall coverage = %0f", $get_coverage());
  // $display("coverage of covergroup cg = %0f", uut.cg.get_coverage());
  // $display("coverage of covergroup cg.in_tready = %0f", uut.cg.in_tready.get_coverage());
  // $display("coverage of covergroup cg.in_tvalid = %0f", uut.cg.in_tvalid.get_coverage());
  // $display("coverage of covergroup cg.out_tready = %0f", uut.cg.out_tready.get_coverage());
  // $display("coverage of covergroup cg.out_tvalid = %0f", uut.cg.out_tvalid.get_coverage());
  // $display("coverage of covergroup cg.flag_hf = %0f", uut.cg.flag_hf.get_coverage());
  
  // $display("coverage of covergroup cg.i_vld_rdy = %0f", uut.cg.i_vld_rdy.get_coverage());
  // $display("coverage of covergroup cg.o_vld_rdy = %0f", uut.cg.o_vld_rdy.get_coverage());

  // $display("coverage of covergroup cg.o_rdy_transitions = %0f", uut.cg.o_rdy_transitions.get_coverage());
  

  if( 0==cnt_error && cnt_ok>0 )
    test_finish( test_id, test_name[test_id], 1 );  // test passed
  else
    test_finish( test_id, test_name[test_id], 0 );  // test failed



end

endmodule



`default_nettype wire
