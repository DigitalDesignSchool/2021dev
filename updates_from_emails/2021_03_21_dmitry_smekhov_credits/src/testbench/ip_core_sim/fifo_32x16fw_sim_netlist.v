// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Sun Mar 21 13:40:40 2021
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
  output [3:0]data_count;

  wire clk;
  wire [3:0]data_count;
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
  wire [3:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [3:0]NLW_U0_wr_data_count_UNCONNECTED;

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
  (* C_DATA_COUNT_WIDTH = "4" *) 
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
  (* C_PRELOAD_LATENCY = "1" *) 
  (* C_PRELOAD_REGS = "0" *) 
  (* C_PRIM_FIFO_TYPE = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "2" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "3" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "14" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "13" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "4" *) 
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
  (* C_USE_FWFT_DATA_COUNT = "0" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "4" *) 
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
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[3:0]),
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
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[3:0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 65824)
`pragma protect data_block
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
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
