
`timescale 1 ns / 1 ns
`default_nettype none 

//! Example for complex credit
module tb_fifo_256;


logic               reset_p;
logic               clk=0;
logic   [255:0]     data_i;
logic   [15:0]      data_o;
logic               data_we;
logic               data_rd;
logic   [3:0]       size_i;
logic               full;
logic               empty;

logic   [4:0]       size_x;


always #5 			clk <= ~clk;

assign size_i  = size_x[3:0];
int                 index_wr=0;
int                 index_rd=0;
int                 cnt_ok=0;
int                 cnt_error=0;

initial begin

    data_we <= 0;
    size_x  <= 3;
    reset_p <=#1 1;

    //@(posedge clk iff init_done);
  
    #201;
    reset_p <= #1 0;

    @(posedge clk);
    data_we <= #1 1;
    for( int ii=0; ii<20; ii++  ) begin
        for( int jj=0; jj<size_x; jj++ ) begin
            data_i[jj*16+:16] <= #1 16'h0A00 + index_wr;
            index_wr++;
        end
        for( int jj=size_x; jj<16; jj++ )
            data_i[jj*16+:16] <= #1 0;
        @(posedge clk);
        #1;
        size_x++;
        if( 17==size_x )
            size_x=1;

    end

    data_we <= #1 0;
end

initial begin
    data_rd <= 0;

    @(posedge clk iff ~reset_p);

    #1000;

    for( ; ; ) begin
        @(posedge clk iff ~empty );
        data_rd <= #1 1;
        if( data_o == (16'h0A00+index_rd))
            cnt_ok++;
        else 
            cnt_error++;

        index_rd++;

        @(posedge clk);
        data_rd <= #1 0;

    end
end
  fifo_256 
  fifo_256_dut (
    .reset_p        (   reset_p ),
    .clk            (   clk     ),
    .data_i         (   data_i  ),
    .size_i         (   size_i  ),
    .data_we        (   data_we ),
    .data_o         (   data_o  ),
    .data_rd        (   data_rd ),
    .full           (   full    ),
    .empty          (   empty   )
  );




endmodule

`default_nettype wire