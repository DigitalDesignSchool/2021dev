`timescale 1 ns / 1 ns
`default_nettype none 

//! Credit conter
//! { signal: [
//!     { name: "clk",                wave: 'p.....|...'},
//!     { name: "transaction_enable", wave: '01....|..0.'},
//!     { name: "transaction_start",  wave: '0..10.|.10.'},
//!     { name: "credit_cnt",         wave: '34.4.|..3.', data: '0 2 1 0'}
//! ]}

module cr_cnt
(
    input   wire            reset_p,    //! 1 - reset
    input   wire            clk,        //! clock

    output  reg             transaction_enable,     //! 1 - credit is avaliabled, transaction is enabled
    input   wire            transaction_start,      //! 1 - start of transaction

    input   wire    [3:0]   ram1_n,                 //! Numbers of words for read from RAM1
    input   wire            ram1_n_vld,             //! 1 - valid data on ram1_n

    input   wire            fifo_rd_en,             //! 1 - read data from output FIFO

    output  reg [7:0]       credit_cnt              //! count of avaliable credits
    
);

logic               rstp;
logic   [3:0]       stp;

logic   [7:0]       cnt;

logic   [7:0]       delta;
logic   [7:0]       ram1;

always  @(posedge clk)      rstp <= #1 reset_p;

assign  ram1[7:4] = 0;
assign  ram1[3:0] =  ram1_n;

always_comb begin

    if( transaction_start )
        delta = -15;
    else 
        delta = 0;

    if( ram1_n_vld )
        delta += 15 - ram1;

    if( fifo_rd_en )
        delta++;

end

always  @(posedge clk)  begin

    if( rstp )
        cnt <= #1 8'd32;
    else
        cnt <= cnt + delta;


    // if( rstp )
    //     cnt <= #1 8'h08;
    // else if( transaction_start && ~ram1_n_vld)
    //     cnt <= #1 cnt - 15;
    // else if( ~transaction_start && ram1_n_vld)
    //     cnt <= #1 cnt + 15 - ram1_n;
    // else if( transaction_start && ram1_n_vld )
    //     cnt <= #1 cnt - ram1_n;  // cnt -15 + (15 - ram1_n) => cnt - ram1_b



end

    assign transaction_enable = ~ cnt[7];

    assign  credit_cnt = cnt;

endmodule

`default_nettype wire