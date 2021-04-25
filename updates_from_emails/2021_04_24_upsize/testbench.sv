`timescale 1 ns / 1 ns

module testbench;
  
  localparam W = 40;
  
  reg clk, rst;
  
  reg  [W     - 1 : 0] in_tdata;
  reg                  in_tvalid;
  wire                 in_tready;
  
  reg  [W * 2 - 1 : 0] out_tdata;
  wire                 out_tvalid;
  reg                  out_tready;
  
  upsizing #(W) dut
  (
    .aclk    (   clk ),
    .aresetn ( ~ rst ),
    .*
  );
  
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

  //--------------------------------------------------------------------------
  
  task test_1_back_to_back ();
    
    $display ("*** test_1_back_to_back ***");
    
    repeat (6) @ (posedge clk);
    in_tvalid <= '1;
    in_tdata  <= "ABCDE";
    @ (posedge clk);
    in_tdata  <= "FGHIJ";
    @ (posedge clk);
    in_tdata  <= "KLMON";
    @ (posedge clk);
    in_tdata  <= "PQRST";
    @ (posedge clk);
    in_tdata  <= "UVWXY";
    @ (posedge clk);
    in_tdata  <= "Zabcd";
    @ (posedge clk);
    in_tvalid <= '0;
    repeat (6) @ (posedge clk);
    
  endtask

  //--------------------------------------------------------------------------
  
  task test_2_gaps_in_valid ();

    $display ("*** test_2_gaps_in_valid ***");
    
    repeat (6) @ (posedge clk);
    
    in_tvalid <= '1;
    in_tdata  <= "ABCDE";
    @ (posedge clk);
    in_tvalid <= '0;
    @ (posedge clk);
    in_tvalid <= '1;
    in_tdata  <= "FGHIJ";
    @ (posedge clk);
    in_tvalid <= '0;
    @ (posedge clk);
    in_tvalid <= '1;
    in_tdata  <= "KLMON";
    @ (posedge clk);
    in_tvalid <= '0;
    @ (posedge clk);
    in_tvalid <= '1;
    in_tdata  <= "PQRST";
    @ (posedge clk);
    in_tvalid <= '0;
    @ (posedge clk);
    in_tvalid <= '1;
    in_tdata  <= "UVWXY";
    @ (posedge clk);
    in_tvalid <= '0;
    @ (posedge clk);
    in_tvalid <= '1;
    in_tdata  <= "Zabcd";
    @ (posedge clk);
    in_tvalid <= '0;
    repeat (6) @ (posedge clk);
  endtask

  //--------------------------------------------------------------------------
  
  task wait_ready ();
    do
      @ (posedge clk);
    while (~ in_tready);
  endtask
  
  task test_3_random (int ready_pattern = 0);
    
    $display ("*** test_3_random: ready_pattern %d%s ***",
      ready_pattern,
      ready_pattern == 0 ? "(random)" : "");
    
    fork
      begin
        repeat (6) @ (posedge clk);
        
        repeat (3)
          begin
            in_tvalid <= '1;
            in_tdata  <= "ABCDE";
            wait_ready ();
            in_tdata  <= "FGHIJ";
            wait_ready ();
            in_tdata  <= "KLMON";
            wait_ready ();
            in_tdata  <= "PQRST";
            wait_ready ();
            in_tdata  <= "UVWXY";
            wait_ready ();
            in_tdata  <= "Zabcd";
            wait_ready ();
            in_tvalid <= '0;
            wait_ready ();
          end
        
        repeat (6) @ (posedge clk);
      end

      begin
        case (ready_pattern)
          1:
            begin
              out_tready <= '1;
              repeat (8) @ (posedge clk);
              out_tready <= '0;
              repeat (8) @ (posedge clk);
              out_tready <= '1;
            end
          2:
            begin
              out_tready <= '1;
              
              repeat (10)
                begin
                  @ (posedge clk);
                  out_tready <= ~ out_tready;
                end
              
              out_tready <= '1;
            end
          
          3:
            begin
              out_tready <= '0;
              
              repeat (10)
                begin
                  @ (posedge clk);
                  out_tready <= ~ out_tready;
                end
              
              out_tready <= '1;
            end
          
          default:
            begin
              repeat (50)
                begin
                  @ (posedge clk);
                  out_tready <= $urandom;
                end
              
              out_tready <= '1;
            end
        endcase
      end
    join
    
  endtask
    
  //--------------------------------------------------------------------------
  
  int cycle = 0;
  
  always @ (posedge clk)
    begin
      $write ("%d %s in vld=%b rdy=%b",
        cycle,
        rst ? "rst" : "   ",
        in_tvalid,
        in_tready);
      
      $write (" %s", in_tdata);
      
      if (in_tvalid)
        $write (" %s", in_tdata);
      else
        $write ("      ");
      
      if (in_tvalid & in_tready)
        $write (" %s", in_tdata);
      else
        $write ("      ");
      
      $write (" out vld=%b rdy=%b",
        out_tvalid,
        out_tready);
      
      if (dut.lower_bits)
        $write (" %s.....", out_tdata [W * 2 - 1:W]);
      else
        $write (" %s", out_tdata);

      if (~ out_tvalid)
        $write ("           ");
      else if (dut.lower_bits)
        $write (" %s.....", out_tdata [W * 2 - 1:W]);
      else
        $write (" %s", out_tdata);
      
      if (out_tvalid & out_tready)
        $write (" %s", out_tdata);
      else
        $write ("           ");
      
      $display;
      
      cycle ++;
    end
  
  //--------------------------------------------------------------------------
  
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
          
          test_3_random (.ready_pattern (1));
          test_3_random (.ready_pattern (2));
          test_3_random (.ready_pattern (3));
          test_3_random (); // Random ready pattern
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
