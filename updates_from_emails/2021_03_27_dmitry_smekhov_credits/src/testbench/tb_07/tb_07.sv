
`timescale 1 ns / 1 ns
`default_nettype none 

module tb_07;

logic           reset_p;
logic           clk=0;
logic           ap_start;
logic           ap_done;
logic   [7:0]   addr;

logic           fifo_rd_en;             //! 1 - read data from output FIFO
logic   [15:0]  fifo_dout;              //! Data from output FIFO
logic           fifo_full;              //! 1 - output FIFO is full
logic           fifo_overflow;          //! 1 - writing to full FIFO is fixed
logic           fifo_empty;             //! 1 - output FIFO is empty
logic           fifo_underflow;         //! 1 - reading from empty FIFO is fixed
logic   [3:0]   fifo_data_count;        //! Data count in the output FIFO

always #5 			clk <= ~clk;

initial begin
    reset_p <=#1 1;

    #100;
    reset_p <= #1 0;
end

initial begin
     
     addr <= 8'h00;
     ap_start <= 0;
     
     #200;

    for( int ii=0; ii<16; ii++ ) begin
        
        @(posedge clk);
        ap_start <= #1 1;
        addr <= #1 ii;

        @(posedge clk iff ap_done);

        ap_start <= #1 0;
        addr <= #1 0;

        @(posedge clk);
        @(posedge clk);

    end
end


 credit_07 
 credit_07_dut 
 (
    .reset_p            (   reset_p         ),
    .clk                (   clk             ),
    .ap_start           (   ap_start        ),
    .ap_done            (   ap_done         ),
    .addr               (   addr            ),

    .fifo_rd_en         (   fifo_rd_en      ),
    .fifo_dout          (   fifo_dout       ),
    .fifo_full          (   fifo_full       ),
    .fifo_overflow      (   fifo_overflow   ),
    .fifo_empty         (   fifo_empty      ),
    .fifo_underflow     (   fifo_underflow  ),
    .fifo_data_count    (   fifo_data_count )

 );

initial begin

    fifo_rd_en <= 0;

    for( ; ; ) begin
        @(posedge clk iff ~fifo_empty );
        fifo_rd_en <= #1 1;

        @(posedge clk);
        fifo_rd_en <= #1 0;

    end
     
end

endmodule
