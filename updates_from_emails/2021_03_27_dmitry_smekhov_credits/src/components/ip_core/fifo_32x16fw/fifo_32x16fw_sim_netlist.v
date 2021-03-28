// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Sun Mar 28 03:46:17 2021
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
  output [4:0]data_count;

  wire clk;
  wire [4:0]data_count;
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
  wire [4:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [4:0]NLW_U0_wr_data_count_UNCONNECTED;

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
  (* C_DATA_COUNT_WIDTH = "5" *) 
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
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "15" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "14" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "5" *) 
  (* C_RD_DEPTH = "16" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "4" *) 
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
  (* C_WR_DATA_COUNT_WIDTH = "5" *) 
  (* C_WR_DEPTH = "16" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "4" *) 
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
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(1'b0),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[4:0]),
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
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[4:0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 76016)
`pragma protect data_block
+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
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
