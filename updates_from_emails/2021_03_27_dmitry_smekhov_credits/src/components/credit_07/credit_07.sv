
`timescale 1 ns / 1 ns
`default_nettype none 

//! Example for complex credit
//! { signal: [
//!     { name: "clk",      wave: 'p....|...'},
//!     { name: "ap_start", wave: '01...|..0.'},
//!     { name: "ap_done",  wave: '0....|.10.'},
//!     { name: "addr",     wave: 'x3...|..x.', data: 'ADDR'}
//! ]}
module credit_07
(
    input   wire            reset_p,    //! 1 - reset
    input   wire            clk,        //! clock

    input   wire            ap_start,   //! 1 - start of transaction
    output  reg             ap_done,    //! 1 - transaction done

    input   wire    [7:0]   addr,       //! address in the RAM_0

    input   wire            fifo_rd_en,             //! 1 - read data from output FIFO
    output  wire    [15:0]  fifo_dout,              //! Data from output FIFO
    output  wire            fifo_full,              //! 1 - output FIFO is full
    output  wire            fifo_overflow,          //! 1 - writing to full FIFO is fixed
    output  wire            fifo_empty,             //! 1 - output FIFO is empty
    output  wire            fifo_underflow,         //! 1 - reading from empty FIFO is fixed
    output  wire    [3:0]   fifo_data_count         //! Data count in the output FIFO

);

logic               rstp;
logic   [3:0]       rstp_z;
logic   [3:0]       stp;

logic               transaction_enable;
logic               transaction_start;
logic   [7:0]       credit_cnt;

logic   [3:0]       ram1_n;
logic               ram1_n_vld;

logic   [15:0]      ram1_d;
logic               ram1_d_vld;



always @(posedge clk)   begin

    rstp    <= #1 reset_p;
    rstp_z  <= #1 {4{rstp}};

end


always @(posedge clk) begin

    case( stp )
        0:  begin
            ap_done <= #1 0;
            transaction_start <= #1 0;
            if( ap_start & transaction_enable )
                stp <=#1 1;
        end

        1: begin
                stp <= #1 2;
                transaction_start <= #1 1;
        end

        2: begin
                ap_done <= #1 1;
                transaction_start <= #1 0;
                stp <= #1 3;

        end

        3: begin
                ap_done <= #1 0;
                stp <= #1 0;
        end 

    endcase

    if( rstp )
        stp <= #1 0;
end


cr_cnt 
cr_cnt (
    .reset_p                (   rstp_z[0]           ),
    .clk                    (   clk                 ),
    .transaction_enable     (   transaction_enable  ),
    .transaction_start      (   transaction_start   ),
    .ram1_n                 (   ram1_n              ),
    .ram1_n_vld             (   ram1_n_vld          ),

    .fifo_rd_en             (   fifo_rd_en          ),

    .credit_cnt             (   credit_cnt          )
  );


cr_ram0
cr_ram0
(
    .reset_p                (   rstp_z[1]           ),
    .clk                    (   clk                 ),
    .ram0_addr              (   addr                ),
    .transaction_start      (   transaction_start   ),

    .ram1_n                 (   ram1_n              ),
    .ram1_n_vld             (   ram1_n_vld          )

    
);


cr_ram1 
cr_ram1 
(
    .reset_p                (   rstp_z[2]           ),
    .clk                    (   clk                 ),
    .ram1_n                 (   ram1_n              ),
    .ram1_n_vld             (   ram1_n_vld          ),
    .ram1_d                 (   ram1_d              ),
    .ram1_d_vld             (   ram1_d_vld          )
 );

fifo_32x16fw
fifo
(
  .clk                      (   clk             ),
  .srst                     (   rstp_z[3]       ),
  .din                      (   ram1_d          ),
  .wr_en                    (   ram1_d_vld      ),
  .rd_en                    (   fifo_rd_en      ),
  .dout                     (   fifo_dout       ),
  .full                     (   fifo_full       ),
  .overflow                 (   fifo_overflow   ),
  .empty                    (   fifo_empty      ),
  .underflow                (   fifo_underflow  ),
  .data_count               (   fifo_data_count )
);

endmodule

`default_nettype wire

