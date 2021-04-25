// Code your testbench here
// or browse Examples

/*
parameter n     = 256,
          w_ptr = $clog2 (n);

typedef logic [w_ptr - 1:0] ptr_t;
*/

module test();
  logic clk = '0;
  logic rst;
  ptr_t out_ptr;
  wire  out_ptr_vld;

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0);

    // $display("time\t out_ptr\t");
    // $monitor("%g\t %d\t",
    //         $time, out_ptr);
    
    rst = 1;
    repeat(2) @ (posedge clk);
    rst = 0;
    repeat(150) @ (posedge clk);
    $finish;
  end

  int cycle = 0;
  
  always @ (posedge clk)
  begin
    $write ("%d rst=%b", cycle, rst);
    
    if (out_ptr_vld)
      $write ("%d", out_ptr);

    $display;
    
    cycle ++;
  end

  always begin
    #5 clk = ~clk;
  end

  /* 
  For Verilog 2001:
  
  reg clk;
  
  initial
  begin
    clk = 1'b0;
    forever #5 clk = ~clk;
  end
  */
  
  req_gen i_req_gen(.*);

endmodule
