
`default_nettype none


//! Template module for multibank memory
//!
//! { signal: [
//!     { name: "clk",         wave: 'p.............'},
//!     { name: "r_addr",      wave: 'x34..x5x......', data: ['A0', 'A1', 'A2']},
//!     { name: "r_aready",    wave: '010.1..0......'},
//!     { name: "r_avalid",    wave: '01...010......'},
//!     { name: "r_data",      wave: 'x...3x.4x...5x', data: ['D0', 'D1', 'D2']},
//!     { name: "r_dvalid",    wave: '0...10.10...10'},
//!     { name: "w_addr",      wave: 'x34..5...x....', data: ['WA0', 'WA1', 'WA2']},
//!     { name: "w_data",      wave: 'x3x.45...x....', data: ['WD0', 'WD1', 'WD2']},
//!     { name: "w_valid",     wave: '010.1....0....'},
//!     { name: "w_aready",    wave: '01...0..10....'},

//! ]}

module multimemory
  #(
    parameter  REQUESTERS = 3,                    //! Number of ports
    parameter  DATA_WIDTH = 32,                   //! Width of data bus
    parameter  ADDR_WIDTH = 4,                    //! Width of address bus
    localparam ADDR_MAX   = {ADDR_WIDTH{1'b1}}, 	//! 2 ^ ADDR_WIDTH -1 - maximum of address
    localparam DATA_LAT   = 2                     //! ( >1 ) delay in cycles between data request and data output 
)(
    input clk,                                            //! Clock
    input rst,                                            //! 1 - reset

    // read ports
    input  [REQUESTERS-1:0][ADDR_WIDTH-1:0] r_addr,       //! Address for read request
    input  [REQUESTERS-1:0]				          r_avalid,     //! 1 - request for read
    output [REQUESTERS-1:0]				          r_aready,     //! 1 - avaliable for read request
    
    output [REQUESTERS-1:0]     		        r_dvalid,     //! 1 - valid answer for read request
    output [REQUESTERS-1:0][DATA_WIDTH-1:0] r_data,       //! answer for read request
    
    // write ports
    input  [REQUESTERS-1:0][ADDR_WIDTH-1:0] w_addr,       //! Address for write request
    input  [REQUESTERS-1:0][DATA_WIDTH-1:0] w_data,       //! Data for write request
    input  [REQUESTERS-1:0]  			          w_valid,      //! 1 - request for write
    
    output [REQUESTERS-1:0]				          w_ready       //! 1 - avaliable for write request
  );


endmodule

`default_nettype wire