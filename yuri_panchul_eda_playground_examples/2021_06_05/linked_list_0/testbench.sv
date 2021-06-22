`define run_tb_switch

`ifdef run_tb_switch

module tb_switch;

    parameter dest_width = 3,
              n_ports    = 1 << dest_width,
              pkt_width  = 64,
              addr_width = 5,
              mem_size   = 1 << addr_width;

    //------------------------------------------------------------------------

    reg                     clock;
    reg                     reset_n;

    wire                    stop_sending_packets;
    wire                    memory_is_full;

    wire                    p0_dest_valid;
    wire [dest_width - 1:0] p0_dest;
    wire                    p0_byte_valid;
    wire [             7:0] p0_byte_data;

    wire                    p0_pkt_valid;
    wire                    p0_pkt_ready;
    wire [pkt_width  - 1:0] p0_pkt;

    wire                    p1_dest_valid;
    wire [dest_width - 1:0] p1_dest;
    wire                    p1_byte_valid;
    wire [             7:0] p1_byte_data;

    wire                    p1_pkt_valid;
    wire                    p1_pkt_ready;
    wire [pkt_width  - 1:0] p1_pkt;

    wire                    p2_dest_valid;
    wire [dest_width - 1:0] p2_dest;
    wire                    p2_byte_valid;
    wire [             7:0] p2_byte_data;

    wire                    p2_pkt_valid;
    wire                    p2_pkt_ready;
    wire [pkt_width  - 1:0] p2_pkt;

    wire                    p3_dest_valid;
    wire [dest_width - 1:0] p3_dest;
    wire                    p3_byte_valid;
    wire [             7:0] p3_byte_data;

    wire                    p3_pkt_valid;
    wire                    p3_pkt_ready;
    wire [pkt_width  - 1:0] p3_pkt;

    wire                    p4_dest_valid;
    wire [dest_width - 1:0] p4_dest;
    wire                    p4_byte_valid;
    wire [             7:0] p4_byte_data;

    wire                    p4_pkt_valid;
    wire                    p4_pkt_ready;
    wire [pkt_width  - 1:0] p4_pkt;

    wire                    p5_dest_valid;
    wire [dest_width - 1:0] p5_dest;
    wire                    p5_byte_valid;
    wire [             7:0] p5_byte_data;

    wire                    p5_pkt_valid;
    wire                    p5_pkt_ready;
    wire [pkt_width  - 1:0] p5_pkt;

    wire                    p6_dest_valid;
    wire [dest_width - 1:0] p6_dest;
    wire                    p6_byte_valid;
    wire [             7:0] p6_byte_data;

    wire                    p6_pkt_valid;
    wire                    p6_pkt_ready;
    wire [pkt_width  - 1:0] p6_pkt;

    wire                    p7_dest_valid;
    wire [dest_width - 1:0] p7_dest;
    wire                    p7_byte_valid;
    wire [             7:0] p7_byte_data;

    wire                    p7_pkt_valid;
    wire                    p7_pkt_ready;
    wire [pkt_width  - 1:0] p7_pkt;

    //------------------------------------------------------------------------

    switch
    # (
        .dest_width ( dest_width ),
        .n_ports    ( n_ports    ),
        .pkt_width  ( pkt_width  ),
        .addr_width ( addr_width ),
        .mem_size   ( mem_size   )
    )
    sw (.*);

    //------------------------------------------------------------------------

    reg  [n_ports    - 1:0] in_dest_valid ;
    reg  [dest_width - 1:0] in_dest       [0:n_ports - 1];

    reg  [n_ports    - 1:0] byte_valid    ;
    reg  [             7:0] byte_data     [0:n_ports - 1];

    wire [n_ports    - 1:0] out_pkt_valid ;
    reg  [n_ports    - 1:0] out_pkt_ready ;
    wire [pkt_width  - 1:0] out_pkt       [0:n_ports - 1];

    //------------------------------------------------------------------------

    always @ (negedge reset_n)
    begin : init_block
        integer i;

        for (i = 0; i < n_ports; i = i + 1)
        begin
            in_dest_valid [i] <= 1'b0;
            in_dest       [i] <= { dest_width { 1'b0 } };
            byte_valid    [i] <= 1'b0;
            byte_data     [i] <= 8'b0;
            out_pkt_ready [i] <= 1'b0;
        end
    end

    //------------------------------------------------------------------------
    //------------------------------------------------------------------------

    assign p0_dest_valid     = in_dest_valid [0] ;
    assign p0_dest           = in_dest       [0] ;

    assign p0_byte_valid     = byte_valid    [0] ;
    assign p0_byte_data      = byte_data     [0] ;

    assign p0_pkt_ready      = out_pkt_ready [0] ;

    assign out_pkt_valid [0] = p0_pkt_valid      ;
    assign out_pkt       [0] = p0_pkt            ;

    //------------------------------------------------------------------------

    assign p1_dest_valid     = in_dest_valid [1] ;
    assign p1_dest           = in_dest       [1] ;

    assign p1_byte_valid     = byte_valid    [1] ;
    assign p1_byte_data      = byte_data     [1] ;

    assign p1_pkt_ready      = out_pkt_ready [1] ;

    assign out_pkt_valid [1] = p1_pkt_valid      ;
    assign out_pkt       [1] = p1_pkt            ;

    //------------------------------------------------------------------------

    assign p2_dest_valid     = in_dest_valid [2] ;
    assign p2_dest           = in_dest       [2] ;

    assign p2_byte_valid     = byte_valid    [2] ;
    assign p2_byte_data      = byte_data     [2] ;

    assign p2_pkt_ready      = out_pkt_ready [2] ;

    assign out_pkt_valid [2] = p2_pkt_valid      ;
    assign out_pkt       [2] = p2_pkt            ;

    //------------------------------------------------------------------------

    assign p3_dest_valid     = in_dest_valid [3] ;
    assign p3_dest           = in_dest       [3] ;

    assign p3_byte_valid     = byte_valid    [3] ;
    assign p3_byte_data      = byte_data     [3] ;

    assign p3_pkt_ready      = out_pkt_ready [3] ;

    assign out_pkt_valid [3] = p3_pkt_valid      ;
    assign out_pkt       [3] = p3_pkt            ;

    //------------------------------------------------------------------------

    assign p4_dest_valid     = in_dest_valid [4] ;
    assign p4_dest           = in_dest       [4] ;

    assign p4_byte_valid     = byte_valid    [4] ;
    assign p4_byte_data      = byte_data     [4] ;

    assign p4_pkt_ready      = out_pkt_ready [4] ;

    assign out_pkt_valid [4] = p4_pkt_valid      ;
    assign out_pkt       [4] = p4_pkt            ;

    //------------------------------------------------------------------------

    assign p5_dest_valid     = in_dest_valid [5] ;
    assign p5_dest           = in_dest       [5] ;

    assign p5_byte_valid     = byte_valid    [5] ;
    assign p5_byte_data      = byte_data     [5] ;

    assign p5_pkt_ready      = out_pkt_ready [5] ;

    assign out_pkt_valid [5] = p5_pkt_valid      ;
    assign out_pkt       [5] = p5_pkt            ;

    //------------------------------------------------------------------------

    assign p6_dest_valid     = in_dest_valid [6] ;
    assign p6_dest           = in_dest       [6] ;

    assign p6_byte_valid     = byte_valid    [6] ;
    assign p6_byte_data      = byte_data     [6] ;

    assign p6_pkt_ready      = out_pkt_ready [6] ;

    assign out_pkt_valid [6] = p6_pkt_valid      ;
    assign out_pkt       [6] = p6_pkt            ;

    //------------------------------------------------------------------------

    assign p7_dest_valid     = in_dest_valid [7] ;
    assign p7_dest           = in_dest       [7] ;

    assign p7_byte_valid     = byte_valid    [7] ;
    assign p7_byte_data      = byte_data     [7] ;

    assign p7_pkt_ready      = out_pkt_ready [7] ;

    assign out_pkt_valid [7] = p7_pkt_valid      ;
    assign out_pkt       [7] = p7_pkt            ;

    //------------------------------------------------------------------------
    //------------------------------------------------------------------------

    initial
    begin
        clock = 0;

        forever
            # 5 clock = ! clock;
    end

   //------------------------------------------------------------------------

    task reset_sequence;
    begin
        repeat (2) @ (posedge clock);
        # 2 reset_n <= 1'b0;
        repeat (2) @ (posedge clock);
        # 3 reset_n <= 1'b1;
        repeat (10) @ (posedge clock);
    end
    endtask

    //------------------------------------------------------------------------

    reg [15:0] cycle;

    always @ (posedge clock or negedge reset_n)
        if (! reset_n)
            cycle <= 16'b0;
        else
            cycle <= cycle + 16'd1;

    //------------------------------------------------------------------------

    task trace_incoming_packets;
        integer i;
    begin
        if (   (sw.in_pkt_valid & sw.in_pkt_ready)
            != { n_ports { 1'b0 } } )
        begin
            $write ("%0d cycle %d packets in:", $time, cycle);

            for (i = 0; i < n_ports; i = i + 1)
            begin
                if (   sw.in_pkt_valid [i]
                    && sw.in_pkt_ready [i] )
                begin
                    $write (" [%0d->%0d] %h",
                        i,
                        sw.in_pkt_dest [i],
                        sw.in_pkt      [i]);
                end
            end

            $display;

            for (i = 0; i < n_ports; i = i + 1)
            begin
                if (   sw.in_pkt_valid [i]
                    && sw.in_pkt_ready [i] )
                begin
                    $write ("%0d cycle %d packet in:", $time, cycle);

                    $display (" from%0d to%0d %h",
                        i,
                        sw.in_pkt_dest [i],
                        sw.in_pkt      [i]);
                end
            end

            $display;
        end        
    end
    endtask

    //------------------------------------------------------------------------

    wire [addr_width - 1:0] a_head_ptr [0:n_ports - 1];
    wire [addr_width - 1:0] a_tail_ptr [0:n_ports - 1];
    wire [addr_width - 1:0] a_length   [0:n_ports - 1];

    generate

        genvar i;

        for (i = 0; i < n_ports; i = i + 1)
        begin
            assign a_head_ptr [i] = sw.llcb [i].llc.head_ptr;
            assign a_tail_ptr [i] = sw.llcb [i].llc.tail_ptr;
            assign a_length   [i] = sw.llcb [i].llc.length;
        end

    endgenerate

    //------------------------------------------------------------------------

    task trace_linked_lists;
        integer i, it;
        reg [addr_width - 1:0] a;
    begin
        for (i = 0; i < n_ports; i = i + 1)
        begin
            if (! sw.a_list_is_empty [i])
            begin
                $write ("%0d cycle %d list%0d size %0d:",
                    $time, cycle, i, );

                a = a_head_ptr [i];

                for (it = 0; it < a_length [i]; it = it + 1)
                begin
                    $write (" [%0d] %h", a, sw.data_ram.data [a]);

                    if (it == a_length [i] - 1 && a != a_tail_ptr [i])
                    begin
                        $display
                        (
                            "\n*** !!! Inconsistent list%0d tail_ptr=%0d !!!",
                            i, a_tail_ptr [i]
                        );

                        $finish;
                    end

                    a = sw.next_ram.data [a];
                end

                $display;
            end
        end
    end
    endtask

    //------------------------------------------------------------------------

    localparam [addr_width - 1:0] last_addr = { addr_width { 1'b1 } };

    task trace_free_linked_list;
        reg [addr_width - 1:0] a;
        integer n_iter;
    begin
        $write ("%0d cycle %d free list:", $time, cycle);

        if (sw.fllc.free_ptr == last_addr)
            $write (" <empty>");

        n_iter = 0;

        for ( a  = sw.fllc.free_ptr;
              a != last_addr;
              a  = sw.free_ram.data [a] )
        begin
            $write (" %0d", a);

            n_iter = n_iter + 1;

            if (n_iter > mem_size)
            begin
                $display ("\n*** !!! Loop detected !!! ***");
                $finish;
            end
        end

        $display;
    end
    endtask

    //------------------------------------------------------------------------

    task trace_outcoming_packets;
        integer i;
    begin
        if (   (out_pkt_valid & out_pkt_ready)
            != { n_ports { 1'b0 } } )
        begin
            $write ("%0d cycle %d packets out:", $time, cycle);

            for (i = 0; i < n_ports; i = i + 1)
                if (out_pkt_valid [i] && out_pkt_ready [i])
                    $write (" to%0d %h", i, out_pkt [i]);

            $display;

            for (i = 0; i < n_ports; i = i + 1)
            begin
                if (out_pkt_valid [i] && out_pkt_ready [i])
                begin
                    $write ("%0d cycle %d packet out:", $time, cycle);
                    $display (" to%0d %h", i, out_pkt [i]);
                end
            end

            $display;
        end        
    end
    endtask

    //------------------------------------------------------------------------

    always @ (posedge clock)
    begin
        trace_incoming_packets;
        trace_linked_lists;
        trace_free_linked_list;
        trace_outcoming_packets;

        if (stop_sending_packets)
            $display ("*** !!! stop sending packets ***");

        if (memory_is_full)
            $display ("*** !!! memory is full ***");
    end

    //------------------------------------------------------------------------

    task set_destinations
    (
        input [n_ports * 4 - 1: 0] destinations
    );
        integer i;
    begin
        in_dest_valid <= { n_ports { 1'b1 } };

        for (i = 0; i < n_ports; i = i + 1)
            in_dest [i] <= destinations [i * 4 +: dest_width];

        @ (posedge clock);

        in_dest_valid <= { n_ports { 1'b0 } };
    end
    endtask

    //------------------------------------------------------------------------

    reg [3:0] counter_of_sent_bytes;

    always @ (negedge reset_n)
        counter_of_sent_bytes <= 4'h1;

    //------------------------------------------------------------------------

    task send_bytes
    (
        input [n_ports - 1: 0] sources
    );
        integer i;
        reg [7:0] b;
    begin
        byte_valid <= sources;

        for (i = 0; i < n_ports; i = i + 1)
        begin
            b [7:4] = i;
            b [3:0] = counter_of_sent_bytes;

            byte_data [i] <= b;
        end

        if (counter_of_sent_bytes == 4'hf)
            counter_of_sent_bytes <= 4'h1;
        else
            counter_of_sent_bytes <= counter_of_sent_bytes + 4'h1;

        @ (posedge clock);

        byte_valid <= { n_ports { 1'b0 } };
    end
    endtask

     //------------------------------------------------------------------------

    task apply_out_ready_sequences
    (
        input [n_ports * 4 - 1: 0] out_ready_sequences
    );
        integer shift, i;
    begin
        for (shift = 0; shift < 4; shift = shift + 1)
        begin
            for (i = 0; i < n_ports; i = i + 1)
                out_pkt_ready [i] <= out_ready_sequences [i * 4 + shift];

            @ (posedge clock);
        end

        byte_valid <= { n_ports { 1'b0 } };
    end
    endtask

    //------------------------------------------------------------------------

    task initialize_free_memory;
        integer i;
    begin
        // TODO: This functionality should be
        // implemented in RTL rather than in testbench

        for (i = 0; i < mem_size; i = i + 1)
            sw.free_ram.data [i] = i + 1;
    end
    endtask

    //------------------------------------------------------------------------

    task test
    (
        input [             15:0] n_cycles,
        input [n_ports     - 1:0] sources,
        input [n_ports * 4 - 1:0] destinations,
        input [n_ports * 4 - 1:0] out_ready_sequences
    );
    begin
        $display ("*** %m destinations %h out_ready_sequences %h ***",
            destinations, out_ready_sequences);

        initialize_free_memory;
        reset_sequence;
        set_destinations (destinations);

        fork
            repeat (n_cycles)
                send_bytes (sources);

            repeat (n_cycles / 4)
                apply_out_ready_sequences (out_ready_sequences);
        join
    end
    endtask

    //------------------------------------------------------------------------

    initial
    begin
        $dumpvars;

        // $display ("*** Nothing ***");
        // test (100, 8'b0000_0000, 32'h0000_0000, 32'h0000_0000);

        // $display ("*** From port 0 to port 1, no output ***");
        // test (100, 8'b0000_0001, 32'h0000_0001, 32'h0000_000);

        // $display ("*** From port 0 to port 0, no backpressure ***");
        // test (100, 8'b0000_0001, 32'h0000_0000, 32'h0000_000f);

        $display ("*** 0->1, 1->2, 2,3,4,5,6,7->3, no backpressure ***");
        test (100, 8'b1111_1111, 32'h3333_3310, 32'hffff_ffff);

        // $display ("*** 0->1, 1->2, 2,3,4,5,6,7->3, no output ***");
        // test (100, 8'b1111_1111, 32'h3333_3310, 32'h0000_0000);

        // $display ("*** 0->1, 1->2, 2,3,4,5,6,7->3, no backpressure ***");
        // test (100, 8'b1111_1111, 32'h3333_3310, 32'hffff_ffff);

        // $display ("*** From port 0 to port 1, no output ***");
        // test (100, 8'b0000_0001, 32'h0000_0001, 32'h0000_0000);

        // $display ("*** Let it drain ***");
        // test (100, 8'b0000_0000, 32'h0000_0000, 32'hffff_ffff);

        // $display ("*** 0->1, 1->2, no backpressure ***");
        // test (100, 8'b0000_0011, 32'h0000_0012, 32'h0000_0010);

        $finish;
    end

endmodule

`endif
//
// This is not the main testbench. For the main testbench see tb_switch.v

`define no_run_tb_bytes_to_pkt

`ifdef run_tb_bytes_to_pkt

module tb_bytes_to_pkt;

    reg         clock;
    reg         reset_n;

    reg         in_dest_valid;
    reg  [ 2:0] in_dest;
    wire [ 2:0] out_dest;

    reg         byte_valid;
    reg  [ 7:0] byte_data;

    wire        pkt_valid;
    reg         pkt_ready;
    wire [63:0] pkt;

    //------------------------------------------------------------------------

    bytes_to_pkt i_bytes_to_pkt (.*);

    //------------------------------------------------------------------------

    initial
    begin
        clock = 1'b0;

        forever
            # 5 clock = ! clock;
    end

    //------------------------------------------------------------------------

    task test
    (
        input [4:0] pkt_ready_once_in_n_cycles,
        input [4:0] cycle_offset,
        input       rand_byte_valid
    );
        integer data, cycle, n_pkts;
    begin
        $write ("Testing with packet ready once every %0d cycles",
            pkt_ready_once_in_n_cycles);

        $write (" with offset %0d cycles", cycle_offset);

        if (rand_byte_valid)
            $display (" and byte_valid randomization");
        else
            $display (" and no byte_valid randomization");

        byte_valid <= 1'b0;
        pkt_ready  <= 1'b1;

        repeat (2) @ (posedge clock);
        reset_n <= 1'b0;
        repeat (2) @ (posedge clock);
        reset_n <= 1'b1;

        repeat (10) @ (posedge clock);

        n_pkts = 0;

        fork
            for (data = 0; data < 256; data = data + 1)
            begin
                if (rand_byte_valid)
                begin
                    byte_valid <= 1'b0;

                    while ($urandom & 1)
                        @ (posedge clock);
                end

                byte_valid <= 1'b1;
                byte_data  <= data;

                @ (posedge clock);
            end

            for (cycle = 0; cycle < 1024 && n_pkts < 3; cycle = cycle + 1)
            begin
                pkt_ready
                    <= ((cycle + cycle_offset)
                        % pkt_ready_once_in_n_cycles
                            == 0);

                @ (posedge clock);

                if (pkt_valid && pkt_ready)
                begin
                    $display ("Packet: %h", pkt);
                    n_pkts ++;
                end
            end
        join
    end
    endtask

    //------------------------------------------------------------------------

    integer i;

    initial
    begin
        $dumpvars;

        // pkt_ready always 1, no rand_byte_valid

        test (5'd1, 5'd0, 1'b0);

        // pkt_ready always 1, rand_byte_valid

        test (5'd1, 5'd0, 1'b1);

        // pkt_ready every N cycles

        for (i = 0; i < 8; i = i + 1)
            test (5'd8, i, 1'b0);

        for (i = 0; i < 9; i = i + 1)
            test (5'd9, i, 1'b0);

        $finish;
    end

endmodule

`endif
