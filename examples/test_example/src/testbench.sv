// Code your testbench here
// or browse Examples


module tb
  #( parameter test_id=1
   )
  ();
  
  
  string	test_name[3:0]=
  {
   "test_3", 
   "test_2", 
   "test_1", 
   "test_0" 
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
  


  
initial begin  
//   int fd = $fopen("test_id.txt", "r");
//   $fscanf( fd,"%d\n",test_id);
//   $fclose(fd );
  $display("Hello, world! test_id=%d  name:", test_id, test_name[test_id] );
  
  if( 1==test_id )
    test_finish( test_id, test_name[test_id], 1 );
  else
    test_finish( test_id, test_name[test_id], 0 );
end
  
endmodule