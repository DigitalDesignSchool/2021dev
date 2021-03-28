
`timescale 1 ns / 1 ns
`default_nettype none 

//! RAM1 - imitator
module cr_ram1_engine
(
    input   wire            reset_p,    //! 1 - reset
    input   wire            clk,        //! clock

    input   wire    [15:0]  fifo_data,          //! Numbers of words for read from RAM1
    input   wire            fifo_empty,         //! 1 - FIFO is empty
    output  wire            fifo_rd,            //! 1 - read data from FIFO    

    output  reg     [15:0]  ram1_addr,         //! Address for read from RAM1
    output  reg             ram1_read          //! 1 - read data from RAM1

    
);

logic               rstp;
logic               fifo_rd_enable;
logic               ram1_countinue_read;
logic               addr_sel;
logic   [7:0]       addr_cnt;
logic   [3:0]       cnt;
logic   [3:0]       max_cnt;
logic   [0:0]       stp;


assign  fifo_rd     = ~fifo_empty & fifo_rd_enable;
assign  ram1_read   = ~fifo_empty | ram1_countinue_read;
assign  ram1_addr   =  (addr_sel) ? fifo_data[7:0] : addr_cnt;

always @ (posedge clk) begin

    rstp <= #1 reset_p;

    case( stp )

    0: begin
            fifo_rd_enable <= #1 1;
            ram1_countinue_read <= #1 0;
            addr_sel <= #1 1;

            if( ~fifo_empty && fifo_data[11:8]!=4'b0001 ) begin
                stp <= #1 1;
                fifo_rd_enable <= #1 0;
                ram1_countinue_read <= #1 1;
                addr_sel <= #1 0;
            end

            cnt     <= #1 2;
            max_cnt <= #1 fifo_data[11:8];
            addr_cnt <= #1 fifo_data[7:0] + 1;
    end

    1: begin
            addr_cnt <= #1 addr_cnt + 1;
            cnt <= #1 cnt + 1;
            if( cnt==max_cnt ) begin
                fifo_rd_enable <= #1 1;
                ram1_countinue_read <= #1 0;
                addr_sel <= #1 1;
                stp <= #1 0;
            end 
    end

    endcase


    if( rstp ) begin
        stp <= #1 0;
        fifo_rd_enable <= #1 0;
    end

end




endmodule

`default_nettype wire