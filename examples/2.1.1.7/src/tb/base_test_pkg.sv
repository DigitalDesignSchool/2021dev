

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


typedef struct
{
    logic   [15:0]   data;    //! value for address
    int             delay;  //! delay after send
    int             last;   //! 1 - last data
} type_test_expect;



type_test_input     test_input[128];
int                 max_test_input;
int                 current_index;

type_test_expect    test_expect[4096];
int                 max_test_expect;
int                 current_index_expect;

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



function type_test_expect get_expect();
    type_test_expect ret;
    if( current_index_expect==max_test_expect ) begin
        ret.data    = 8'h00;
        ret.delay   = 0;
        ret.last    = 1;
    end else begin
        ret.data    = test_expect[current_index_expect].data;
        ret.delay   = test_expect[current_index_expect].delay;
        ret.last    = 0;
        current_index_expect++;
        if( current_index_expect==max_test_expect )
            ret.last    = 1;
    end
    return ret;

endfunction

function int get_max_expect();
    return max_test_expect;
endfunction    

function void create_expect_data();
    int index=0;
    int ii, jj, cnt;
    logic [15:0] val;
    logic [15:0]    val_b;
    int addr_b;
    for( int ii=0; ii<max_test_input; ii++ ) begin
        val = get_ram0( test_input[ii].addr );
        cnt = val[11:8];
        if( 0==cnt )
           cnt=16;

        addr_b = val[7:0];

        
        for( jj=0; jj<cnt; jj++ ) begin
            val_b = get_ram1( addr_b );
            test_expect[index].data = val_b;
            test_expect[index].delay = 1;
            addr_b++;
            index++;
        end

    end
    max_test_expect = index;

endfunction

endclass





endpackage

//`default_nettype wire