`include "defines.svh"
`include "binding_coverage_upsizing.sv"

`ifndef TIMEOUT_CYCLES
	`define TIMEOUT_CYCLES 10000
`endif

module testbench;
  
  localparam W                          = 40,
             max_valid_gap              = 5,
             n_ready_patters            = 3,
             end_of_valid_transfers_gap = 10,
             end_of_test_gap            = 10,
             n_in_test_transfers        = 8,
             n_cycles_to_keep_ready     = (max_valid_gap + 1) * n_in_test_transfers + end_of_valid_transfers_gap;
  
  reg clk, rst;
  
  reg  [W     - 1 : 0] in_tdata;
  reg                  in_tvalid;
  wire                 in_tready;
  
  reg  [W * 2 - 1 : 0] out_tdata;
  wire                 out_tvalid;
  reg                  out_tready;
  
  real cov;
  int iteration = 0;
  bind upsizing   binding_coverage_upsizing #(W)   dut(.*); 
  
  upsizing #(W) dut
  (
    .aclk     (   clk ),
    .aresetn  ( ~ rst ),
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
  
  task wait_ready_and_introduce_valid_gap (int valid_pattern = 0);

    do
      @ (posedge clk);
    while (~ in_tready);

    in_tvalid <= '0;

    if (valid_pattern > max_valid_gap)
      valid_pattern = $urandom_range (0, max_valid_gap);

    repeat (valid_pattern) @ (posedge clk);

    in_tvalid <= '1;

  endtask
  
  task test_random (int ready_pattern = 0, int valid_pattern  = 0);
    
    $display ("*** test_random:\nready_pattern %d%s ***\nvalid_pattern %d%s ***",
      ready_pattern,
      ready_pattern == 0  ? "(random)" : "",
      valid_pattern,
      valid_pattern == -1 ? "(random)" : "");
    
    fork
      begin
        repeat (1)
          begin
            in_tvalid <= '1;
            in_tdata  <= "ABCDE";
            wait_ready_and_introduce_valid_gap (valid_pattern);
            in_tdata  <= "FGHIJ";
            wait_ready_and_introduce_valid_gap (valid_pattern);
            in_tdata  <= "KLMON";
            wait_ready_and_introduce_valid_gap (valid_pattern);
            in_tdata  <= "PQRST";
            wait_ready_and_introduce_valid_gap (valid_pattern);
            in_tdata  <= "UVWXY";
           	wait_ready_and_introduce_valid_gap (valid_pattern);
            in_tdata  <= "Zabcd";
            wait_ready_and_introduce_valid_gap (valid_pattern);
            in_tvalid <= '0;
            repeat (6) @ (posedge clk);
          end
        
        repeat (end_of_valid_transfers_gap) @ (posedge clk);
      end

      begin
        case (ready_pattern)
          1:
            begin
              out_tready <= '1;
              repeat (n_cycles_to_keep_ready) @ (posedge clk);
            end
          2:
            begin
              out_tready <= '1;
              
              repeat (n_cycles_to_keep_ready)
                begin
                  @ (posedge clk);
                  out_tready <= ~ out_tready;
                end
              
              out_tready <= '1;
            end
          
          3:
            begin
              out_tready <= '0;
              
              repeat (n_cycles_to_keep_ready)
                begin
                  @ (posedge clk);
                  out_tready <= ~ out_tready;
                end
              
              out_tready <= '1;
            end
          
          default:
            begin
              repeat (n_cycles_to_keep_ready)
                begin
                  @ (posedge clk);
                  out_tready <= $urandom;
                end
              
              out_tready <= '1;
            end
        endcase
      end
    join_any
    
    disable fork;

    assert (in_tvalid == '0);
    out_tready <= '1;

    repeat (end_of_test_gap) @ (posedge clk);
    
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

  logic [W     - 1:0] queue [$];
  logic [2 * W - 1:0] out_data_expected;

  always @ (posedge clk)
    begin
      if (in_tvalid & in_tready)
        queue.push_back (in_tdata);

      if (out_tvalid & out_tready)
      begin
        if (queue.size () == 0)
          $fatal ("unexpected output data: nothing in flight");
        else if (queue.size () == 1)
          $fatal ("unexpected output data: only 1 in_data is in flight");
        else
        begin
          out_data_expected [2 * W - 1:W] = queue.pop_front ();
          out_data_expected [    W - 1:0] = queue.pop_front ();

          if (out_data_expected != out_tdata)
            $fatal ("data does not match: data=%s expected_data=%s",
              out_tdata, out_data_expected);
          else
            $display ("monitor: out_tdata matches: %s", out_tdata);
        end
      end
    end

  final
    if (queue.size () != 0)
      $fatal ("some data is left sitting in DUT");

  //--------------------------------------------------------------------------

  initial
    begin
      $dumpfile ("dump.vcd");
      $dumpvars;
    
      fork
        begin
          init                 ();
          reset                ();

          for (int ready_pattern = 1; ready_pattern <= n_ready_patters + 1; ready_pattern ++)
            for (int valid_pattern = 0; valid_pattern < max_valid_gap + 1; valid_pattern ++)
              test_random (.ready_pattern (ready_pattern), .valid_pattern (valid_pattern));
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