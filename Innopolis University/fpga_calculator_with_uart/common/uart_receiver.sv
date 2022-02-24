
module mfp_uart_receiver (
    input clock,
    input reset_n,
    input rx,

    output reg [7:0] byte_data,
    output           byte_ready
);
  parameter clock_frequency = 50000000;
  parameter baud_rate       = 9600;
  parameter clock_cycles_in_symbol = clock_frequency / baud_rate;

  enum {}
  // Synchronize rx input to clock

  always @(posedge clock) begin
    if (!reset_n) begin


    end else begin
      
    end

  end

endmodule
