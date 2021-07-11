module testbench;
  
  localparam N                          = 10;
         
  
  reg clk, rst;
  
  reg  					[8*N   - 1:0]	in_tdata;
  reg					[N     - 1:0] 	in_tkeep;
  reg                   				in_tvalid;
  wire                  				in_tready;
  
  reg  					[8*N   - 1:0]	out_tdata;
  wire                  				out_tvalid;
  reg                  					out_tready;
  
    
  packing #(N) dut
  (
    .aclk     (   clk ),
    .aresetn  ( ~ rst ),
    .*
  );
  
/***************************************************/
  initial
  begin
      clk = '0;
      forever #5 clk = ~ clk;
    end

  task init ();
    in_tvalid  <= '0;
    out_tready <= '1;
  endtask
  
  task reset ();
    #3 rst <= '1;
    repeat (6) @ (posedge clk);
    rst <= 1'b0;
  endtask
/***************************************************/ 
  task test_1_back_to_back ();
    
    $display ("*** test_1_back_to_back ***");
    
    repeat (6) @ (posedge clk);
    in_tvalid <= #1 '1;
    in_tdata  <= #1 "ABCDEFGHIJ";
    in_tkeep  <= #1 10'b0001101011;
    @ (posedge clk);
    in_tdata  <= #1 "KLMONPQRST";
    in_tkeep  <= #1 10'b1001001111;
    @ (posedge clk);
    in_tdata  <= #1 "UVWXYabcde";
    in_tkeep  <= #1 10'b1011110000;
    @ (posedge clk);
    in_tdata  <= #1 "fghijklmno";
    in_tkeep  <= #1 10'b1010101000;
    @ (posedge clk);
    in_tdata  <= #1 "HELLOWORLD";
    in_tkeep  <= #1 10'b0001101011;
    @ (posedge clk);
    in_tdata  <= #1 "SHUDESHUDE";
    in_tkeep  <= #1 10'b1111110000;
    @ (posedge clk);
    in_tvalid <= #1 '0;
    repeat (6) @ (posedge clk);
    
  endtask
/***************************************************/ 

/***************************************************/ 
    task test_2_gaps_in_valid ();

    $display ("*** test_2_gaps_in_valid ***");
    
    repeat (6) @ (posedge clk);
    
    in_tvalid <= '1;
    in_tdata  <= "ABCDEFGHIJ";
    in_tkeep  <= 10'b0001101011;
    @ (posedge clk);
    in_tvalid <= '0;
    @ (posedge clk);
    in_tvalid <= '1;
    in_tdata  <= "KLMONPQRST";
    in_tkeep  <= 10'b1001001111;
    @ (posedge clk);
    in_tvalid <= '0;
    @ (posedge clk);
    in_tvalid <= '1;
    in_tdata  <= "UVWXYabcde";
    in_tkeep  <= 10'b1011110000;
    @ (posedge clk);
    in_tvalid <= '0;
    @ (posedge clk);
    in_tvalid <= '1;
    in_tdata  <= "fghijklmno";
    in_tkeep  <= 10'b1010101000;
    @ (posedge clk);
    in_tvalid <= '0;
    @ (posedge clk);
    in_tvalid <= '1;
    in_tdata  <= "HELLOWORLD";
    in_tkeep  <= 10'b0001101011;
    @ (posedge clk);
    in_tvalid <= '0;
    @ (posedge clk);
    in_tvalid <= '1;
    in_tdata  <= "SHUDESHUDE";
    in_tkeep  <= 10'b1111110000;
    @ (posedge clk);
    in_tvalid <= '0;
    repeat (6) @ (posedge clk);
  endtask
/***************************************************/   

  
  initial
    begin
      $dumpfile ("dump.vcd");
      $dumpvars;
    
      fork
        begin
          init                 ();
          reset                ();
          test_1_back_to_back  ();
          test_2_gaps_in_valid ();
        end 
        
        begin
         repeat (1000)
         @ (posedge clk);
          
     	 $display ("Timeout: design hangs");
        end
      
      join_any

      $finish;
    end
endmodule  