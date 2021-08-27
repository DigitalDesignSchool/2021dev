
package transaction_pkg;


localparam  REQUESTERS = 3;
localparam  DATA_WIDTH = 16;
localparam  ADDR_WIDTH = 16;


//typedef struct
//{
//    logic   [15:0]      addr;
//    logic   [15:0]     	data;
//    int 		       	delay;
//
//} type_transaction_wr;

typedef struct
{
    logic   [15:0]      addr;
    logic   [15:0]     	data;
    int 		       	delay;
    int                 op; // 1 - read, 2 - sync, 3 - exit, 4 - write
    int                 sync_tick;

} type_transaction;

localparam  MAX_TRANSACTION   = 100000;

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

    // int                     r_delay[100000];
    // int                     r_cnt;
    // int                     r_start;
//     int                     r_delay_min;
//     int                     r_delay_max;
//     int                     r_delay_avr;
//     real                    r_velocity;

    // int                     w_delay[100000];
    // int                     w_cnt;
    // int                     w_start;
//     int                     w_delay_min;
//     int                     w_delay_max;
//     int                     w_delay_avr;
//     real                    w_velocity;

} type_uut;


typedef struct
{
    int                     r_delay[100000];
    int                     r_cnt;
    int                     r_start;
    int                     r_delay_min;
    int                     r_delay_max;
    int                     r_delay_avr;
    real                    r_velocity;

    int                     w_delay[100000];
    int                     w_cnt;
    int                     w_start;
    int                     w_delay_min;
    int                     w_delay_max;
    int                     w_delay_avr;
    real                    w_velocity;

} type_stat;

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
