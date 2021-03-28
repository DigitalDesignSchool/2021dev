// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Sun Mar 28 03:46:17 2021
// Host        : dell-nb running 64-bit CentOS Linux release 7.8.2003 (Core)
// Command     : write_verilog -force -mode synth_stub
//               /xprj/chip/credits/src/components/ip_core/fifo_32x16fw/fifo_32x16fw_stub.v
// Design      : fifo_32x16fw
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a12tcpg238-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_2_5,Vivado 2020.2" *)
module fifo_32x16fw(clk, srst, din, wr_en, rd_en, dout, full, overflow, 
  empty, underflow, data_count)
/* synthesis syn_black_box black_box_pad_pin="clk,srst,din[15:0],wr_en,rd_en,dout[15:0],full,overflow,empty,underflow,data_count[4:0]" */;
  input clk;
  input srst;
  input [15:0]din;
  input wr_en;
  input rd_en;
  output [15:0]dout;
  output full;
  output overflow;
  output empty;
  output underflow;
  output [4:0]data_count;
endmodule
