
`timescale 1 ns / 1 ns
`default_nettype none 

//! RAM0 - imitaor
//! { signal: [
//!     { name: "clk",                wave: 'p................'},
//!     { name: "ram0_addr",          wave: 'x3x4x56x.........', data: 'A0 A1 A2 A3'},
//!     { name: "transaction_start",  wave: '010101.0.........'},
//!     { name: "ram1_n",             wave: 'x........3x4x56x.', data: 'D0 D1 D2 D3'},
//!     { name: "ram1_n_vld",         wave: '0........10101.0.'},
//! ]} 
module cr_ram0
(
    input   wire            reset_p,    //! 1 - reset
    input   wire            clk,        //! clock

    input   wire    [7:0]   ram0_addr,          //! address of word
    input   wire            transaction_start,  //! 1 - start of transaction

    output  reg     [3:0]   ram1_n,             //! Numbers of words for read from RAM1
    output  reg             ram1_n_vld          //! 1 - valid data on ram1_n

    
);

logic               rstp;

integer             mem[256];

logic   [3:0]       data_z0;
logic   [3:0]       data_z1;
logic   [3:0]       data_z2;

logic               data_vld_z0;
logic               data_vld_z1;
logic               data_vld_z2;

initial begin
    for( int ii=0; ii<256; ii++)
     mem[ii] = 1;

    mem[0] = 4;
    mem[1] = 15;
    mem[2] = 8;

    mem[6] = 14;
    mem[7] = 12;
    mem[8] = 15;
end

always @ (posedge clk) begin

    rstp <= #1 reset_p;

    data_vld_z0 <= #1 ~rstp & transaction_start;

    data_vld_z1 <= #1 data_vld_z0; 
    data_vld_z2 <= #1 data_vld_z1; 
    ram1_n_vld  <= #1 data_vld_z2; 

    data_z0 <= #1 mem[ram0_addr];

    data_z1 <= #1 data_z0;
    data_z2 <= #1 data_z1;
    ram1_n  <= #1 data_z2;

end


endmodule

`default_nettype wire