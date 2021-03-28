

interface type_i_mem_rd #(parameter WIDTH = 16);
    logic   [WIDTH-1:0]     data;
    logic                   valid;
    logic   [7:0]           addr;
    logic                   read;

    modport master  (
                        output  addr, 
                        output  read, 
                        input   data, 
                        input   valid
                    );


    modport slave  (
                        input   addr, 
                        input   read, 
                        output  data, 
                        output  valid
                    );

    
endinterface 