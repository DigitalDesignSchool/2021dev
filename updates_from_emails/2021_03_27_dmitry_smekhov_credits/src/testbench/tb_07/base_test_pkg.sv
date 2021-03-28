

`timescale 1 ns / 1 ns
//`default_nettype none 


package base_test_pkg;



class base_test;

typedef struct
{
    logic   [7:0]   addr;    //! value for address
    int             delay;  //! delay after send
    int             last;   //! 1 - last data
} type_test_input;


type_test_input     test_input[128];
int                 max_test_input;
int                 current_index;

logic   [15:0]      ram0_data[256];
logic   [15:0]      ram1_data[256];

function new ();

    max_test_input=0;
    current_index=0;

    for( int ii=0; ii<256; ii++ ) begin
        ram0_data[ii]=0;
        ram1_data[ii]=0;
    end

endfunction

function type_test_input get_input();
    type_test_input ret;
    if( current_index==max_test_input ) begin
        ret.addr    = 8'h00;
        ret.delay   = 0;
        ret.last    = 1;
    end else begin
        ret.addr    = test_input[current_index].addr;
        ret.delay   = test_input[current_index].delay;
        ret.last    = 0;
        current_index++;
        if( current_index==max_test_input )
            ret.last    = 1;
    end
    return ret;

endfunction;

function logic[15:0]    get_ram0( int addr );
    logic   [15:0]  ret=0;
    if( addr>0 & addr<256 )
        ret = ram0_data[addr];
    return ret;
endfunction

function logic[15:0]    get_ram1( int addr );
    logic   [15:0]  ret=0;
    if( addr>0 & addr<256 )
        ret = ram1_data[addr];
    return ret;
endfunction

endclass





endpackage

//`default_nettype wire