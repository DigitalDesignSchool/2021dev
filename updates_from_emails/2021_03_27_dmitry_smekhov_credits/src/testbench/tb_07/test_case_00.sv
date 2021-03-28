

`timescale 1 ns / 1 ns
//`default_nettype none 


interface test_case_00(       input wire clk   );


struct
{
    logic   [7:0]   adr;    //! valuse for address
    int             delay;  //! delay after send
} type_test_input;




task test_case_00_gen
(
    type_i_axis.master      stream_addr
);

endtask;

endinterface

`default_nettype wire