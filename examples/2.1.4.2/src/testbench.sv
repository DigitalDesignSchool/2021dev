// Code your testbench here
// or browse Examples

`default_nettype none

`include "transaction_pkg.sv"
`include "golden_memory_pkg.sv"

import transaction_pkg::*;
import golden_memory_pkg::*;


module tb
  ();
  
  
  string	test_name[3:0]=
  {
   "randomize_single",
   "randomize_split_full",
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

int                 show_ok=0;
int                 show_error=0;

int                 test_id=0;
logic               test_start=0;
logic               test_timeout=0;
logic               test_done=0;
int                 out_ready_cnt=0;

int                 randomize_loop=10000;

golden_memory_t     golden_memory;
int                 tick_current=0;


type_transaction qa_transaction_drive_rd[REQUESTERS-1:0]  [$];
type_transaction qa_transaction_check_rd[REQUESTERS-1:0]  [$];
type_transaction current_drive_rd[REQUESTERS-1:0];
type_transaction current_check_rd[REQUESTERS-1:0];

type_transaction qa_transaction_drive_wr[REQUESTERS-1:0]  [$];
type_transaction current_drive_wr[REQUESTERS-1:0];

int qa_rd_start[REQUESTERS-1:0]  [$];

type_uut   u[REQUESTERS-1:0];
type_stat  st[REQUESTERS-1:0];
  
wire [15:0] r2_r_addr = u[2].r_addr;
wire [15:0] r1_r_addr = u[1].r_addr;
wire [15:0] r0_r_addr = u[0].r_addr;
wire        r2_r_avalid = u[2].r_avalid;
wire        r1_r_avalid = u[1].r_avalid;
wire        r0_r_avalid = u[0].r_avalid;
wire        r2_r_dvalid = u[2].r_dvalid;
wire        r1_r_dvalid = u[1].r_dvalid;
wire        r0_r_dvalid = u[0].r_dvalid;
wire [15:0] r2_r_data = u[2].r_data;
wire [15:0] r1_r_data = u[1].r_data;
wire [15:0] r0_r_data = u[0].r_data;
wire        r2_r_aready = u[2].r_aready;
wire        r1_r_aready = u[1].r_aready;
wire        r0_r_aready = u[0].r_aready;
wire [15:0] r2_w_addr = u[2].w_addr;
wire [15:0] r1_w_addr = u[1].w_addr;
wire [15:0] r0_w_addr = u[0].w_addr;
wire [15:0] r2_w_data = u[2].w_data;
wire [15:0] r1_w_data = u[1].w_data;
wire [15:0] r0_w_data = u[0].w_data;
wire        r2_w_valid = u[2].w_valid;
wire        r1_w_valid = u[1].w_valid;
wire        r0_w_valid = u[0].w_valid;
wire        r2_w_ready = u[2].w_ready;
wire        r1_w_ready = u[1].w_ready;
wire        r0_w_ready = u[0].w_ready;
  
logic [2*REQUESTERS-1:0]					        mask_avaliable[REQUESTERS-1:0];
logic [2*REQUESTERS-1:0][DATA_WIDTH-1:0]	expect_data[REQUESTERS-1:0];
logic                                     flag_eq[REQUESTERS-1:0];

  
localparam  BANKS = 4;

multibank_memory
  #(
    .READ_PORTS		(	REQUESTERS	), 
    .WRITE_PORTS	(	REQUESTERS	),
    .DATA_WIDTH     (   DATA_WIDTH  ),
    .ADDR_WIDTH     (   ADDR_WIDTH  ),
    .BANKS 			(   BANKS     	)
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


// multibank_memory
//   #(
//     .READ_PORTS		(	REQUESTERS	), 
//     .WRITE_PORTS	(	REQUESTERS	),
//     .DATA_WIDTH     (   DATA_WIDTH  ),
//     .ADDR_WIDTH     (   ADDR_WIDTH  ),
//     .BANKS 			(   BANKS     	)
// ) uut
// (
//     .r_addr         (   {u[5].r_addr,   u[4].r_addr,    u[3].r_addr   , u[2].r_addr,   u[1].r_addr,    u[0].r_addr   } ),
//     .r_avalid       (   {u[5].r_avalid, u[4].r_avalid,  u[3].r_avalid , u[2].r_avalid, u[1].r_avalid,  u[0].r_avalid } ),
//     .r_dvalid       (   {u[5].r_dvalid, u[4].r_dvalid,  u[3].r_dvalid , u[2].r_dvalid, u[1].r_dvalid,  u[0].r_dvalid } ),
//     .r_data         (   {u[5].r_data,   u[4].r_data,    u[3].r_data   , u[2].r_data,   u[1].r_data,    u[0].r_data   } ),
//     .r_aready       (   {u[5].r_aready, u[4].r_aready,  u[3].r_aready , u[2].r_aready, u[1].r_aready,  u[0].r_aready } ),

//     .w_addr         (   {u[5].w_addr,   u[4].w_addr,    u[3].w_addr   , u[2].w_addr,   u[1].w_addr,    u[0].w_addr   } ),
//     .w_data         (   {u[5].w_data,   u[4].w_data,    u[3].w_data   , u[2].w_data,   u[1].w_data,    u[0].w_data   } ),
//     .w_valid        (   {u[5].w_valid,  u[4].w_valid,   u[3].w_valid  , u[2].w_valid,  u[1].w_valid,   u[0].w_valid } ),
//     .w_ready        (   {u[5].w_ready,  u[4].w_ready,   u[3].w_ready  , u[2].w_ready,  u[1].w_ready,   u[0].w_ready } ),

//                     .*

                    
// );

// Fill memory 

localparam ADDR_MAX  = 2 ** ADDR_WIDTH - 1;
localparam BANK_SIZE = (ADDR_MAX / BANKS) + 1;
initial begin

  for( int ii=0; ii < BANK_SIZE; ii++ )
    uut.bank[0].memory.memory[ii] = ii;
  for( int ii=0; ii < BANK_SIZE; ii++ )
    uut.bank[1].memory.memory[ii] = ii + BANK_SIZE;
  for( int ii=0; ii < BANK_SIZE; ii++ )
    uut.bank[2].memory.memory[ii] = ii + BANK_SIZE * 2;
  for( int ii=0; ii < BANK_SIZE; ii++ )
    uut.bank[3].memory.memory[ii] = ii + BANK_SIZE * 3;


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

// // Driver
genvar ii;
generate
  for( ii=0; ii<REQUESTERS; ii++ ) begin

    initial begin

      //r_avalid[0]  <= #1 '0;
      u[ii].r_avalid  <= #1 '0;
      u[ii].r_addr   <= #1 '0;

      while(1) begin
          while(1) begin
           //@(posedge clk iff(qa_transaction_drive_rd[ii].size()>0));
           if( qa_transaction_drive_rd[ii].size()>0 ) 
              break;
            else
              #1;
          end

          current_drive_rd[ii] = qa_transaction_drive_rd[ii].pop_front();

          if( 3==current_drive_rd[ii].op ) 
            break;
          if( 2==current_drive_rd[ii].op ) begin
              @(posedge clk iff tick_current==current_drive_rd[ii].sync_tick );
              show_ok=0;
              show_error=0;
              continue;
          end
          u[ii].r_addr   <= #1 current_drive_rd[ii].addr;
          u[ii].r_avalid <= #1 '1;


          qa_rd_start[ii].push_back(tick_current);

          @(posedge clk iff u[ii].r_aready & u[ii].r_avalid);

          if( current_drive_rd[ii].delay>0 ) begin
            //r_avalid[0]  <= #1 '0;
            u[ii].r_avalid  <= #1 '0;
            u[ii].r_addr   <= #1 '0;
            repeat(current_drive_rd[ii].delay) @(posedge clk);
          end else if( qa_transaction_drive_rd[ii].size()==0) begin
            u[ii].r_avalid  <= #1 '0;
            u[ii].r_addr   <= #1 '0;
            @(posedge clk iff(qa_transaction_drive_rd[ii].size()>0));
          end
          //current_drive_rd_0 = null;
      end

    end

  end
endgenerate


generate
  for( ii=0; ii<REQUESTERS; ii++ ) begin

    initial begin

      //r_avalid[0]  <= #1 '0;
      u[ii].w_valid  <= #1 '0;
      u[ii].w_addr   <= #1 '0;
      u[ii].w_data   <= #1 '0;

      while(1) begin
          while(1) begin
           //@(posedge clk iff(qa_transaction_drive_rd[ii].size()>0));
           if( qa_transaction_drive_wr[ii].size()>0 ) 
              break;
            else
              #1;
          end

          current_drive_wr[ii] = qa_transaction_drive_wr[ii].pop_front();

          if( 3==current_drive_wr[ii].op ) 
            break;
          if( 2==current_drive_wr[ii].op ) begin
              @(posedge clk iff tick_current==current_drive_wr[ii].sync_tick );
              continue;
          end
          u[ii].w_addr   <= #1 current_drive_wr[ii].addr;
          u[ii].w_data   <= #1 current_drive_wr[ii].data;
          u[ii].w_valid <= #1 '1;

          st[ii].w_start =  tick_current; 

          @(posedge clk iff u[ii].w_ready & u[ii].w_valid);
          
          if( st[ii].w_cnt < MAX_TRANSACTION ) begin
            st[ii].w_delay[st[ii].w_cnt] =  tick_current - st[ii].w_start; 
            st[ii].w_cnt++;
          end

          if( current_drive_wr[ii].delay>0 ) begin
            //r_avalid[0]  <= #1 '0;
            u[ii].w_valid  <= #1 '0;
            u[ii].w_addr   <= #1 '0;
            u[ii].w_data   <= #1 '0;
            repeat(current_drive_wr[ii].delay) @(posedge clk);
          end else if( qa_transaction_drive_wr[ii].size()==0) begin
            u[ii].w_valid  <= #1 '0;
            u[ii].w_addr   <= #1 '0;
            u[ii].w_data   <= #1 '0;
            @(posedge clk iff(qa_transaction_drive_wr[ii].size()>0));
          end
          //current_drive_rd_0 = null;
      end

    end

  end
endgenerate

// // Monitor
generate
  for( ii=0; ii<REQUESTERS; ii++ ) begin

    always @(posedge clk iff '1==u[ii].r_dvalid) begin

      if( 0==qa_transaction_check_rd[ii].size() ) begin
          if( cnt_error<16 ) begin
              $display("Error: unexpected rd_data for port %d. read: %h", ii, u[ii].r_data);
          end
          cnt_error++;
      end else begin

          st[ii].r_start = qa_rd_start[ii].pop_front();
          if( st[ii].r_cnt<MAX_TRANSACTION ) begin
            st[ii].r_delay[st[ii].r_cnt] = tick_current - st[ii].r_start;
            st[ii].r_cnt++;
          end

          current_check_rd[ii] = qa_transaction_check_rd[ii].pop_front();
          //$display("current_check_rd[%-d] addr: %h ", ii, current_check_rd[ii].addr );
          golden_memory.get_data( tick_current, ii, current_check_rd[ii].addr, 
            mask_avaliable[ii], expect_data[ii]
          );
          flag_eq[ii]=0;
          for( int jj=0; jj<2*REQUESTERS; jj++) begin
              if( mask_avaliable[ii][jj] &&  
                  (u[ii].r_data == expect_data[ii][jj] )
              ) begin
                flag_eq[ii]=1;
                break;
              end
          end

          if( 1==flag_eq[ii] ) begin
              if( show_ok<16 ) begin
                 $display("Read: ok: %-d error: %-d  port: %d  adr=%h read: %h mask_avaliable: %h  tick: %h - Ok",
                  cnt_ok, cnt_error, ii, current_check_rd[ii].addr, u[ii].r_data, mask_avaliable[ii], tick_current
                 ); 
                 for( int jj=0; jj<2*REQUESTERS; jj++) begin
                    if( mask_avaliable[ii][jj] )  
                        $display( "   expect data: %h", expect_data[ii][jj] );
                    
                end 
                show_ok++;
              end
              cnt_ok++;
          end else begin
              if(  show_error<16 ) begin
                 $display("Read: ok: %-d error: %-d  port: %d adr: %h read: %h  mask_avaliable: %h  tick: %h - Error",
                    cnt_ok, cnt_error, ii, current_check_rd[ii].addr, u[ii].r_data, mask_avaliable[ii], tick_current
                 );
                 for( int jj=0; jj<2*REQUESTERS; jj++) begin
                    if( mask_avaliable[ii][jj] )  
                        $display( "   expect data: %h", expect_data[ii][jj] );
                    
                end
                show_error++; 
              end
              cnt_error++;
          end

      end
    end

    // Golden Memory
    always @(posedge clk iff u[ii].w_valid & u[ii].w_ready ) begin
      golden_memory.write_mem( tick_current, ii, u[ii].w_addr, u[ii].w_data );
    end

  end
endgenerate




task read_data;
  input int     qn;
  input int     addr;
  input int     delay;
begin

  //type_transaction tr_rd  = new( addr, delay );
  automatic type_transaction tr_rd;
    tr_rd.addr      = addr;
    tr_rd.delay     = delay;
    tr_rd.op        = 1;
    tr_rd.sync_tick = 0;

  if( qn & 1 )  begin 
        qa_transaction_drive_rd[0].push_back(tr_rd);
        qa_transaction_check_rd[0].push_back(tr_rd);
  end
  
  if( qn & 2 )  begin 
        qa_transaction_drive_rd[1].push_back(tr_rd);
        qa_transaction_check_rd[1].push_back(tr_rd);
  end

  if( qn & 4 )  begin 
        qa_transaction_drive_rd[2].push_back(tr_rd);
        qa_transaction_check_rd[2].push_back(tr_rd);
  end

//   if( qn & 8 )  begin 
//         qa_transaction_drive_rd[3].push_back(tr_rd);
//         qa_transaction_check_rd[3].push_back(tr_rd);
//   end

//   if( qn & 'h10 )  begin 
//         qa_transaction_drive_rd[4].push_back(tr_rd);
//         qa_transaction_check_rd[4].push_back(tr_rd);
//   end

//   if( qn & 'h20 )  begin 
//         qa_transaction_drive_rd[5].push_back(tr_rd);
//         qa_transaction_check_rd[5].push_back(tr_rd);
//   end



end endtask;

task write_data;
  input int     qn;
  input int     addr;
  input int     data;
  input int     delay;
begin

 
  automatic type_transaction tr_wr;
    tr_wr.addr      = addr;
    tr_wr.data      = data;
    tr_wr.delay     = delay;
    tr_wr.op        = 4;
    tr_wr.sync_tick = 0;

  if( qn & 1 )  begin 
        qa_transaction_drive_wr[0].push_back(tr_wr);
  end
  
  if( qn & 2 )  begin 
        qa_transaction_drive_wr[1].push_back(tr_wr);
  end

  if( qn & 4 )  begin 
        qa_transaction_drive_wr[2].push_back(tr_wr);
  end
  
//   if( qn & 8 )  begin 
//         qa_transaction_drive_wr[3].push_back(tr_wr);
//   end
  
//   if( qn & 'h10 )  begin 
//         qa_transaction_drive_wr[4].push_back(tr_wr);
//   end
  
//   if( qn & 'h20 )  begin 
//         qa_transaction_drive_wr[5].push_back(tr_wr);
//   end
  

end endtask;


task sync;
  input int     qr;
  input int     qw;
  input int     sync_tick;
begin

 automatic type_transaction tr_rd;
    tr_rd.addr      = 0;
    tr_rd.delay     = 0;
    tr_rd.op        = 2;
    tr_rd.sync_tick = sync_tick;

  if( qr & 1 )  begin 
        qa_transaction_drive_rd[0].push_back(tr_rd);
  end
  
  if( qr & 2 )  begin 
        qa_transaction_drive_rd[1].push_back(tr_rd);
  end

  if( qr & 4 )  begin 
        qa_transaction_drive_rd[2].push_back(tr_rd);
  end


  if( qw & 1 )  begin 
        qa_transaction_drive_wr[0].push_back(tr_rd);
  end
  
  if( qw & 2 )  begin 
        qa_transaction_drive_wr[1].push_back(tr_rd);
  end

  if( qw & 4 )  begin 
        qa_transaction_drive_wr[2].push_back(tr_rd);
  end


end endtask;

task q_end;
  input int     qr;
  input int     qw;
begin

 automatic type_transaction tr_rd;
    tr_rd.addr      = 0;
    tr_rd.delay     = 0;
    tr_rd.op        = 3;
    tr_rd.sync_tick = 0;

  if( qr & 1 )  begin 
        qa_transaction_drive_rd[0].push_back(tr_rd);
        //qa_transaction_check_rd[0].push_back(tr_rd);
  end
  
  if( qr & 2 )  begin 
        qa_transaction_drive_rd[1].push_back(tr_rd);
        //qa_transaction_check_rd[1].push_back(tr_rd);
  end

  if( qr & 4 )  begin 
        qa_transaction_drive_rd[2].push_back(tr_rd);
        //qa_transaction_check_rd[2].push_back(tr_rd);
  end

end endtask;


task test_seq0;
begin
      read_data( 1, 16'h0010, 2 );
      read_data( 1, 16'h0011, 2 );
      read_data( 1, 16'h0012, 2 );


      sync( 1, 1, 'h90 );
      write_data( 1, 16'h0219, 16'hA019, 1 );

      sync( 1, 1, 'hC0 );
      write_data( 1, 16'h0220, 16'hA020, 1 );
      read_data( 1, 16'h0220, 0 );
      read_data( 1, 16'h0220, 0 );
      read_data( 1, 16'h0220, 0 );
      read_data( 1, 16'h0220, 0 );
      read_data( 1, 16'h0220, 0 );
      read_data( 1, 16'h0220, 0 );
      read_data( 1, 16'h0220, 0 );
      read_data( 1, 16'h0220, 1 );

      sync( 1, 1, 'h100 );
      write_data( 1, 16'h0400, 16'hB010, 1 );
      sync( 1, 1, 'h104 );
      read_data( 1, 16'h0400, 0 );
      read_data( 1, 16'h0400, 0 );
      read_data( 1, 16'h0400, 1 );

      q_end( 1, 1 );

end endtask;

task test_seq1;
begin
       read_data( 2, 16'h4110, 2 );
       read_data( 2, 16'h0111, 2 );
       read_data( 2, 16'h0112, 2 );
       read_data( 2, 16'h0113, 2 );
       read_data( 2, 16'h0114, 2 );

       sync( 4, 0, 'h40 );
       read_data( 2, 16'h0115, 0 );
       read_data( 2, 16'h0116, 0 );
       read_data( 2, 16'h0117, 1 );

      sync( 2, 2, 'hC0 );      
      read_data( 2, 16'h0220, 0 );
      read_data( 2, 16'h0220, 0 );
      read_data( 2, 16'h0220, 0 );
      read_data( 2, 16'h0220, 0 );
      read_data( 2, 16'h0220, 0 );
      read_data( 2, 16'h0220, 0 );
      read_data( 2, 16'h0220, 1 );


      sync( 0, 2, 'hE0 );      
      write_data( 2, 16'h0120, 16'hA120, 0 );
      write_data( 2, 16'h0121, 16'hA121, 0 );
      write_data( 2, 16'h0122, 16'hA122, 0 );
      write_data( 2, 16'h0123, 16'hA123, 0 );
      write_data( 2, 16'h0124, 16'hA124, 0 );
      write_data( 2, 16'h0125, 16'hA125, 0 );
      write_data( 2, 16'h0126, 16'hA126, 0 );
      write_data( 2, 16'h0127, 16'hA127, 0 );
      write_data( 2, 16'h0128, 16'hA128, 0 );
      write_data( 2, 16'h0129, 16'hA129, 0 );
      write_data( 2, 16'h012A, 16'hA12A, 1 );

      sync( 2, 0, 'hE4 );      
      read_data( 2, 16'h0120, 0 );
      read_data( 2, 16'h0121, 0 );
      read_data( 2, 16'h0122, 0 );
      read_data( 2, 16'h0123, 0 );
      read_data( 2, 16'h0124, 0 );
      read_data( 2, 16'h0125, 0 );
      read_data( 2, 16'h0126, 0 );
      read_data( 2, 16'h0127, 0 );
      read_data( 2, 16'h0128, 0 );
      read_data( 2, 16'h0129, 0 );
      read_data( 2, 16'h012A, 1 );

      sync( 2, 2, 'h100 );
      write_data( 1, 16'h0400, 16'hC020, 1 );
      sync( 2, 2, 'h105 );
      read_data( 2, 16'h0400, 0 );
      read_data( 2, 16'h0400, 0 );
      read_data( 2, 16'h0400, 1 );

      sync( 0, 2, 'h120 );
      write_data( 2, 16'h0400, 16'hC0E0, 1 );
      write_data( 2, 16'h0400, 16'hC0E1, 1 );
      sync( 2, 0, 'h128 );
      read_data( 2, 16'h0400, 0 );
      read_data( 2, 16'h0400, 0 );
      read_data( 2, 16'h0400, 1 );


       q_end( 2, 2 );

end endtask;

task test_seq2;
begin
      read_data( 4, 16'h8210, 2 );
      read_data( 4, 16'h0211, 2 );
      read_data( 4, 16'h0212, 0 );
      read_data( 4, 16'h0213, 0 );
      read_data( 4, 16'h0214, 0 );
      read_data( 4, 16'h0215, 0 );
      read_data( 4, 16'h0216, 0 );
      read_data( 4, 16'h0217, 0 );
      read_data( 4, 16'h0218, 1 );

      sync( 4, 0, 'h80 );      
      read_data( 4, 16'h0219, 4 );

      sync( 4, 0, 'hA0 );      
      read_data( 4, 16'h0219, 4 );

      sync( 4, 4, 'hC0 );      
      write_data( 4, 16'h0220, 16'hA220, 1 );
      read_data( 4, 16'h0220, 0 );
      read_data( 4, 16'h0220, 0 );
      read_data( 4, 16'h0220, 0 );
      read_data( 4, 16'h0220, 0 );
      read_data( 4, 16'h0220, 0 );
      read_data( 4, 16'h0220, 0 );
      read_data( 4, 16'h0220, 0 );
      read_data( 4, 16'h0220, 1 );

      sync( 0, 4, 'h11F );
      write_data( 4, 16'h0400, 16'hD0E0, 1 );
      write_data( 4, 16'h0400, 16'hD0E1, 1 );
      sync( 4, 0, 'h126 );
      read_data( 4, 16'h0400, 0 );
      read_data( 4, 16'h0400, 0 );
      read_data( 4, 16'h0400, 1 );


      q_end( 4, 4 );

end endtask;

class randomize_full_t;
  rand int op;
  rand int port_mask;
  rand int addr;
  rand int data;
  rand int delay;

  function string str ();
    string s;
    if( 0==op )
      $sformat( s, "op: read   addr: %h  delay:%-d", addr, delay );
    else
      $sformat( s, "op: write  addr: %h  delay:%-d   data: %h"  , addr, delay, data );

    return s;  
  endfunction;

  constraint op_c
  {
    op inside { 0, 1};
  }

  constraint port_mask_c
  {
    //port_mask inside { 1, 2, 4, 8, 16, 32 };
    port_mask inside { 1, 2, 4 };
  }

  constraint addr_c
  {
    //addr[7:0] == 'h00;

    addr dist
    {
      [             0 :     16'h3FFF ] := 25,
      [      16'h4000 :     16'h7FFF ] := 25,
      [      16'h8000 :     16'hBFFF ] := 25,
      [      16'hC000 :     16'hFFFF ] := 25

    //   [             0 :     16'h3FFF ] := 97,
    //   [      16'h4000 :     16'h7FFF ] := 1,
    //   [      16'h8000 :     16'hBFFF ] := 1,
    //   [      16'hC000 :     16'hFFFF ] := 1

    }; 
  }

  constraint delay_c
  {
    //adr[7:0] == 'h00;

    delay dist
    {
      [             1 :     5  ] := 90,
      [             5 :     8  ] := 8,
      [             8 :     16 ] := 2
    }; 
  }


endclass;

task test_randomize;
begin
    
    automatic randomize_full_t r = new;
    for( int ii=0; ii<randomize_loop; ii++ ) begin
      assert( r.randomize() );

      r.addr[7:0] = '0;

      if( 0==r.op )
        read_data( r.port_mask, r.addr, r.delay );
      else
        write_data( r.port_mask, r.addr, r.data, r.delay );

      if( ii<16 )
        $display("%s", r.str() );

    end
    q_end( 7, 7 );
    //q_end( 'h2F, 'h2F );
end endtask; 

task test_randomize_split_full;
begin
    
    automatic randomize_full_t r = new;
    for( int ii=0; ii<randomize_loop; ii++ ) begin
      assert( r.randomize() );

      case( r.port_mask )
        1: r.addr[15:14] = 2'b00;
        2: r.addr[15:14] = 2'b01;
        4: r.addr[15:14] = 2'b10;
      endcase

      r.addr[7:0] = '0;

      if( 0==r.op )
        read_data( r.port_mask, r.addr, r.delay );
      else
        write_data( r.port_mask, r.addr, r.data, r.delay );

      if( ii<16 )
        $display("%s", r.str() );

    end
    q_end( 7, 7 );
    //q_end( 'h2F, 'h2F );
end endtask; 


task test_randomize_single;
begin
    
    automatic randomize_full_t r = new;
    for( int ii=0; ii<randomize_loop; ii++ ) begin
      assert( r.randomize() );

      r.addr[15:14] = 2'b00;

      r.addr[7:0] = '0;

      if( 0==r.op )
        read_data( r.port_mask, r.addr, r.delay );
      else
        write_data( r.port_mask, r.addr, r.data, r.delay );

      if( ii<16 )
        $display("%s", r.str() );

    end
    q_end( 7, 7 );
    //q_end( 'h2F, 'h2F );
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
      test_randomize();
  end

  2: begin
      $display("Test 1: %s", test_name[1]);
      test_randomize_split_full();
  end

  3: begin
      $display("Test 1: %s", test_name[1]);
      test_randomize_single();
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

always @(posedge clk)  tick_current <= #1 tick_current+1;

initial begin
    #200000;
    $display( "Timeout");
    test_timeout = '1;
end

initial begin  

  int args=-1;
   
  if( $value$plusargs( "test_id=%0d", args )) begin
    if( args>=0 && args<4 )
      test_id = args;

    $display( "args=%d  test_id=%d", args, test_id );

  end


  $display("Test multi_memory test_id=%d  name:", test_id, test_name[test_id] );
  
  golden_memory = new();

  rst = '1;

  #200;

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
  


  for( int ii=0; ii<REQUESTERS; ii++ ) begin

    automatic int curr_delay = st[ii].r_delay[0]; 
    automatic int min_delay=curr_delay;
    automatic int max_delay=curr_delay;
    automatic int avr_delay=curr_delay;
    

    for( int jj=1; jj<st[ii].r_cnt; jj++ ) begin
        curr_delay = st[ii].r_delay[jj]; 

        if( curr_delay<min_delay )
            min_delay=curr_delay;

        if( curr_delay>max_delay )
            max_delay=curr_delay;

        avr_delay +=curr_delay;
    end

    avr_delay /= st[ii].r_cnt;

     st[ii].r_delay_min = min_delay;
     st[ii].r_delay_max = max_delay;
     st[ii].r_delay_avr = avr_delay;

     st[ii].r_velocity = 1.0 * st[ii].r_cnt / tick_current;


  end

  for( int ii=0; ii<REQUESTERS; ii++ ) begin

    automatic int curr_delay = st[ii].w_delay[0]; 
    automatic int min_delay=curr_delay;
    automatic int max_delay=curr_delay;
    automatic int avr_delay=curr_delay;
    

    for( int jj=1; jj<st[ii].w_cnt; jj++ ) begin
        curr_delay = st[ii].w_delay[jj]; 

        if( curr_delay<min_delay )
            min_delay=curr_delay;

        if( curr_delay>max_delay )
            max_delay=curr_delay;

        avr_delay +=curr_delay;
    end

    avr_delay /= st[ii].w_cnt;

     st[ii].w_delay_min = min_delay;
     st[ii].w_delay_max = max_delay;
    st[ii].w_delay_avr = avr_delay;

    st[ii].w_velocity = 1.0 * st[ii].w_cnt / tick_current;

  end  

  $display("");

  for( int ii=0; ii<REQUESTERS; ii++ ) begin

      $display( "Read operation for port %-2d   - count: %-5d   min_delay: %-4d  max_delay: %-4d  avr_delay: %-4d velocity: %f Tr/clock",
               ii, st[ii].r_cnt, st[ii].r_delay_min, st[ii].r_delay_max, st[ii].r_delay_avr, st[ii].r_velocity 
      );
      
  end

  $display("");

  for( int ii=0; ii<REQUESTERS; ii++ ) begin

      $display( "Write operation for port %-2d  - count: %-5d   min_delay: %-4d  max_delay: %-4d  avr_delay: %-4d velocity: %f Tr/clock",
               ii, st[ii].w_cnt, st[ii].w_delay_min, st[ii].w_delay_max, st[ii].w_delay_avr, st[ii].w_velocity 
      );
      
  end

  $display("");

  if( 0==cnt_error && cnt_ok>0 )
    test_finish( test_id, test_name[test_id], 1 );  // test passed
  else
    test_finish( test_id, test_name[test_id], 0 );  // test failed



end

endmodule



`default_nettype wire
