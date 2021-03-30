// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Tue Mar 30 03:49:34 2021
// Host        : dell-nb running 64-bit CentOS Linux release 7.8.2003 (Core)
// Command     : write_verilog -force -mode funcsim
//               /xprj/chip/credits/src/components/ip_core/fifo_32x16fw/fifo_32x16fw_sim_netlist.v
// Design      : fifo_32x16fw
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a12tcpg238-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fifo_32x16fw,fifo_generator_v13_2_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_5,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module fifo_32x16fw
   (clk,
    srst,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    overflow,
    empty,
    underflow,
    data_count);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 core_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME core_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, INSERT_VIP 0" *) input clk;
  input srst;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [15:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [15:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  output overflow;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output underflow;
  output [5:0]data_count;

  wire clk;
  wire [5:0]data_count;
  wire [15:0]din;
  wire [15:0]dout;
  wire empty;
  wire full;
  wire overflow;
  wire rd_en;
  wire srst;
  wire underflow;
  wire wr_en;
  wire NLW_U0_almost_empty_UNCONNECTED;
  wire NLW_U0_almost_full_UNCONNECTED;
  wire NLW_U0_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_overflow_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_full_UNCONNECTED;
  wire NLW_U0_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_underflow_UNCONNECTED;
  wire NLW_U0_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_overflow_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_full_UNCONNECTED;
  wire NLW_U0_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_underflow_UNCONNECTED;
  wire NLW_U0_axi_b_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_overflow_UNCONNECTED;
  wire NLW_U0_axi_b_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_b_prog_full_UNCONNECTED;
  wire NLW_U0_axi_b_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_underflow_UNCONNECTED;
  wire NLW_U0_axi_r_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_overflow_UNCONNECTED;
  wire NLW_U0_axi_r_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_r_prog_full_UNCONNECTED;
  wire NLW_U0_axi_r_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_underflow_UNCONNECTED;
  wire NLW_U0_axi_w_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_overflow_UNCONNECTED;
  wire NLW_U0_axi_w_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_w_prog_full_UNCONNECTED;
  wire NLW_U0_axi_w_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_underflow_UNCONNECTED;
  wire NLW_U0_axis_dbiterr_UNCONNECTED;
  wire NLW_U0_axis_overflow_UNCONNECTED;
  wire NLW_U0_axis_prog_empty_UNCONNECTED;
  wire NLW_U0_axis_prog_full_UNCONNECTED;
  wire NLW_U0_axis_sbiterr_UNCONNECTED;
  wire NLW_U0_axis_underflow_UNCONNECTED;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_m_axi_arvalid_UNCONNECTED;
  wire NLW_U0_m_axi_awvalid_UNCONNECTED;
  wire NLW_U0_m_axi_bready_UNCONNECTED;
  wire NLW_U0_m_axi_rready_UNCONNECTED;
  wire NLW_U0_m_axi_wlast_UNCONNECTED;
  wire NLW_U0_m_axi_wvalid_UNCONNECTED;
  wire NLW_U0_m_axis_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_tvalid_UNCONNECTED;
  wire NLW_U0_prog_empty_UNCONNECTED;
  wire NLW_U0_prog_full_UNCONNECTED;
  wire NLW_U0_rd_rst_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_s_axis_tready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire NLW_U0_valid_UNCONNECTED;
  wire NLW_U0_wr_ack_UNCONNECTED;
  wire NLW_U0_wr_rst_busy_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_wr_data_count_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awuser_UNCONNECTED;
  wire [63:0]NLW_U0_m_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wuser_UNCONNECTED;
  wire [7:0]NLW_U0_m_axis_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tid_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tkeep_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tstrb_UNCONNECTED;
  wire [3:0]NLW_U0_m_axis_tuser_UNCONNECTED;
  wire [5:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [5:0]NLW_U0_wr_data_count_UNCONNECTED;

  (* C_ADD_NGC_CONSTRAINT = "0" *) 
  (* C_APPLICATION_TYPE_AXIS = "0" *) 
  (* C_APPLICATION_TYPE_RACH = "0" *) 
  (* C_APPLICATION_TYPE_RDCH = "0" *) 
  (* C_APPLICATION_TYPE_WACH = "0" *) 
  (* C_APPLICATION_TYPE_WDCH = "0" *) 
  (* C_APPLICATION_TYPE_WRCH = "0" *) 
  (* C_AXIS_TDATA_WIDTH = "8" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TKEEP_WIDTH = "1" *) 
  (* C_AXIS_TSTRB_WIDTH = "1" *) 
  (* C_AXIS_TUSER_WIDTH = "4" *) 
  (* C_AXIS_TYPE = "0" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_LEN_WIDTH = "8" *) 
  (* C_AXI_LOCK_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "1" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "6" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "16" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "16" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_FULL_FLAGS_RST_VAL = "0" *) 
  (* C_HAS_ALMOST_EMPTY = "0" *) 
  (* C_HAS_ALMOST_FULL = "0" *) 
  (* C_HAS_AXIS_TDATA = "1" *) 
  (* C_HAS_AXIS_TDEST = "0" *) 
  (* C_HAS_AXIS_TID = "0" *) 
  (* C_HAS_AXIS_TKEEP = "0" *) 
  (* C_HAS_AXIS_TLAST = "0" *) 
  (* C_HAS_AXIS_TREADY = "1" *) 
  (* C_HAS_AXIS_TSTRB = "0" *) 
  (* C_HAS_AXIS_TUSER = "1" *) 
  (* C_HAS_AXI_ARUSER = "0" *) 
  (* C_HAS_AXI_AWUSER = "0" *) 
  (* C_HAS_AXI_BUSER = "0" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_AXI_RD_CHANNEL = "1" *) 
  (* C_HAS_AXI_RUSER = "0" *) 
  (* C_HAS_AXI_WR_CHANNEL = "1" *) 
  (* C_HAS_AXI_WUSER = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "1" *) 
  (* C_HAS_DATA_COUNTS_AXIS = "0" *) 
  (* C_HAS_DATA_COUNTS_RACH = "0" *) 
  (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WACH = "0" *) 
  (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MASTER_CE = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "1" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "0" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "1" *) 
  (* C_HAS_UNDERFLOW = "1" *) 
  (* C_HAS_VALID = "0" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "0" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "1" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MEMORY_TYPE = "2" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "0" *) 
  (* C_PRELOAD_REGS = "1" *) 
  (* C_PRIM_FIFO_TYPE = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "4" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "5" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "31" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "30" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "6" *) 
  (* C_RD_DEPTH = "32" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "5" *) 
  (* C_REG_SLICE_MODE_AXIS = "0" *) 
  (* C_REG_SLICE_MODE_RACH = "0" *) 
  (* C_REG_SLICE_MODE_RDCH = "0" *) 
  (* C_REG_SLICE_MODE_WACH = "0" *) 
  (* C_REG_SLICE_MODE_WDCH = "0" *) 
  (* C_REG_SLICE_MODE_WRCH = "0" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "2" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_COMMON_OVERFLOW = "0" *) 
  (* C_USE_COMMON_UNDERFLOW = "0" *) 
  (* C_USE_DEFAULT_SETTINGS = "0" *) 
  (* C_USE_DOUT_RST = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "0" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "1" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "6" *) 
  (* C_WR_DEPTH = "32" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "5" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  fifo_32x16fw_fifo_generator_v13_2_5 U0
       (.almost_empty(NLW_U0_almost_empty_UNCONNECTED),
        .almost_full(NLW_U0_almost_full_UNCONNECTED),
        .axi_ar_data_count(NLW_U0_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_U0_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(NLW_U0_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_U0_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(NLW_U0_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(NLW_U0_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_U0_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_U0_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_U0_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_U0_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_U0_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(NLW_U0_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_U0_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(NLW_U0_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(NLW_U0_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_U0_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_U0_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_U0_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_U0_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_U0_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(NLW_U0_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_U0_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(NLW_U0_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(NLW_U0_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_U0_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_U0_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_U0_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_U0_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_U0_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(NLW_U0_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_U0_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(NLW_U0_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(NLW_U0_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_U0_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_U0_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_U0_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_U0_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_U0_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(NLW_U0_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_U0_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(NLW_U0_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(NLW_U0_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_U0_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_U0_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_U0_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(NLW_U0_axis_data_count_UNCONNECTED[10:0]),
        .axis_dbiterr(NLW_U0_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(NLW_U0_axis_overflow_UNCONNECTED),
        .axis_prog_empty(NLW_U0_axis_prog_empty_UNCONNECTED),
        .axis_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_prog_full(NLW_U0_axis_prog_full_UNCONNECTED),
        .axis_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_rd_data_count(NLW_U0_axis_rd_data_count_UNCONNECTED[10:0]),
        .axis_sbiterr(NLW_U0_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_U0_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(NLW_U0_axis_wr_data_count_UNCONNECTED[10:0]),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(clk),
        .data_count(data_count),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(1'b0),
        .m_aclk_en(1'b0),
        .m_axi_araddr(NLW_U0_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_U0_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_U0_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_U0_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_U0_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_U0_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(NLW_U0_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_U0_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(NLW_U0_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_U0_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_U0_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_U0_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(NLW_U0_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_U0_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_U0_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_U0_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_U0_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_U0_m_axi_awlock_UNCONNECTED[0]),
        .m_axi_awprot(NLW_U0_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_U0_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_U0_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_U0_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_U0_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_U0_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid(1'b0),
        .m_axi_bready(NLW_U0_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b0),
        .m_axi_rready(NLW_U0_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(NLW_U0_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_U0_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_U0_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_U0_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_U0_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_U0_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(NLW_U0_m_axis_tdata_UNCONNECTED[7:0]),
        .m_axis_tdest(NLW_U0_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_U0_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_U0_m_axis_tkeep_UNCONNECTED[0]),
        .m_axis_tlast(NLW_U0_m_axis_tlast_UNCONNECTED),
        .m_axis_tready(1'b0),
        .m_axis_tstrb(NLW_U0_m_axis_tstrb_UNCONNECTED[0]),
        .m_axis_tuser(NLW_U0_m_axis_tuser_UNCONNECTED[3:0]),
        .m_axis_tvalid(NLW_U0_m_axis_tvalid_UNCONNECTED),
        .overflow(overflow),
        .prog_empty(NLW_U0_prog_empty_UNCONNECTED),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(1'b0),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[5:0]),
        .rd_en(rd_en),
        .rd_rst(1'b0),
        .rd_rst_busy(NLW_U0_rd_rst_busy_UNCONNECTED),
        .rst(1'b0),
        .s_aclk(1'b0),
        .s_aclk_en(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock(1'b0),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock(1'b0),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_U0_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_U0_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep(1'b0),
        .s_axis_tlast(1'b0),
        .s_axis_tready(NLW_U0_s_axis_tready_UNCONNECTED),
        .s_axis_tstrb(1'b0),
        .s_axis_tuser({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .srst(srst),
        .underflow(underflow),
        .valid(NLW_U0_valid_UNCONNECTED),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(1'b0),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[5:0]),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(NLW_U0_wr_rst_busy_UNCONNECTED));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2020.2"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
SFoQ2tXDMrL2nCJbfpmHXuteJlKaWDWl3o9OY1miFvmYb8EDywmDpLUHQktJ/VoW+17fK5WHgFVI
FZV1B91GDQ==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
mxGWDRjEAsKmBqldxevT1RKZvqK7vn0KlTODVXNGlRcGf9zOAmj0Z7Ppu79POBDb8oNQyCY+2q1q
BddzhQfh5WLIVX9BNUMIF6M6IF0elM4GMSLHGeYEwqSaMPC+thuR8FGj1J7z6rH+43gDYhtIeyY+
ZuZUz/Pqg8Lu63Xwe+0=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
HLwPjQzkuqv5FEDBriEJS2DikBeIHB/bWuVWooHY5ChdoHatcmqCHpSvnGxVzLwObZWHFys2nR9y
P3zxywjtgtOWq/n3cYVa5li6eyiUmGXv2OE8nw1nLnAY1kzBvGd6VwQ45t6l4Hx5+oqpIfuU2KI2
7/Qpj2atiTN3Y+q5He/BMXLIxF9vWuU6XL/+HsxriGAumcZDuESdidlxOztbW1bFhYr1/qWwou2q
wynnRVKYHL41aWycgFdkDoDEFFxv8ft8+F5Ux+J5Hg5XdgRULJc6uUQE/lDG3zOqzPftlODB52zU
d0cm8gFOvSZ2nO8ZB8THnxoAGe33iIZJfMcefA==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
jlR0iZ4fp9QXiFgaT07DMAK1YFLyBpsOGOOR9j2PWImFEh8oTBt4cvmGo+2z1Umbt9OMQwOhyepO
QIsKLFzUXYUba+SFFLBoCiaww24KICecbUfd3VV5sg2bEJjAdtYTT6mJqyc3vQRvBlONeBFdIGy2
AXqdK7QtXGLsLAIF/z4FG8cfG6nSD6e16gccBC6+kl5MoShdnmebKLyoo6UKFdMbDK88sHvTcD9S
LNCau6RK7FkTZg23FV0tf6cTP9Rray9YEcowm2AAh51Wldo2lGJ2W5iiDatRKH/W1bu7FGWZG+OT
+VZE+Ckiuf4T6cuu+G5IbrtMv6a4U93R0gtxXQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
p/kq+JjPPJbOTWT2SRiPJ99/iH6kkVGEiluRRXpuRN+j+cVPgJD1v4QVjw3zMWLlvTGB7OOqC+JG
Lc62Wiizd/BFfGj2JYkTZMatcOWok7A87HK+vRTjr4nZMApD2jKaneJdU1279KsIEeRfImCQ2uRl
QRNMH3PPdNGYCnOGgNk=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kyyI/O29YYc5VBwhz19i7AV7MC75r43hHVKAOTBiGBhRu8zZxCwGGcNFqc2HgHcWC6nq4jCIbIXf
S3FDzPdasegnERlWvoob9/SXM88zKsyeTbUf+DRu5lB8SPROBMaIhnj375C5XLowL17MXZdmB6fV
X5ukCg7cNhCjssKt/bIJibWkfna7hvj4ye+CLWmi3LdEiix8KTwRoBS3ZJrjM4/N6FfZkXerVxs+
txkhdsmG9ga1g/xErhTRilhqrV2WetlpX86qH/64sRGVxrWeEfNoHhMZsqEK0jWDx4WavKt8XY7W
NDzMXLZ2m5Dv5HMiJWgFG+ntPwgiYYtBuwu7Eg==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
tv6UL1ZWqo3dAIlhN5UTNGzJyqzdHpCqh217JPvIvHiWJgcFh2tw1n7HWnOPcK3VhCt31AGnCEFe
HpTiinXvHna65L2X2HhtNUrsgvZlUuh/oQR273wp5JPFDPD97NQ4ELkGI+w26HTYLgZ70K5rQo87
D4AkQNRuzTRS5G12yb4RU7ZYgmkYLuq1UyqjlxyN62Del4XoqZyivOGw5H+7wlfkNRu98iQwqq12
jthZbH/ue5wxZJUcb7NmEwL+3abpyDNmWs1qORHOFoE3t97/9XMmeSCpM2+KnSKJvsV5VbuoTCOT
964fsEh7ey4IVb4aum095gQjLCqTmDm8DWFmaw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2020_08", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Oxo3AgNmVWgrXtMKDIThYfXr0YJfyFr7Bsjn2ge/G72mb25MA8Dbkd9ZZPtwqU1poazNnTng5Cx5
s8C1zMNEoo38jNY8zEUBjCCuasJgeMo5xsiha+3ZIBiuHS0KLrjLaPFIQZdsYevb44fg6J5YQLn5
jd1M6YdNMd1VwSezDxtbk9sN8ExPrmtwum/6L1ia9j9UlIzPTEaJ60Xz7tloPsgsbkborO2JLiIk
kIAY2q1b8tuhHzJ5DoXlvIo49wSDj75ncLrkwbAd26huob7aOmX1bS34pJLF17JzqYH0MoPJbHxb
RPdD+qUawXFsMSs2fOLnZrNxeG8L+TyAT0N8tQ==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
CIR/vwxo0IBrPr5+bMp2YuBCQTNBRIIbqgEB18Oewkc8CuHzGCAgPyQUBUKaUG3bBy+KDOPVxBP5
cE/d3QYZAT11fyB1OMMTrjmEIZcr0Vk3nVTAnivoxxxkmdzPjkj0OcGcU9fMArPi3dfTgIsKdtCq
94+mV/70WeprgijzuZFWD7uH+gVioY/+rq/Wc1O6x1n949w8YGgSCTurUvhsobx2bonoC317J0Wm
IX17XRkSBIFgzqA8iC+GV5oCfxIGkihKmXxjIJbMamlOdCOycEkjkh3JYmm7TLNxmI65iffsabR0
t5+iI0l8eJxFhElzWeREqE43cnJYLaKZBUA+DA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 77712)
`pragma protect data_block
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
UE6S0mttee4FDW/vI9WdR2XRacWf
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
