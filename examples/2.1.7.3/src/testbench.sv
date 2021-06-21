// Code your testbench here
// or browse Examples

`default_nettype none

module tb
  #( parameter test_id=1
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

logic [nb - 1:0]   in_tdata;
logic              in_tvalid;
logic              in_tready;

logic [nb - 1:0]   out_tdata;
logic              out_tvalid;
logic              out_tready;
  
int               cnt_ok=0;  
int               cnt_error=0;
logic             test_done=0;
initial begin  
//   int fd = $fopen("test_id.txt", "r");
//   $fscanf( fd,"%d\n",test_id);
//   $fclose(fd );
  $display("Test gearbox_upsizing_2x test_id=%d  name:", test_id, test_name[test_id] );
  
  aresetn = '0;

  #100;

  aresetn = '1;

  @(posedge aclk iff test_done=='1);

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



endmodule


`default_nettype wire