

interface type_i_axis #(parameter WIDTH = 8);
    logic   [WIDTH-1:0]     tdata;
    logic                   tvalid;
    logic                   tlast;
    logic                   tready;

    modport master  (
                        output  tdata, 
                        output  tvalid, 
                        output  tlast, 
                        input   tready
                    );


    modport slave  (
                        input   tdata, 
                        input   tvalid, 
                        input   tlast, 
                        output  tready
                    );

    
endinterface 