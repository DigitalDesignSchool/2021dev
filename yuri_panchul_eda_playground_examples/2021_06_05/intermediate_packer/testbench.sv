module tb;

    reg        clock;
    reg        reset;
    reg  [7:0] data_valid;
    reg  [7:0] data;
    wire [7:0] out_data;
    wire       out_data_valid;

    packer i_packer (.*);

    //------------------------------------------------------------------------

    initial
    begin
        clock = 0;

        forever
            # 10 clock = ! clock;
    end

    initial
    begin
        repeat (2) @ (posedge clock);
        reset <= 1;
        repeat (2) @ (posedge clock);
        reset <= 0;
    end

    //------------------------------------------------------------------------

    task display_trace
    (
        input [7:0] expected_out_data,
        input       expected_out_data_valid
    );
    begin
        # 1
        $display ("%d in %b buf %b out %b",
            $time,

              (  data_valid & data )
            | (~ data_valid & 8'bx )
            ,
              (  i_packer.buf_data_valid & i_packer.buf_data )
            | (~ i_packer.buf_data_valid & 8'bx )
            ,
            out_data);
/*
        if (out_data_valid && out_data !== expected_out_data)
            $display ("*** out_data %b !== expected_out_data %b",
                out_data, expected_out_data);

        if (out_data_valid !== expected_out_data_valid)
            $display ("*** out_data_valid %b !== expected_out_data_valid %b",
                out_data_valid, expected_out_data_valid);
*/                
    end
    endtask

    //------------------------------------------------------------------------

    integer i;

    initial
    begin
        $dumpvars;

        @ (negedge reset);
        @ (posedge clock);

        repeat (10) @ (posedge clock);

        repeat (10)  // YURI: I added repetition
        begin
      
        data       <= 8'b1010_1100;
        data_valid <= 8'b1001_1010;

        @ (posedge clock);

        display_trace (8'b0000_0000, 1'b0);

        data       <= 8'b1100_1110;
        data_valid <= 8'b0100_1111;

        @ (posedge clock);

        display_trace (8'b1110_1010, 1'b1);

        data       <= 8'b0;
        data_valid <= 8'b0;

        @ (posedge clock);

        display_trace (8'b0000_0000, 1'b0);
        end

        $finish;
    end

endmodule
