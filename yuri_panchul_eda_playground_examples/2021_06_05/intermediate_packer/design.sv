module packer
(
    input            clock,
    input            reset,
    input      [7:0] data_valid,
    input      [7:0] data,
    output reg [7:0] out_data,    // Registered value of output data
    output reg       out_data_valid  // Registered output data valid
);

    // New value of leftover buffer
  
    reg [7:0] n_buf_data;
    reg [7:0] n_buf_data_valid;

    // Registered value of leftover bit buffer
    // and the corresponding valids
  
    reg [7:0] buf_data;
    reg [7:0] buf_data_valid;

    // New value of output data
  
    reg [7:0] n_out_data;
    reg       n_out_data_valid;

    integer i;

    always @*
    begin
        // Use bits left in leftover buffer from previus clock cycle
        // The calculated value will be registered in the second always block
      
        n_buf_data         = buf_data;
        n_buf_data_valid   = buf_data_valid;

        // Clear new values for the output
      
        n_out_data         = 8'b0;
        n_out_data_valid   = 1'b0;

        for (i = 0; i < 8; i = i + 1)
        begin
            // Collect the bits into leftover buffer
          
            if (data_valid [i])
            begin
                n_buf_data       = { data [i] , n_buf_data       [7:1] };
                n_buf_data_valid = { 1'b1     , n_buf_data_valid [7:1] };
            end

            if (n_buf_data_valid == ~ 8'b0)  // Leftover bit buffer is full 
            begin
                // Copy leftover bit buffer into output
                // (will be registered in the second always block
              
                n_out_data       = n_buf_data;
                n_out_data_valid = 1'b1;
              
                // Clear leftover bit buffer

                n_buf_data       = 8'b0;
                n_buf_data_valid = 8'b0;
            end
        end
    end    

    wire enable_for_low_dynamic_power
        = data_valid != 8'b0 || out_data_valid;

    // Register values for leftover bit buffer
    // and for the output
  
    always @ (posedge clock or posedge reset)
        if (reset)
        begin
            buf_data       <= 8'b0;
            buf_data_valid <= 8'b0;
            out_data       <= 8'b0; 
            out_data_valid <= 8'b0;
        end
        else if (enable_for_low_dynamic_power)
        begin
            buf_data       <= n_buf_data;
            buf_data_valid <= n_buf_data_valid;
            out_data       <= n_out_data;
            out_data_valid <= n_out_data_valid;
        end

endmodule
