`define LIST_0_7(a) a [0], a[1], a [2], a [3], a [4], a [5], a [6], a [7]

module switch
# (
    parameter dest_width = 3,
              n_ports    = 1 << dest_width,
              pkt_width  = 64,
              addr_width = 8,
              mem_size   = 1 << addr_width
)
(
    input                     clock,
    input                     reset_n,

    output                    stop_sending_packets,
    output                    memory_is_full,

    input                     p0_dest_valid,
    input  [dest_width - 1:0] p0_dest,
    input                     p0_byte_valid,
    input  [             7:0] p0_byte_data,

    output                    p0_pkt_valid,
    input                     p0_pkt_ready,
    output [pkt_width  - 1:0] p0_pkt,

    input                     p1_dest_valid,
    input  [dest_width - 1:0] p1_dest,
    input                     p1_byte_valid,
    input  [             7:0] p1_byte_data,

    output                    p1_pkt_valid,
    input                     p1_pkt_ready,
    output [pkt_width  - 1:0] p1_pkt,

    input                     p2_dest_valid,
    input  [dest_width - 1:0] p2_dest,
    input                     p2_byte_valid,
    input  [             7:0] p2_byte_data,

    output                    p2_pkt_valid,
    input                     p2_pkt_ready,
    output [pkt_width  - 1:0] p2_pkt,

    input                     p3_dest_valid,
    input  [dest_width - 1:0] p3_dest,
    input                     p3_byte_valid,
    input  [             7:0] p3_byte_data,

    output                    p3_pkt_valid,
    input                     p3_pkt_ready,
    output [pkt_width  - 1:0] p3_pkt,

    input                     p4_dest_valid,
    input  [dest_width - 1:0] p4_dest,
    input                     p4_byte_valid,
    input  [             7:0] p4_byte_data,

    output                    p4_pkt_valid,
    input                     p4_pkt_ready,
    output [pkt_width  - 1:0] p4_pkt,

    input                     p5_dest_valid,
    input  [dest_width - 1:0] p5_dest,
    input                     p5_byte_valid,
    input  [             7:0] p5_byte_data,

    output                    p5_pkt_valid,
    input                     p5_pkt_ready,
    output [pkt_width  - 1:0] p5_pkt,

    input                     p6_dest_valid,
    input  [dest_width - 1:0] p6_dest,
    input                     p6_byte_valid,
    input  [             7:0] p6_byte_data,

    output                    p6_pkt_valid,
    input                     p6_pkt_ready,
    output [pkt_width  - 1:0] p6_pkt,

    input                     p7_dest_valid,
    input  [dest_width - 1:0] p7_dest,
    input                     p7_byte_valid,
    input  [             7:0] p7_byte_data,

    output                    p7_pkt_valid,
    input                     p7_pkt_ready,
    output [pkt_width  - 1:0] p7_pkt
);

    //------------------------------------------------------------------------

    generate

    genvar i;

    //------------------------------------------------------------------------

    wire [n_ports    - 1:0] in_dest_valid ;
    wire [dest_width - 1:0] in_dest       [0:n_ports - 1];

    wire [n_ports    - 1:0] byte_valid    ;
    wire [             7:0] byte_data     [0:n_ports - 1];

    wire [n_ports    - 1:0] in_pkt_valid  ;
    wire [n_ports    - 1:0] in_pkt_ready  ;
    wire [pkt_width  - 1:0] in_pkt        [0:n_ports - 1];

    wire [n_ports    - 1:0] out_pkt_valid ;
    wire [n_ports    - 1:0] out_pkt_ready ;
    wire [pkt_width  - 1:0] out_pkt       [0:n_ports - 1];

    //------------------------------------------------------------------------
    //------------------------------------------------------------------------

    assign in_dest_valid [0] = p0_dest_valid ;
    assign in_dest       [0] = p0_dest       ;
    assign byte_valid    [0] = p0_byte_valid ;
    assign byte_data     [0] = p0_byte_data  ;
    assign out_pkt_ready [0] = p0_pkt_ready  ;

    assign p0_pkt_valid      = out_pkt_valid [0];
    assign p0_pkt            = out_pkt       [0];

    //------------------------------------------------------------------------

    assign in_dest_valid [1] = p1_dest_valid ;
    assign in_dest       [1] = p1_dest       ;
    assign byte_valid    [1] = p1_byte_valid ;
    assign byte_data     [1] = p1_byte_data  ;
    assign out_pkt_ready [1] = p1_pkt_ready  ;

    assign p1_pkt_valid      = out_pkt_valid [1];
    assign p1_pkt            = out_pkt       [1];

    //------------------------------------------------------------------------

    assign in_dest_valid [2] = p2_dest_valid ;
    assign in_dest       [2] = p2_dest       ;
    assign byte_valid    [2] = p2_byte_valid ;
    assign byte_data     [2] = p2_byte_data  ;
    assign out_pkt_ready [2] = p2_pkt_ready  ;

    assign p2_pkt_valid      = out_pkt_valid [2];
    assign p2_pkt            = out_pkt       [2];

    //------------------------------------------------------------------------

    assign in_dest_valid [3] = p3_dest_valid ;
    assign in_dest       [3] = p3_dest       ;
    assign byte_valid    [3] = p3_byte_valid ;
    assign byte_data     [3] = p3_byte_data  ;
    assign out_pkt_ready [3] = p3_pkt_ready  ;

    assign p3_pkt_valid      = out_pkt_valid [3];
    assign p3_pkt            = out_pkt       [3];

    //------------------------------------------------------------------------

    assign in_dest_valid [4] = p4_dest_valid ;
    assign in_dest       [4] = p4_dest       ;
    assign byte_valid    [4] = p4_byte_valid ;
    assign byte_data     [4] = p4_byte_data  ;
    assign out_pkt_ready [4] = p4_pkt_ready  ;

    assign p4_pkt_valid      = out_pkt_valid [4];
    assign p4_pkt            = out_pkt       [4];

    //------------------------------------------------------------------------

    assign in_dest_valid [5] = p5_dest_valid ;
    assign in_dest       [5] = p5_dest       ;
    assign byte_valid    [5] = p5_byte_valid ;
    assign byte_data     [5] = p5_byte_data  ;
    assign out_pkt_ready [5] = p5_pkt_ready  ;

    assign p5_pkt_valid      = out_pkt_valid [5];
    assign p5_pkt            = out_pkt       [5];

    //------------------------------------------------------------------------

    assign in_dest_valid [6] = p6_dest_valid ;
    assign in_dest       [6] = p6_dest       ;
    assign byte_valid    [6] = p6_byte_valid ;
    assign byte_data     [6] = p6_byte_data  ;
    assign out_pkt_ready [6] = p6_pkt_ready  ;

    assign p6_pkt_valid      = out_pkt_valid [6];
    assign p6_pkt            = out_pkt       [6];

    //------------------------------------------------------------------------

    assign in_dest_valid [7] = p7_dest_valid ;
    assign in_dest       [7] = p7_dest       ;
    assign byte_valid    [7] = p7_byte_valid ;
    assign byte_data     [7] = p7_byte_data  ;
    assign out_pkt_ready [7] = p7_pkt_ready  ;

    assign p7_pkt_valid      = out_pkt_valid [7];
    assign p7_pkt            = out_pkt       [7];

    //------------------------------------------------------------------------
    //------------------------------------------------------------------------

    wire [dest_width - 1:0] in_pkt_dest [0:n_ports - 1];
    
    for (i = 0; i < n_ports; i = i + 1)
    begin : b2pb

        bytes_to_pkt b2p
        (
            .clock          ( clock             ),
            .reset_n        ( reset_n           ),

            .in_dest_valid  ( in_dest_valid [i] ),
            .in_dest        ( in_dest       [i] ),
            .out_dest       ( in_pkt_dest   [i] ),

            .byte_valid     ( byte_valid    [i] ),
            .byte_data      ( byte_data     [i] ),

            .pkt_valid      ( in_pkt_valid  [i] ),
            .pkt_ready      ( in_pkt_ready  [i] ),
            .pkt            ( in_pkt        [i] )
        );
    end

    //------------------------------------------------------------------------
    //------------------------------------------------------------------------

    arbiter in_arb
    (
        .clock    ( clock                        ),
        .reset_n  ( reset_n                      ),
        .req      ( in_pkt_valid [n_ports - 1:0] ),
        .comb_gnt ( in_pkt_ready [n_ports - 1:0] )
    );

    //------------------------------------------------------------------------

    wire [n_ports - 1:0] one_hot_in_port_select
        =   in_pkt_valid [n_ports - 1:0]
          & in_pkt_ready [n_ports - 1:0];

    wire [pkt_width  - 1:0] selected_in_pkt;
    wire [dest_width - 1:0] selected_in_pkt_dest;

    selector_8 # (pkt_width) s_selected_in_pkt
    (
        one_hot_in_port_select,
        selected_in_pkt,
        `LIST_0_7 (in_pkt)
    );

    selector_8 # (dest_width) s_selected_in_pkt_dest
    (
        one_hot_in_port_select,
        selected_in_pkt_dest,
        `LIST_0_7 (in_pkt_dest)
    );

    wire selected_in_pkt_valid = | one_hot_in_port_select;

    //------------------------------------------------------------------------

    wire                    data_ram_read_enable;
    wire [addr_width - 1:0] data_ram_read_addr;
    wire [pkt_width  - 1:0] data_ram_read_data;

    wire                    data_ram_write_enable;
    wire [addr_width - 1:0] data_ram_write_addr;
    wire [pkt_width  - 1:0] data_ram_write_data;

    //------------------------------------------------------------------------

    memory
    # (
        .addr_width ( addr_width ),
        .data_width ( pkt_width  )
    )
    data_ram
    (
        .clock        ( clock                 ),
        .reset_n      ( reset_n               ),

        .read_enable  ( data_ram_read_enable  ),
        .read_addr    ( data_ram_read_addr    ),
        .read_data    ( data_ram_read_data    ),

        .write_enable ( data_ram_write_enable ),
        .write_addr   ( data_ram_write_addr   ),
        .write_data   ( data_ram_write_data   )
    );

    //------------------------------------------------------------------------

    wire                    next_ram_read_enable;
    wire [addr_width - 1:0] next_ram_read_addr;
    wire [addr_width - 1:0] next_ram_read_data;

    wire                    next_ram_write_enable;
    wire [addr_width - 1:0] next_ram_write_addr;
    wire [addr_width - 1:0] next_ram_write_data;

    //------------------------------------------------------------------------

    memory
    # (
        .addr_width ( addr_width ),
        .data_width ( addr_width )
    )
    next_ram
    (
        .clock        ( clock                 ),
        .reset_n      ( reset_n               ),

        .read_enable  ( next_ram_read_enable  ),
        .read_addr    ( next_ram_read_addr    ),
        .read_data    ( next_ram_read_data    ),

        .write_enable ( next_ram_write_enable ),
        .write_addr   ( next_ram_write_addr   ),
        .write_data   ( next_ram_write_data   )
    );

    //------------------------------------------------------------------------

    wire                    free_ram_read_enable;
    wire [addr_width - 1:0] free_ram_read_addr;
    wire [addr_width - 1:0] free_ram_read_data;

    wire                    free_ram_write_enable;
    wire [addr_width - 1:0] free_ram_write_addr;
    wire [addr_width - 1:0] free_ram_write_data;

    //------------------------------------------------------------------------

    memory
    # (
        .addr_width ( addr_width ),
        .data_width ( addr_width )
    )
    free_ram
    (
        .clock        ( clock                 ),
        .reset_n      ( reset_n               ),

        .read_enable  ( free_ram_read_enable  ),
        .read_addr    ( free_ram_read_addr    ),
        .read_data    ( free_ram_read_data    ),

        .write_enable ( free_ram_write_enable ),
        .write_addr   ( free_ram_write_addr   ),
        .write_data   ( free_ram_write_data   )
    );

    //------------------------------------------------------------------------

    wire [n_ports - 1:0] one_hot_selector_for_add
        =   ({ { n_ports - 1 { 1'b0 } }, 1'b1 } << selected_in_pkt_dest)
          & { n_ports { selected_in_pkt_valid } };

    //------------------------------------------------------------------------

    wire [n_ports - 1:0] a_list_is_empty;

    wire [n_ports - 1:0] requests_for_remove
        =   ~ a_list_is_empty [n_ports - 1:0]
          &   out_pkt_ready   [n_ports - 1:0];

    wire [n_ports - 1:0] one_hot_grant_for_remove;

    arbiter list_arb
    (
        .clock   ( clock                    ),
        .reset_n ( reset_n                  ),
        .req     ( requests_for_remove      ),
        .gnt     ( one_hot_grant_for_remove )
    );

    // This & one_hot_grant_for_remove is needed
    // if we use a version of dumb arbiter
    // that ignores requests

    wire [n_ports - 1:0] one_hot_selector_for_remove
        =   requests_for_remove
          & one_hot_grant_for_remove;

    //------------------------------------------------------------------------

    wire                    a_data_ram_read_enable  [0:n_ports - 1];
    wire [addr_width - 1:0] a_data_ram_read_addr    [0:n_ports - 1];

    wire                    a_data_ram_write_enable [0:n_ports - 1];
    wire [addr_width - 1:0] a_data_ram_write_addr   [0:n_ports - 1];
    wire [pkt_width  - 1:0] a_data_ram_write_data   [0:n_ports - 1];

    //------------------------------------------------------------------------

    selector_8 # (1) s_data_ram_read_enable
    (
        one_hot_selector_for_remove,
        data_ram_read_enable,
        `LIST_0_7 (a_data_ram_read_enable)
    );

    selector_8 # (addr_width) s_data_ram_read_addr
    (
        one_hot_selector_for_remove,
        data_ram_read_addr,
        `LIST_0_7 (a_data_ram_read_addr)
    );

    selector_8 # (1) s_data_ram_write_enable
    (
        one_hot_selector_for_add,
        data_ram_write_enable,
        `LIST_0_7 (a_data_ram_write_enable)
    );

    selector_8 # (addr_width) s_data_ram_write_addr
    (
        one_hot_selector_for_add,
        data_ram_write_addr,
        `LIST_0_7 (a_data_ram_write_addr)
    );

    selector_8 # (pkt_width) s_data_ram_write_data
    (
        one_hot_selector_for_add,
        data_ram_write_data,
        `LIST_0_7 (a_data_ram_write_data)
    );

    //------------------------------------------------------------------------

    wire                    a_next_ram_read_enable  [0:n_ports - 1];
    wire [addr_width - 1:0] a_next_ram_read_addr    [0:n_ports - 1];

    wire                    a_next_ram_write_enable [0:n_ports - 1];
    wire [addr_width - 1:0] a_next_ram_write_addr   [0:n_ports - 1];
    wire [addr_width - 1:0] a_next_ram_write_data   [0:n_ports - 1];

    //------------------------------------------------------------------------

    selector_8 # (1) s_next_ram_read_enable
    (
        one_hot_selector_for_remove,
        next_ram_read_enable,
        `LIST_0_7 (a_next_ram_read_enable)
    );

    selector_8 # (addr_width) s_next_ram_read_addr
    (
        one_hot_selector_for_remove,
        next_ram_read_addr,
        `LIST_0_7 (a_next_ram_read_addr)
    );

    selector_8 # (1) s_next_ram_write_enable
    (
        one_hot_selector_for_add,
        next_ram_write_enable,
        `LIST_0_7 (a_next_ram_write_enable)
    );

    selector_8 # (addr_width) s_next_ram_write_addr
    (
        one_hot_selector_for_add,
        next_ram_write_addr,
        `LIST_0_7 (a_next_ram_write_addr)
    );

    selector_8 # (addr_width) s_next_ram_write_data
    (
        one_hot_selector_for_add,
        next_ram_write_data,
        `LIST_0_7 (a_next_ram_write_data)
    );

    //------------------------------------------------------------------------

    wire [addr_width - 1:0] free_ptr;
    wire [addr_width - 1:0] a_head_ptr [0:n_ports - 1];

    //------------------------------------------------------------------------

    for (i = 0; i < n_ports; i = i + 1)
    begin : llcb

        linked_list_control
        # (
            .addr_width  ( addr_width ),
            .pkt_width   ( pkt_width  )
        )
        llc
        (
            .clock                  ( clock                           ),
            .reset_n                ( reset_n                         ),

            .add_to_tail            ( one_hot_selector_for_add    [i] ),
            .remove_from_head       ( one_hot_selector_for_remove [i] ),

            .list_is_empty          ( a_list_is_empty             [i] ),

            .free_ptr               ( free_ptr                        ),
            .head_ptr               ( a_head_ptr                  [i] ),

            .in_pkt                 ( selected_in_pkt                 ),

            .out_pkt_valid          ( out_pkt_valid               [i] ),
            .out_pkt                ( out_pkt                     [i] ),

            .data_ram_read_enable   ( a_data_ram_read_enable      [i] ),
            .data_ram_read_addr     ( a_data_ram_read_addr        [i] ),
            .data_ram_read_data     (   data_ram_read_data            ),

            .data_ram_write_enable  ( a_data_ram_write_enable     [i] ),
            .data_ram_write_addr    ( a_data_ram_write_addr       [i] ),
            .data_ram_write_data    ( a_data_ram_write_data       [i] ),

            .next_ram_read_enable   ( a_next_ram_read_enable      [i] ),
            .next_ram_read_addr     ( a_next_ram_read_addr        [i] ),
            .next_ram_read_data     (   next_ram_read_data            ),

            .next_ram_write_enable  ( a_next_ram_write_enable     [i] ),
            .next_ram_write_addr    ( a_next_ram_write_addr       [i] ),
            .next_ram_write_data    ( a_next_ram_write_data       [i] )
        );
    end

    //------------------------------------------------------------------------

    wire [addr_width - 1:0] head_ptr_to_remove;

    selector_8 # (addr_width) s_head_ptr_to_remove
    (
        one_hot_selector_for_remove,
        head_ptr_to_remove,
        `LIST_0_7 (a_head_ptr)
    );

    //------------------------------------------------------------------------

    free_linked_list_control
    # (
        .addr_width ( addr_width ),
        .n_ports    ( n_ports    )
    )
    fllc
    (
        .clock                 (   clock                       ),
        .reset_n               (   reset_n                     ),

        .add_to_tail           ( | one_hot_selector_for_add    ),
        .remove_from_head      ( | one_hot_selector_for_remove ),

        .stop_sending_packets  (   stop_sending_packets        ),
        .list_is_empty         (   memory_is_full              ),

        .free_ptr              (   free_ptr                    ),
        .head_ptr_to_remove    (   head_ptr_to_remove          ),

        .free_ram_read_enable  (   free_ram_read_enable        ),
        .free_ram_read_addr    (   free_ram_read_addr          ),
        .free_ram_read_data    (   free_ram_read_data          ),

        .free_ram_write_enable (   free_ram_write_enable       ),
        .free_ram_write_addr   (   free_ram_write_addr         ),
        .free_ram_write_data   (   free_ram_write_data         )
    );

    endgenerate

