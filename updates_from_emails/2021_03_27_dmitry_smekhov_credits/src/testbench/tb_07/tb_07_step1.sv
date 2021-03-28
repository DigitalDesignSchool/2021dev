
`timescale 1 ns / 1 ns
`default_nettype none 

import base_test_pkg::*;
import test_case_00_pkg::*;

module tb_07_step1;

logic           reset_p;
logic           clk=0;

type_i_axis     stream_addr();
type_i_mem_rd   ram0_rd();
type_i_mem_rd   ram1_rd();

type_i_mem_wr   ram0_wr();
type_i_mem_wr   ram1_wr();

logic   [7:0]   tdata;
logic           tvalid;
logic           tready;

logic           fifo_rd_en;             //! 1 - read data from output FIFO
logic   [15:0]  fifo_dout;              //! Data from output FIFO
logic           fifo_full;              //! 1 - output FIFO is full
logic           fifo_overflow;          //! 1 - writing to full FIFO is fixed
logic           fifo_empty;             //! 1 - output FIFO is empty
logic           fifo_underflow;         //! 1 - reading from empty FIFO is fixed
logic   [3:0]   fifo_data_count;        //! Data count in the output FIFO

logic           init_done;
logic           ram0_init_done=0;
logic           ram1_init_done=0;

test_case_00    test = new(0);
//test_case_00    test = new(1);
//test_case_00    test = new(2);

base_test::type_test_input   test_input;


always #5 			clk <= ~clk;

initial begin

    reset_p <=#1 1;

    @(posedge clk iff init_done);
  
    reset_p <= #1 0;
end

// initial begin
     
//      addr <= 8'h00;
//      ap_start <= 0;
     
//      #200;

//     for( int ii=0; ii<16; ii++ ) begin
        
//         @(posedge clk);
//         ap_start <= #1 1;
//         addr <= #1 ii;

//         @(posedge clk iff ap_done);

//         ap_start <= #1 0;
//         addr <= #1 0;

//         @(posedge clk);
//         @(posedge clk);

//     end
// end


 credit_07_step1 
 credit_07_dut 
 (
    .reset_p            (   reset_p         ),
    .clk                (   clk             ),

    .stream_addr        (   stream_addr     ),
    .ram0_rd            (   ram0_rd         ),       
    .ram1_rd            (   ram1_rd         ),       

    .fifo_rd_en         (   fifo_rd_en      ),
    .fifo_dout          (   fifo_dout       ),
    .fifo_full          (   fifo_full       ),
    .fifo_overflow      (   fifo_overflow   ),
    .fifo_empty         (   fifo_empty      ),
    .fifo_underflow     (   fifo_underflow  ),
    .fifo_data_count    (   fifo_data_count )

 );

cr_ram256x16    ram0
(
    .reset_p            (   reset_p         ),
    .clk                (   clk             ),
    .mem_wr             (   ram0_wr         ),
    .mem_rd             (   ram0_rd         )
    
);

cr_ram256x16    ram1
(
    .reset_p            (   reset_p         ),
    .clk                (   clk             ),
    .mem_wr             (   ram1_wr         ),
    .mem_rd             (   ram1_rd         )
    
);

//! Init ram0
initial begin
    ram0_wr.write <= 0;
    #10;

    for( int ii=0; ii<256; ii++ ) begin
        @(posedge clk);
        ram0_wr.write <= #1 1'b1; ram0_wr.addr <= #1 ii;  ram0_wr.data <= #1 test.get_ram0(ii);
    end
    @(posedge clk);
    ram0_wr.write <= #1 1'b0; ram0_wr.addr <= #1 0;  ram0_wr.data <= #1 0;

    @(posedge clk);
    ram0_init_done  <= #1 1;
end

//! Init ram1
initial begin
    ram0_wr.write <= 0;
    #10;

    for( int ii=0; ii<256; ii++ ) begin
        @(posedge clk);
        ram1_wr.write <= #1 1'b1; ram1_wr.addr <= #1 ii;  ram1_wr.data <= #1 test.get_ram1(ii);
    end
    @(posedge clk);
    ram1_wr.write <= #1 1'b0; ram1_wr.addr <= #1 0;  ram1_wr.data <= #1 0;

    @(posedge clk);
    ram1_init_done  <= #1 1;
end

assign init_done = ram0_init_done & ram1_init_done;


initial begin

    fifo_rd_en <= 0;

    for( ; ; ) begin
        @(posedge clk iff ~fifo_empty );
        fifo_rd_en <= #1 1;

        @(posedge clk);
        fifo_rd_en <= #1 0;

    end
     
end

assign stream_addr.tdata = tdata;
assign stream_addr.tvalid = tvalid;
assign stream_addr.tlast = 0;
assign tready = stream_addr.tready;

initial begin

    tdata <= 8'h00;
    tvalid <= 0;


    @(posedge clk iff init_done);

    #100;

    @(posedge clk);

    for( ; ; ) begin
        test_input = test.get_input();
        tdata <= #1 test_input.addr;
        tvalid  <= #1 1;
        @(posedge clk iff tready);
        if( test_input.delay>0) begin
            tdata   <= #1 8'h00;
            tvalid  <= #1 0;
            for( int ii=0; ii<test_input.delay; ii++ )
             @(posedge clk);
        end
        if( test_input.last )
            break;
    end
        tdata   <= #1 8'h00;
        tvalid  <= #1 0;


    // #200;
    // @(posedge clk);
    // tdata   <= #1 8'h01;
    // tvalid  <= #1 1;

    // @(posedge clk iff tready);
    // tdata   <= #1 8'h00;
    // tvalid  <= #1 0;


end

// initial begin

//     test_case_00_gen( clk, stream_addr );
// end


// initial begin

//     test_case_00_check( clk, fifo_out );

// end 

// initial begin

//     test_case_00_init( clk, ram0_wr, ram1_wr );
        
// end 
endmodule
