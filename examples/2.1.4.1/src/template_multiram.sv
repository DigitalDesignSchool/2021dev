
`default_nettype none


//! Template module for multibank memory
//!
//! { signal: [
//!     { name: "clk",          wave: 'p.............'},
//!     { name: "rx_addr",      wave: 'x34..x5x......', data: ['A0', 'A1', 'A2']},
//!     { name: "rx_aready",    wave: '010.1..0......'},
//!     { name: "rx_valid",     wave: '01...010......'},
//!     { name: "rx_data",      wave: 'x...3x.4x...5x', data: ['D0', 'D1', 'D2']},
//!     { name: "rx_valid",     wave: '0...10.10...10'},
//!     { name: "wx_addr",      wave: 'x34..x5x......', data: ['WA0', 'WA1', 'WA2']},
//!     { name: "wx_data",      wave: 'x3x.45...x....', data: ['WD0', 'WD1', 'WD2']},
//!     { name: "wx_valid",     wave: '010.1....0....'},
//!     { name: "wx_aready",    wave: '01...0..10....'},

//! ]}

module template_multiram
# (
  parameter na = 16,    //! Width of address bus
  parameter nd = 16     //! Width of data bus
)
(
    input   wire            clk,        //! clock
    input   wire            reset_n,    //! 0 - async reset

    input   wire [na-1:0]   r0_addr;    //! address for read
    input   wire            r0_avalid;  //! 1 - request for read
    output  wire            r0_aready;  //! 1 - ready for read
    output  wire [nd-1:0]   r0_data;    //! data from memory
    output  wire            r0_dvalid;  //! 1 - valid data from memory

    input   wire [na-1:0]   w0_addr;    //! address for write
    input   wire [na-1:0]   w0_data;    //! data for write
    input   wire            w0_valid;   //! 1 - request for write
    output  wire            w0_ready;    //! 1 - ready for write

    input   wire [na-1:0]   r1_addr;    //! address for read
    input   wire            r1_avalid;  //! 1 - request for read
    output  wire            r1_aready;  //! 1 - ready for read
    output  wire [nd-1:0]   r1_data;    //! data from memory
    output  wire            r1_dvalid;  //! 1 - valid data from memory

    input   wire [na-1:0]   w1_addr;    //! address for write
    input   wire [na-1:0]   w1_data;    //! data for write
    input   wire            w1_valid;   //! 1 - request for write
    output  wire            w1_ready;    //! 1 - ready for write

    input   wire [na-1:0]   r2_addr;    //! address for read
    input   wire            r2_avalid;  //! 1 - request for read
    output  wire            r2_aready;  //! 1 - ready for read
    output  wire [nd-1:0]   r2_data;    //! data from memory
    output  wire            r2_dvalid;  //! 1 - valid data from memory

    input   wire [na-1:0]   w2_addr;    //! address for write
    input   wire [na-1:0]   w2_data;    //! data for write
    input   wire            w2_valid;   //! 1 - request for write
    output  wire            w2_ready    //! 1 - ready for write

);



endmodule

`default_nettype wire