endmodule

`undef LIST_0_7
//
// Assumption: I assume that any packet is going to be consumed
// in the next 8 cycles after asserting pkt_valid

module bytes_to_pkt
(
    input             clock,
    input             reset_n,

    input             in_dest_valid,
    input      [ 2:0] in_dest,
    output reg [ 2:0] out_dest,

    input             byte_valid,
    input      [ 7:0] byte_data,

    output reg        pkt_valid,
    input             pkt_ready,
    output reg [63:0] pkt
);

    //------------------------------------------------------------------------

    always @ (posedge clock or negedge reset_n)
        if (! reset_n)
            out_dest <= 3'b0;
        else if (in_dest_valid)
            out_dest <= in_dest;

    //------------------------------------------------------------------------

    reg  [7:0] byte_enables;

    wire [7:0] n_byte_enables

        = byte_valid
            ? { byte_enables [6:0], byte_enables [7] }
            :   byte_enables;

    always @ (posedge clock or negedge reset_n)
        if (! reset_n)
            byte_enables <= 8'b0000_0001;
        else
            byte_enables <= n_byte_enables;

    //------------------------------------------------------------------------

    reg [63 - 8:0] overflow_pkt;

    generate

        // I put per byte enable to save power

        genvar i;

        for (i = 0; i < 8 - 1; i = i + 1)
        begin
            always @ (posedge clock)
                if (byte_enables [i])
                    overflow_pkt [i * 8 +: 8] <= byte_data;
        end

    endgenerate

    //------------------------------------------------------------------------

    wire        pkt_completed      = byte_valid && byte_enables [7];
    wire [63:0] completed_pkt_data = { byte_data, overflow_pkt };

    always @ (posedge clock)
        if (pkt_completed)
            pkt <= completed_pkt_data;

    //------------------------------------------------------------------------

    reg n_pkt_valid;

    always @*
    begin
        n_pkt_valid = pkt_valid;

        if (pkt_valid && pkt_ready)
            n_pkt_valid = 1'b0;

        if (pkt_completed)
            n_pkt_valid = 1'b1;
    end

    always @ (posedge clock or negedge reset_n)
        if (! reset_n)
            pkt_valid <= 1'b0;
        else
            pkt_valid <= n_pkt_valid;

endmodule
//
module linked_list_control
# (
    parameter addr_width  = 8,
              pkt_width   = 64
)
(
    input                         clock,
    input                         reset_n,

    input                         add_to_tail,
    input                         remove_from_head,

    output                        list_is_empty,

    input      [addr_width - 1:0] free_ptr,
    output reg [addr_width - 1:0] head_ptr,

    input      [pkt_width  - 1:0] in_pkt,

    output                        out_pkt_valid,
    output     [pkt_width  - 1:0] out_pkt,

    output                        data_ram_read_enable,
    output     [addr_width - 1:0] data_ram_read_addr,
    input      [pkt_width  - 1:0] data_ram_read_data,

    output                        data_ram_write_enable,
    output     [addr_width - 1:0] data_ram_write_addr,
    output     [pkt_width  - 1:0] data_ram_write_data,

    output                        next_ram_read_enable,
    output     [addr_width - 1:0] next_ram_read_addr,
    input      [addr_width - 1:0] next_ram_read_data,

    output                        next_ram_write_enable,
    output     [addr_width - 1:0] next_ram_write_addr,
    output     [addr_width - 1:0] next_ram_write_data
);

    //------------------------------------------------------------------------

    reg prev_remove_from_head;

    always @ (posedge clock or negedge reset_n)
        if (! reset_n)
            prev_remove_from_head <= 1'b0;
        else
            prev_remove_from_head <= remove_from_head;

    //------------------------------------------------------------------------

    wire [addr_width - 1:0] n_length
        = length + add_to_tail - remove_from_head;

    reg [addr_width - 1:0] length;

    always @ (posedge clock or negedge reset_n)
        if (! reset_n)
            length <= { addr_width { 1'b0 } };
        else
            length <= n_length;

    assign list_is_empty = ~| length;

    //------------------------------------------------------------------------

    always @ (posedge clock)
        if (add_to_tail && list_is_empty)
            head_ptr <= free_ptr;
        else if (prev_remove_from_head)
            head_ptr <= next_ram_read_data;

    //------------------------------------------------------------------------

    reg [addr_width - 1:0] tail_ptr;

    always @ (posedge clock)
        if (add_to_tail)
            tail_ptr <= free_ptr;

    //------------------------------------------------------------------------

    assign out_pkt_valid         = prev_remove_from_head;
    assign out_pkt               = data_ram_read_data;

    assign data_ram_read_enable  = remove_from_head;
    assign data_ram_read_addr    = head_ptr;

    assign data_ram_write_enable = add_to_tail;
    assign data_ram_write_addr   = free_ptr;
    assign data_ram_write_data   = in_pkt;

    assign next_ram_read_enable  = remove_from_head;
    assign next_ram_read_addr    = head_ptr;

    assign next_ram_write_enable = ~ list_is_empty & add_to_tail;
    assign next_ram_write_addr   = tail_ptr;
    assign next_ram_write_data   = free_ptr;

endmodule
//
module free_linked_list_control
# (
    parameter addr_width = 8,
              n_ports    = 8
)
(
    input                         clock,
    input                         reset_n,

    input                         add_to_tail,
    input                         remove_from_head,

    output                        stop_sending_packets,
    output                        list_is_empty,

    output reg [addr_width - 1:0] free_ptr,
    input      [addr_width - 1:0] head_ptr_to_remove,

    output                        free_ram_read_enable,
    output     [addr_width - 1:0] free_ram_read_addr,
    input      [addr_width - 1:0] free_ram_read_data,

    output                        free_ram_write_enable,
    output     [addr_width - 1:0] free_ram_write_addr,
    output     [addr_width - 1:0] free_ram_write_data
);

    //------------------------------------------------------------------------

    localparam [addr_width - 1:0] last_addr = { addr_width { 1'b1 } };

    assign list_is_empty
        = (free_ptr == last_addr);

    assign stop_sending_packets
        = (free_ptr >= last_addr - n_ports * 2);

    //------------------------------------------------------------------------

    reg prev_add_to_tail;

    always @ (posedge clock or negedge reset_n)
        if (! reset_n)
            prev_add_to_tail <= 1'b0;
        else
            prev_add_to_tail <= add_to_tail;

    //------------------------------------------------------------------------

    always @ (posedge clock or negedge reset_n)
        if (! reset_n)
            free_ptr <= { addr_width { 1'b0 } };
        else if (prev_add_to_tail)
            free_ptr <= free_ram_read_data;
        else if (remove_from_head)
            free_ptr <= head_ptr_to_remove;

    //------------------------------------------------------------------------

    assign free_ram_read_enable  = add_to_tail;
    assign free_ram_read_addr    = free_ptr;

    assign free_ram_write_enable = remove_from_head;
    assign free_ram_write_addr   = head_ptr_to_remove;
    assign free_ram_write_data   = free_ptr;

endmodule
//
module memory
# (
    parameter addr_width = 8,
              data_width = 32
)
(
    input                         clock,
    input                         reset_n,

    input                         read_enable,
    input      [addr_width - 1:0] read_addr,
    output reg [data_width - 1:0] read_data,

    input                         write_enable,
    input      [addr_width - 1:0] write_addr,
    input      [data_width - 1:0] write_data
);

    localparam depth = 1 << addr_width;

    reg [data_width - 1:0] data [0:depth - 1];

    always @ (posedge clock)
    begin
        if (write_enable)
            data [write_addr] <= write_data;

        if (read_enable)
        begin
            // TODO: This bypass may not be required

            if (write_enable && read_addr == write_addr)
                read_data <= write_data;
            else
            begin
                read_data <= data [read_addr];
            end
        end
    end

endmodule
//
// I created this arbiter by modifying an arbiter from
// Matt Weber. Arbiters: Design Ideas and Coding Styles. SNUG Boston 2001.

`define no_arbiter_ignore_requests

