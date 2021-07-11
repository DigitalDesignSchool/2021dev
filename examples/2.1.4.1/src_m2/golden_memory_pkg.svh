
package golden_memory_pkg;


class golden_memory_t;


localparam  REQUESTERS = 3;
localparam  DATA_WIDTH = 16;
localparam  ADDR_WIDTH = 16;

typedef struct
{
    logic   [DATA_WIDTH-1:0]     	data_curr [REQUESTERS-1:0];
    logic   [DATA_WIDTH-1:0]     	data_last [REQUESTERS-1:0];
	int 						    tick_curr [REQUESTERS-1:0];
	int 						    tick_last [REQUESTERS-1:0];

} type_mem;

type_mem  mem[ 2 ** ADDR_WIDTH-1:0];


logic [DATA_WIDTH-1:0]  		memory[REQUESTERS*2-1:0];

function new();
	for( int ii=0; ii< 2**ADDR_WIDTH; ii++ ) begin
		for( int jj=0; jj<REQUESTERS; jj++ ) begin
			mem[ii].data_curr[jj]=0;
			mem[ii].data_last[jj]=0;
			mem[ii].tick_curr[jj]=0;
			mem[ii].tick_last[jj]=0;
		end

		mem[ii].data_curr[0]=ii;
		mem[ii].tick_curr[0]=10;

	end

endfunction

function write_mem(

	input int 						tick_current,
	input int 						port,
	input logic [ADDR_WIDTH-1:0]	addr,
	input logic [DATA_WIDTH-1:0]	data
);

	int ii=addr;
	mem[ii].data_last[port] = mem[ii].data_curr[port];
	mem[ii].tick_last[port] = mem[ii].tick_curr[port];

	mem[ii].data_curr[port] = data;
	mem[ii].tick_curr[port] = tick_current;

endfunction

function get_data(
	input int 										tick_current,
	input int 										port,
	input  logic [ADDR_WIDTH-1:0]					addr,
	output logic [2*REQUESTERS-1:0]					mask_avaliable,
	output logic [2*REQUESTERS-1:0][DATA_WIDTH-1:0]	data

);

int tick_max=0;
int port_tick_max=0;

type_mem  m = mem[addr];
mask_avaliable[2*REQUESTERS-1:0] = '0;


	for( int ii=0; ii<REQUESTERS; ii++ ) begin
		if( m.tick_curr[ii] >tick_max ) begin
			tick_max = m.tick_curr[ii];
			port_tick_max = ii;
		end 
		data[ii] = 0;
		data[REQUESTERS+ii]=0;
	end

	mask_avaliable[port_tick_max] = '1; // first value;
	data[port_tick_max] = m.data_curr[port_tick_max];

	// check write data at same time
	for( int ii=0; ii<REQUESTERS; ii++ ) begin
		if( ii==port_tick_max )
			continue;

		if( (tick_max-m.tick_curr[ii]) < 4 ) begin
			mask_avaliable[ii] = '1; // first value;
			data[ii] = m.data_curr[ii];
		end 
	end

	// compare time for write data and time for read data
	for( int ii=0; ii<REQUESTERS; ii++ ) begin

		if( tick_current-m.tick_curr[ii] < 5 ) begin
			mask_avaliable[REQUESTERS+ii] = '1; // first value;
			data[REQUESTERS+ii] = m.data_last[ii];
		end 
	end


endfunction




endclass



endpackage
