
package transaction_pkg;


localparam  REQUESTERS = 3;
localparam  DATA_WIDTH = 16;
localparam  ADDR_WIDTH = 16;


typedef struct
{
    logic   [15:0]      addr;
    logic   [15:0]     	data;
    int 		       	delay;

} type_transaction_wr;

typedef struct
{
    logic   [15:0]      addr;
    logic   [15:0]     	data;
    int 		       	delay;

} type_transaction_rd;

typedef struct
{
    logic [ADDR_WIDTH-1:0]  r_addr;
    logic 				    r_avalid;
    logic      		        r_dvalid;
    logic [DATA_WIDTH-1:0]  r_data;
    logic                   r_aready;

    logic [ADDR_WIDTH-1:0]  w_addr;
    logic [DATA_WIDTH-1:0]  w_data;
    logic   			    w_valid;
    logic   		        w_ready;
} type_uut;

// class type_transaction_wr;

 
// 	rand 	int _adr;
// 	rand	int	_data;
// 	rand	int _delay;

// function new( int adr, int data, int delay );

// 	_adr = adr;
// 	_data = data;
// 	_delay = delay;

// endfunction;

// endclass;

// class type_transaction_rd;

// 	rand 	int _adr;
// 	rand	int _delay;

// function new( int adr, int delay );

// 	_adr = adr;
// 	_delay = delay;

// endfunction;

// endclass;


endpackage
