
`timescale 1 ns / 1 ns
`default_nettype none 

import base_test_pkg::*;
import test_case_00_pkg::*;

module tb_07_step2
#(
    parameter  MAX_TIME = 8000
);

logic           reset_p;
logic           clk=0;

type_i_axis                     stream_addr();
type_i_axis #(.WIDTH(16))       stream_data();

type_i_mem_rd   ram0_rd();
type_i_mem_rd   ram1_rd();

type_i_mem_wr   ram0_wr();
type_i_mem_wr   ram1_wr();

logic   [7:0]   tdata;
logic           tvalid;
logic           tready;

logic   [15:0]  data_o_tdata;
logic           data_o_tvalid;
logic           data_o_tready;

logic           fifo_0_overflow;            //! 1 - writing to full FIFO_0 is fixed
logic           fifo_1_overflow;            //! 1 - writing to full FIFO_1 is fixed

logic           init_done;
logic           ram0_init_done=0;
logic           ram1_init_done=0;

test_case_00    test = new(0);
//test_case_00    test = new(1);
//test_case_00    test = new(2);

base_test::type_test_input      test_input;
base_test::type_test_expect     test_expect;

int     cnt_ok=0;
int     cnt_error=0;

logic       stream_data_done = 0;
longint     current_time;

always #5 			clk <= ~clk;

initial begin

    reset_p <=#1 1;

    @(posedge clk iff init_done);
  
    reset_p <= #1 0;
end

assign fifo_0_overflow = credit_07_dut.fifo_w4_overflow;
assign fifo_1_overflow = credit_07_dut.fifo_out_overfow;

 credit_07_step2 
 credit_07_dut 
 (
    .reset_p            (   reset_p         ),
    .clk                (   clk             ),

    .stream_addr        (   stream_addr     ),
    .ram0_rd            (   ram0_rd         ),       
    .ram1_rd            (   ram1_rd         ),

    .stream_data        (   stream_data     )       

 );

cr_ram256x16    ram_a
(
    .reset_p            (   reset_p         ),
    .clk                (   clk             ),
    .mem_wr             (   ram0_wr         ),
    .mem_rd             (   ram0_rd         )
    
);

cr_ram256x16    ram_b
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


assign  data_o_tdata    = stream_data.tdata;
assign  data_o_tvalid   = stream_data.tvalid;
assign  stream_data.tready = data_o_tready;

//! Read and compare output data
initial begin
    data_o_tready <= #1 0;

    @(posedge clk iff init_done);

    #100;

    @(posedge clk);

    for( ; ; ) begin
        test_expect = test.get_expect();
        data_o_tready  <= #1 1;
        @(posedge clk iff (data_o_tready & data_o_tvalid));

        if( data_o_tdata == test_expect.data ) begin
            cnt_ok++;
        end else begin
            if( cnt_error < 16 ) begin
                $display( "ERROR: read: %h   expect: %h", data_o_tdata, test_expect.data );
            end
            cnt_error++;
        end

        if( test_expect.delay>0) begin
            data_o_tready  <= #1 0;
            for( int ii=0; ii<test_expect.delay; ii++ )
             @(posedge clk);
        end
        if( test_expect.last )
            break;


    end

    #500;

    stream_data_done = 1;


end

//! Wait for test finish 
initial begin

    for( ; ; ) begin
    
    current_time = $time ;    
        if( current_time > MAX_TIME )
            break;
        if( 1==stream_data_done )
            break;

        #100;

    end

    $display("Time: %0t", $time);
    if( cnt_ok==test.get_max_expect && 0==cnt_error && 0==fifo_0_overflow && 0==fifo_1_overflow) begin
        $display( "TEST PASSED");
    end else begin
        $display( "TEST FAILED");
    end

end

assign stream_addr.tdata = tdata;
assign stream_addr.tvalid = tvalid;
assign stream_addr.tlast = 0;
assign tready = stream_addr.tready;

//! Create input stream
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


end

endmodule
