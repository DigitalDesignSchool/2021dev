
`timescale 1 ns / 1 ns
`default_nettype none 

//! RAM1 - imitator
//! { signal: [
//!     { name: "clk",           wave: 'p................'},
//!     { name: "ram1_n",        wave: 'x3x...4x.........', data: '2 4 '},
//!     { name: "ram1_n_vld",    wave: '010...10.........'},
//!     { name: "ram1_d",        wave: 'x..33x..4444x....', data: 'C0 C1 D0 D1 D2 D3'},
//!     { name: "ram1_d_vld",    wave: '0..1.0..1...0....'}
//! ]} 
module cr_ram1
(
    input   wire            reset_p,    //! 1 - reset
    input   wire            clk,        //! clock

    input   wire    [3:0]   ram1_n,             //! Numbers of words for read from RAM1
    input   wire            ram1_n_vld,         //! 1 - valid data on ram1_n

    output  reg     [15:0]  ram1_d,             //! Data from RAM1
    output  reg             ram1_d_vld          //! 1 - valid data on ram1_d

    
);

logic               rstp;


logic   [15:0]       data_z0;
logic   [15:0]       data_z1;
logic   [15:0]       data_z2;

logic               data_vld_z0;
logic               data_vld_z1;
logic               data_vld_z2;

integer             pkg_cnt;



always @ (posedge clk) begin

    rstp <= #1 reset_p;

    data_vld_z1 <= #1 data_vld_z0; 
    data_vld_z2 <= #1 data_vld_z1; 
    ram1_d_vld  <= #1 data_vld_z2; 

    data_z1 <= #1 data_z0;
    data_z2 <= #1 data_z1;
    ram1_d  <= #1 data_z2;



end

initial begin
   
   logic [15:0] val;
   integer cnt;

   pkg_cnt = 0;

   data_z0 <= 0;
   data_vld_z0 <= 0;

   for( ; ; ) begin

        @(posedge clk iff (~rstp & ram1_n_vld));

        cnt = ram1_n;

        for( int ii=0; ii<cnt; ii++ ) begin
            val = 16'hA000 + pkg_cnt * 256;
            @(posedge clk);
            data_vld_z0 <= #1 1;
            data_z0 <= #1 val + ii;
        end
        
        @(posedge clk);
        data_vld_z0 <= #1 0;
        data_z0 <= #1 0;
    
        pkg_cnt++;


   end

end


endmodule

`default_nettype wire