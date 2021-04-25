
`timescale 1 ns / 1 ns
`default_nettype none 

//! Example for RAM0, RAM1 without credit counter
//!  test_0 will pass
//!  test_1 will fail
//!  test_2 will fail
//!
//! { signal: [
//!     { name: "clk",                wave: 'p....|...'},
//!     { name: "stream_addr.tvalid", wave: '01...|..0.'},
//!     { name: "stream_addr.tready", wave: '0....|.10.'},
//!     { name: "stream_addr.tdata",  wave: 'x3...|..x.', data: 'ADDR'},
//!     { name: "stream_data.tvalid", wave: '01...|..0.'},
//!     { name: "stream_data.tready", wave: '0....|.10.'},
//!     { name: "stream_data.tdata",  wave: 'x4...|..x.', data: 'DATA'}

//! ]}
module credit_07_step1
(
    input   wire            reset_p,    //! 1 - reset
    input   wire            clk,        //! clock

    type_i_axis.slave       stream_addr,            //! Input stream with addr for RAM0

    type_i_mem_rd.master    ram0_rd,                //! Interface for read from RAM0

    type_i_mem_rd.master    ram1_rd,                //! Interface for read from RAM1

    type_i_axis.master      stream_data             //! Output stream with data from RAM1

);

logic               rstp;         //! 1 - reset
logic   [3:0]       rstp_z;       //! 1 - reset, repeat resets
//logic   [3:0]       stp;

logic   [7:0]       tdata;        //! data from stream_addr
logic               tvalid;       //! valid from stream_addr


logic               transaction_ram0_enable;  //! reserved
//logic               transaction_ram1_enable;
logic               transaction_start;        //! 1 - read data from RAM9
//logic   [7:0]       credit_cnt;

logic   [15:0]      ram0_data;                //! data from RAM0
logic               ram0_valid;               //! 1 - valid ram0_data

logic   [15:0]      fifo_w4_data;             //! data from FIFO_0
logic               fifo_w4_data_rd;          //! 1 - read data from FIFO_0
logic               fifo_w4_full;             //! 1 - FIFO_0 is full
logic               fifo_w4_empty;            //! 1 - FIFO_0 is empty
logic               fifo_w4_overflow;         //! 1 - writing to full FIFO_0 is fixed

logic   [7:0]       ram1_addr;                //! address for read from RAM1
logic               ram1_read;                //! 1 - read data from RAM1
logic   [15:0]      ram1_data;                //! data from RAM1
logic               ram1_valid;               //! 1 - valid ram1_data

logic               fifo_out_overfow;         //! 1 - writing to full FIFO_1 is fixe

logic               data_o_tvalid;            //! data from output FIFO
logic               data_o_tready;            //! 1 - ready for reading data from output FIFO

logic               fifo_rd_en;               //! 1 - read data from output FIFO
logic   [15:0]      fifo_dout;                //! Data from output FIFO
logic               fifo_full;                //! 1 - output FIFO is full
logic               fifo_overflow;            //! 1 - writing to full FIFO is fixed
logic               fifo_empty;               //! 1 - output FIFO is empty
logic               fifo_underflow;           //! 1 - reading from empty FIFO is fixed


always @(posedge clk)   begin

    rstp    <= #1 reset_p;
    rstp_z  <= #1 {4{rstp}};

end

assign tdata              = stream_addr.tdata;
assign tvalid             = stream_addr.tvalid;
assign stream_addr.tready = transaction_start;



assign transaction_start = tvalid & transaction_ram0_enable;
assign transaction_ram0_enable = 1;
//assign transaction_ram1_enable = 1;

assign  ram0_rd.addr = tdata;
assign  ram0_rd.read = transaction_start;
assign  ram0_data    = ram0_rd.data;
assign  ram0_valid   = ram0_rd.valid;

assign  ram1_rd.addr = ram1_addr;
assign  ram1_rd.read = ram1_read;
assign  ram1_data    = ram1_rd.data;
assign  ram1_valid   = ram1_rd.valid;



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
  .empty                    (   fifo_empty      ),
  .underflow                (   fifo_underflow  )
);

assign  stream_data.tdata   = fifo_dout;
assign  stream_data.tvalid  = data_o_tvalid;
assign  stream_data.tlast   = 0;

assign  data_o_tvalid       = ~fifo_empty;
assign  data_o_tready       = stream_data.tready;

assign  fifo_rd_en = data_o_tready & data_o_tvalid;


endmodule

`default_nettype wire