module arbiter
(
    input            clock,
    input            reset_n,
    input      [7:0] req,
    output reg [7:0] gnt,
    output     [7:0] comb_gnt
);

    `ifdef arbiter_ignore_requests

    always @ (posedge clock or negedge reset_n)
        if (! reset_n)
            gnt <= 8'b1;
        else
            gnt <= { gnt [6:0], gnt [7] };

        assign comb_gnt = gnt;

    `else

    reg  [ 2:0] ptr;

    wire [15:0] shift_req_double = { req, req } >> ptr;
    wire [ 7:0] shift_req = shift_req_double [7:0];

    wire [ 7:0] higher_pri_reqs;

    assign      higher_pri_reqs [7:1] = higher_pri_reqs [6:0] | shift_req [6:0];
    assign      higher_pri_reqs [0]   = 1'b0;

    wire [ 7:0] shift_gnt = shift_req & ~ higher_pri_reqs;

    wire [15:0] n_gnt_double = { shift_gnt, shift_gnt } << ptr;
    wire [ 7:0] n_gnt = n_gnt_double [15:8];

    always @ (posedge clock or negedge reset_n)
        if (! reset_n)
            gnt <= 8'b0;
        else
            gnt <= n_gnt;

    always @ (posedge clock or negedge reset_n)
        if (! reset_n)
            ptr <= 3'b0;
        else
            case (1'b1)  // synopsys parallel_case
            n_gnt [0]: ptr <= 3'd1;
            n_gnt [1]: ptr <= 3'd2;
            n_gnt [2]: ptr <= 3'd3;
            n_gnt [3]: ptr <= 3'd4;
            n_gnt [4]: ptr <= 3'd5;
            n_gnt [5]: ptr <= 3'd6;
            n_gnt [6]: ptr <= 3'd7;
            n_gnt [7]: ptr <= 3'd0;
            endcase

    assign comb_gnt = n_gnt;

    `endif

endmodule
//
module selector_8
# (
    parameter data_width = 1
)
(
    input  [             7:0] sel,
    output [data_width - 1:0] sel_d,
    input  [data_width - 1:0] d0,
    input  [data_width - 1:0] d1,
    input  [data_width - 1:0] d2,
    input  [data_width - 1:0] d3,
    input  [data_width - 1:0] d4,
    input  [data_width - 1:0] d5,
    input  [data_width - 1:0] d6,
    input  [data_width - 1:0] d7
);

    assign sel_d
        =   ({ data_width { sel [0] } } & d0)
          | ({ data_width { sel [1] } } & d1)
          | ({ data_width { sel [2] } } & d2)
          | ({ data_width { sel [3] } } & d3)
          | ({ data_width { sel [4] } } & d4)
          | ({ data_width { sel [5] } } & d5)
          | ({ data_width { sel [6] } } & d6)
          | ({ data_width { sel [7] } } & d7);

endmodule
