
`timescale 1 ns / 1 ns
`default_nettype none 

//! Example for complex credit
module fifo_256
#(
    parameter               DEPTH=16
)    
(
    input   wire                    reset_p,    //! 1 - reset
    input   wire                    clk,        //! clock

    input   wire    [255:0]         data_i,     //! данные, от 1 до 16 слов по 16 бит
    input   wire    [3:0]           size_i,     //! число слов на data_i, 0 - 16 слов
    input   wire                    data_we,    //! 1 - запись size_i слов с шины data_i

    output  wire    [15:0]          data_o,     //! данные для чтения
    input   wire                    data_rd,    //! 1 - чтение данных

    output  wire                    full,
    output  wire                    empty

);

logic   [255:0]             mem[16];

logic   [7:0]               cnt_wr;
logic   [7:0]               cnt_wr_next;
logic   [7:0]               cnt_rd;
logic                       rstp;


logic   [4:0]               start_word;

logic   [255:0]             data_x;
logic   [255:0]             data_z;
logic   [255:0]             data_x_z;

logic   [15:0]              data_we_step;
logic   [15:0]              data_we_step_0;
logic   [15:0]              data_we_step_1;
logic   [8:0]               word_cnt;

logic   [15:0]              data_we_step_0_i;
logic   [15:0]              data_we_step_1_i;
logic   [15:0]              data_we_step_1_z;

logic   [3:0]               ostatok_word;
logic   [3:0]               ostatok_i;
logic   [3:0]               start_word_z;
logic   [4:0]               size_x;
logic   [4:0]               size_z;

always_comb begin

    if( 0==size_i )
        size_x <= 5'd16;
    else
        size_x <= {1'b0, size_i};

    for( int ii=0; ii<start_word; ii++ )
        data_x[ii*16+:16] = data_z[(ostatok_word+ii)*16+: 16];
    for( int ii=start_word; ii<16; ii++ )
        data_x[ii*16+:16] = data_i[(ii-start_word)*16+ : 16];

    for( int ii=0; ii<16; ii++ ) begin
        data_we_step_0_i[ii] <= ( ii>=(start_word) && ii<(start_word+size_x)) ? 1 : 0;
        data_we_step_1_i[ii] <= ( (ii+16)<(start_word+size_x)) ? 1 : 0;
    end 

end

assign data_we_step = data_we_step_0_i | data_we_step_1;

assign start_word = { 1'b0, cnt_wr[3:0]};

assign ostatok_i = start_word + size_i;

always @(posedge clk) begin

    ostatok_word <= #1 size_i - ostatok_i;
    start_word_z <= #1 start_word[3:0];
    size_z       <= #1 size_x;

    if( data_we ) begin
        //start_word[3:0] <= #1 start_word[3:0] + size_i;
        cnt_wr <= #1 cnt_wr + size_x;
    end;

    data_we_step_0 <= #1 data_we_step_0_i & {16{data_we}};
    data_we_step_1 <= #1 data_we_step_1_i & {16{data_we}};

    data_we_step_1_z <= #1 data_we_step_1;

    data_z <= #1 data_i;
    data_x_z <= #1 data_x;

    for( int ii=0; ii<16; ii++ ) begin
        if( data_we_step[ii] )
            mem[cnt_wr[7:4]][ii*16+:16] <= #1 data_x[ii*16+:16];
    end



    rstp <= #1 reset_p;

    // if( ~full & data_we ) begin
    //     mem[cnt_wr] <= #1 data_i;
    //     cnt_wr_next <= #1 cnt_wr_next + 1;
    //     cnt_wr <= #1 cnt_wr_next;
    // end

    if( data_rd ) begin
        cnt_rd <= #1 cnt_rd + 1;
    end

    if( data_we && ~data_rd )
        word_cnt <= #1 word_cnt + size_i;
    else if( ~data_we && data_rd )
        word_cnt <= #1 word_cnt - 1;
    else if( data_we && data_rd ) 
        word_cnt <= #1 word_cnt + size_i - 1;

    if( rstp ) begin
        cnt_wr      <= # 8'b00;
        //cnt_wr_next <= # 8'b01;
        cnt_rd      <= # 8'b00;
        word_cnt    <= # 9'b0;
    end 

end

//assign  full    = (cnt_wr_next==cnt_rd) ? 1 : 0;
assign  full    = (word_cnt>(256-16)) ? 1 : 0;
assign  empty   = (cnt_wr==cnt_rd) ? 1 : 0;

assign  data_o  = mem[cnt_rd[7:4]][cnt_rd[3:0]*16+:16];

endmodule

`default_nettype wire 