
`timescale 1 ns / 1 ns
`default_nettype none 

//! Example for complex credit
module fifo_w8
#(
    parameter               WIDTH
)    
(
    input   wire                    reset_p,    //! 1 - reset
    input   wire                    clk,        //! clock

    input   wire    [WIDTH-1:0]     data_i,
    input   wire                    data_we,

    output  wire    [WIDTH-1:0]     data_o,
    input   wire                    data_rd,

    output  wire                    prog_full,
    output  wire                    full,
    output  wire                    empty,
    output  reg                     overflow,
    output  reg                     underflow

);

logic   [WIDTH-1:0]         mem[8];

logic   [3:0]               cnt_wr;
logic   [3:0]               cnt_rd;
logic                       rstp;

logic   [3:0]               word_cnt;

logic                       is_write;
logic                       is_read;


assign is_write = ~full & data_we;
assign is_read  = ~empty & data_rd;

always @(posedge clk) begin

    rstp <= #1 reset_p;

    if( is_write ) begin
        mem[cnt_wr[2:0]] <= #1 data_i;
        cnt_wr <= #1 cnt_wr + 1;
    end

    if( is_read ) begin
        cnt_rd <= #1 cnt_rd + 1;
    end

    case( {is_write, is_read} )
        2'b10: word_cnt <= #1 word_cnt + 1; // only write
        2'b01: word_cnt <= #1 word_cnt - 1; // only read

        // others - word_cnt don't change
    endcase

    if( rstp ) begin
        cnt_wr      <= #1 4'b0000;
        cnt_rd      <= #1 4'b0000;
        word_cnt    <= #1 4'b0000;
    end 

end

assign  prog_full = (word_cnt>3) ? 1 : 0;

assign  full    = (cnt_rd[2:0]==cnt_wr[2:0] && cnt_rd[3]!=cnt_wr[3]) ? 1 : 0;
assign  empty   = (cnt_wr==cnt_rd) ? 1 : 0;

assign  data_o  = mem[cnt_rd[2:0]];

always_ff @(posedge clk)
    if( rstp )
        overflow <= #1 '0;
    else
        if( full & data_we )
            overflow <= #1 '1;

always_ff @(posedge clk)
    if( rstp )
        underflow <= #1 '0;
    else
        if( empty & data_rd )
            underflow <= #1 '1;



endmodule

`default_nettype wire 