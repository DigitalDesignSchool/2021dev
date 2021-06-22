// Code your testbench here
// or browse Examples

`default_nettype none

module tb
  #( parameter test_id=0
   )
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
  
  $finish();
end endtask  
  
localparam  n = 5, nb = n * 8;

logic              aclk=0;
logic              aresetn;

logic [nb - 1:0]   in_tdata='0;
logic              in_tvalid='0;
logic              in_tready;

logic [nb*2 - 1:0] expect_tdata;
logic [nb*2 - 1:0] out_tdata;
logic              out_tvalid;
logic              out_tready='1;
  
int                 cnt_wr=0;
int                 cnt_rd=0;
int                 cnt_ok=0;  
int                 cnt_error=0;
logic               test_done=0;
int                 out_ready_cnt=0;

initial begin  
//   int fd = $fopen("test_id.txt", "r");
//   $fscanf( fd,"%d\n",test_id);
//   $fclose(fd );
  $display("Test gearbox_upsizing_2x test_id=%d  name:", test_id, test_name[test_id] );
  
  aresetn = '0;

  #100;

  aresetn = '1;

  @(posedge aclk iff test_done=='1);

  if( cnt_wr != cnt_rd*2 )
    cnt_error++;

  $display( "cnt_wr: %d", cnt_wr );
  $display( "cnt_rd: %d", cnt_rd );
  $display( "cnt_ok: %d", cnt_ok );
  $display( "cnt_error: %d", cnt_error );

  if( 0==cnt_error && cnt_ok>0 )
    test_finish( test_id, test_name[test_id], 1 );  // test passed
  else
    test_finish( test_id, test_name[test_id], 0 );  // test failed
end
  
always #5 aclk = ~aclk;
  
gearbox_upsizing_2x   uut
(
          .*
);

task write_data;
    input logic [nb - 1:0]    data;
    input int                 pause;  // 0 - tvalid still high
begin
      in_tdata  <= #1 data;
      in_tvalid <= #1 '1;
      @(posedge aclk iff in_tvalid & in_tready);
      cnt_wr++;
      if( cnt_wr<16 ) begin
        $display( "input: %s  (%h)", data, data );
      end

      if( pause>0 ) begin
        in_tvalid <= #1 '0;
        in_tdata  <= #1 '0;
        for( int ii=0; ii<pause; ii++ )
          @(posedge aclk);
      end

end endtask

task set_outready_cnt;
      input int cnt;
begin
      out_tready <= #1 '0;
      out_ready_cnt = cnt;

end endtask

generate
  case( test_id)
    0: begin

        always @(posedge aclk)
          if( out_ready_cnt>0 ) begin
              out_ready_cnt--;
              if( 0==out_ready_cnt )
                out_tready <= #1 '1;
          end

        initial begin

            //out_tready = 1;

            #500;
            @(posedge aclk);
            write_data( "ABCDE", 0 );
            write_data( "FGHIJ", 16 );

            
            write_data( "ABCDE", 8 );
            write_data( "FGHIJ", 8 );

            write_data( "KLMON", 0 );
            set_outready_cnt(4);
            write_data( "PQRST", 0 );
            set_outready_cnt(1);
            write_data( "UVWXY", 0 );
            set_outready_cnt(1);
            write_data( "Zabcd", 0 );
            set_outready_cnt(1);
            write_data( "efghi", 0 );
            set_outready_cnt(4);
            write_data( "jklmo", 1 );
            set_outready_cnt(4);
            

            #500;

            test_done=1;
        end

    end

    1: begin

    end
  endcase
endgenerate

// Checker
logic [7:0]   q_data  [$];

always @(posedge aclk)
  if( in_tvalid & in_tready ) begin
    for( int ii=0; ii<n; ii++ )
      q_data.push_front( in_tdata[ii*8+:8]);
  end

always @(posedge aclk)
  if( out_tvalid & out_tready ) begin
    for( int ii=0; ii<n; ii++) begin
      expect_tdata[(n+ii)*8+:8] = q_data.pop_back();
    end
    for( int ii=0; ii<n; ii++) begin
      expect_tdata[ii*8+:8] = q_data.pop_back();
    end

    if( expect_tdata==out_tdata ) begin
      cnt_ok++;

      if( cnt_ok<16 )
        $display( "output: %s  (%h)  ok: %-5d error: %-5d  - Ok", out_tdata, out_tdata, cnt_ok, cnt_error );
    end else begin
      cnt_error++;
      if( cnt_error<16 )
        $display( "output: %s  (%h)  expect %s (%h) ok: %-5d error: %-5d  - Error", out_tdata, out_tdata, expect_tdata, expect_tdata, cnt_ok, cnt_error );

    end

    cnt_rd++;
  end

endmodule


`default_nettype wire