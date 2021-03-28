
`timescale 1 ns / 1 ns
`default_nettype none 

//! Example for complex credit
//! { signal: [
//!     { name: "clk",      wave: 'p....|...'},
//!     { name: "ap_start", wave: '01...|..0.'},
//!     { name: "ap_done",  wave: '0....|.10.'},
//!     { name: "addr",     wave: 'x3...|..x.', data: 'ADDR'}
//! ]}
module credit_07_step1
(
    input   wire            reset_p,    //! 1 - reset
    input   wire            clk,        //! clock

    type_i_axis.slave       stream_addr,            //! Input stream with addr for RAM0

    type_i_mem_rd.master    ram0_rd,                //! Interface for read from RAM0

    type_i_mem_rd.master    ram1_rd,                //! Interface for read from RAM1

    output  wire            fifo_ram0_overflow,     //! 1 - writing to full RAM0_FIFO is fixed

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

logic   [7:0]       tdata;
logic               tvalid;


logic               transaction_ram0_enable;
logic               transaction_ram1_enable;
logic               transaction_start;
logic   [7:0]       credit_cnt;

logic   [15:0]      ram0_data;
logic               ram0_valid;

logic   [15:0]      fifo_w4_data;
logic               fifo_w4_data_rd;
logic               fifo_w4_full;
logic               fifo_w4_empty;
logic               fifo_w4_overflow;

logic   [7:0]       ram1_addr;
logic               ram1_read;
logic   [15:0]      ram1_data;
logic               ram1_valid;

logic               fifo_out_overfow;

always @(posedge clk)   begin

    rstp    <= #1 reset_p;
    rstp_z  <= #1 {4{rstp}};

end

assign tdata              = stream_addr.tdata;
assign tvalid             = stream_addr.tvalid;
assign stream_addr.tready = transaction_start;


// always @(posedge clk) begin

//    transaction_start <= #1 tvalid & transaction_ram0_enable & transaction_ram1_enable;

// end

assign transaction_start = tvalid & transaction_ram0_enable & transaction_ram1_enable;
assign transaction_ram0_enable = 1;
assign transaction_ram1_enable = 1;

assign  ram0_rd.addr = tdata;
assign  ram0_rd.read = transaction_start;
assign  ram0_data    = ram0_rd.data;
assign  ram0_valid   = ram0_rd.valid;

assign  ram1_rd.addr = ram1_addr;
assign  ram1_rd.read = ram1_read;
assign  ram1_data    = ram1_rd.data;
assign  ram1_valid   = ram1_rd.valid;



// cr_cnt 
// cr_cnt (
//     .reset_p                (   rstp_z[0]           ),
//     .clk                    (   clk                 ),
//     .transaction_enable     (   transaction_enable  ),
//     .transaction_start      (   transaction_start   ),
//     .ram1_n                 (   ram1_n              ),
//     .ram1_n_vld             (   ram1_n_vld          ),

//     .fifo_rd_en             (   fifo_rd_en          ),

//     .credit_cnt             (   credit_cnt          )
//   );


fifo_w4 
  #(
    .WIDTH                  (   16   )
  )
  fifo_ram0 (
    .reset_p                (   rstp_z[1]           ),
    .clk                    (   clk                 ),
    .data_i                 (   ram0_data           ),
    .data_we                (   ram0_valid          ),
    .data_o                 (   fifo_w4_data        ),
    .data_rd                (   fifo_w4_data_rd     ),
    .full                   (   fifo_w4_full        ),
    .empty                  (   fifo_w4_empty       )
  );

always @(posedge clk) begin

    if( rstp_z[1] ) 
        fifo_w4_overflow <= #1 0;
    else if( fifo_w4_full & ram0_valid )
        fifo_w4_overflow <= #1 1;

    if( rstp_z[3] ) 
        fifo_out_overfow <= #1 0;
    else if( fifo_full & ram1_valid )
        fifo_out_overfow <= #1 1;

end

assign fifo_ram0_overflow = fifo_w4_overflow;
assign fifo_overflow      = fifo_out_overfow;

cr_ram1_engine
cr_ram1_engine
(
    .reset_p                (   rstp_z[2]         ),
    .clk                    (   clk               ),

    .fifo_data              (   fifo_w4_data      ),
    .fifo_empty             (   fifo_w4_empty     ),
    .fifo_rd                (   fifo_w4_data_rd   ),

    .ram1_addr              (   ram1_addr         ),
    .ram1_read              (   ram1_read         )

    
);

fifo_32x16fw
fifo
(
  .clk                      (   clk             ),
  .srst                     (   rstp_z[3]       ),
  .din                      (   ram1_data       ),
  .wr_en                    (   ram1_valid      ),
  .rd_en                    (   fifo_rd_en      ),
  .dout                     (   fifo_dout       ),
  .full                     (   fifo_full       ),
  //.overflow                 (   fifo_overflow   ),
  .empty                    (   fifo_empty      ),
  .underflow                (   fifo_underflow  ),
  .data_count               (   fifo_data_count )
);

endmodule

`default_nettype wire

