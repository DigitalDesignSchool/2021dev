
`timescale 1 ns / 1 ns
`default_nettype none 

//! Memory block
module cr_ram256x16
(
    input   wire            reset_p,    //! 1 - reset
    input   wire            clk,        //! clock

    type_i_mem_wr.slave     mem_wr,           
    type_i_mem_rd.slave     mem_rd
    
);

logic               rstp;

logic   [15:0]      mem[256];

logic   [15:0]       data_z0;
logic   [15:0]       data_z1;
logic   [15:0]       data_z2;
logic   [15:0]       data_o;

logic               data_vld_z0;
logic               data_vld_z1;
logic               data_vld_z2;
logic               data_o_vld;

logic   [7:0]       rd_addr;
logic               read;

initial begin
    for( int ii=0; ii<256; ii++ )
        mem[ii] = 0;
end

assign  rd_addr = mem_rd.addr;
assign  read    = mem_rd.read;

assign  mem_rd.data = data_o;
assign  mem_rd.valid = data_o_vld;

always @ (posedge clk) begin

    rstp <= #1 reset_p;

    data_vld_z0 <= #1 ~rstp & read;

    data_vld_z1 <= #1 data_vld_z0; 
    data_vld_z2 <= #1 data_vld_z1; 
    data_o_vld  <= #1 data_vld_z2; 

    data_z0 <= #1 mem[rd_addr];

    data_z1 <= #1 data_z0;
    data_z2 <= #1 data_z1;
    data_o  <= #1 data_z2;

end

always @(posedge clk iff mem_wr.write) begin
    mem[mem_wr.addr] <= #1 mem_wr.data;
end

// function memory_write( integer addr, logic [15:0] data);

//     if( addr>0 && addr<256 )
//         mem[addr] = data;

// endfunction

// assign mem_wr.mem_write = memory_write;

endmodule

`default_nettype wire