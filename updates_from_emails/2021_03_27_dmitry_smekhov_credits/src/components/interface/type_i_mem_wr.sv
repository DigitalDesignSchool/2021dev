

interface type_i_mem_wr #(parameter WIDTH = 16);
    logic   [WIDTH-1:0]     data;
    logic                   valid;
    logic   [7:0]           addr;
    logic                   write;

    modport master  (
                        output  addr, 
                        output  write, 
                        output  data 
                    );


    modport slave  (
                        input   addr, 
                        input   write, 
                        input   data 
                    );

endinterface 