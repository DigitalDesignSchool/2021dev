
package transaction_pkg;


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
