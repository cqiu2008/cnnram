// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.3
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="cnna,hls_ip_2018_3,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=1,HLS_INPUT_PART=xczu9eg-ffvb1156-2-e,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=8.750000,HLS_SYN_LAT=1587,HLS_SYN_TPT=none,HLS_SYN_MEM=16,HLS_SYN_DSP=0,HLS_SYN_FF=1405,HLS_SYN_LUT=1607,HLS_VERSION=2018_3}" *)

module cnna (
        ap_clk,
        ap_rst_n,
        m_axi_FIN_DDR_AWVALID,
        m_axi_FIN_DDR_AWREADY,
        m_axi_FIN_DDR_AWADDR,
        m_axi_FIN_DDR_AWID,
        m_axi_FIN_DDR_AWLEN,
        m_axi_FIN_DDR_AWSIZE,
        m_axi_FIN_DDR_AWBURST,
        m_axi_FIN_DDR_AWLOCK,
        m_axi_FIN_DDR_AWCACHE,
        m_axi_FIN_DDR_AWPROT,
        m_axi_FIN_DDR_AWQOS,
        m_axi_FIN_DDR_AWREGION,
        m_axi_FIN_DDR_AWUSER,
        m_axi_FIN_DDR_WVALID,
        m_axi_FIN_DDR_WREADY,
        m_axi_FIN_DDR_WDATA,
        m_axi_FIN_DDR_WSTRB,
        m_axi_FIN_DDR_WLAST,
        m_axi_FIN_DDR_WID,
        m_axi_FIN_DDR_WUSER,
        m_axi_FIN_DDR_ARVALID,
        m_axi_FIN_DDR_ARREADY,
        m_axi_FIN_DDR_ARADDR,
        m_axi_FIN_DDR_ARID,
        m_axi_FIN_DDR_ARLEN,
        m_axi_FIN_DDR_ARSIZE,
        m_axi_FIN_DDR_ARBURST,
        m_axi_FIN_DDR_ARLOCK,
        m_axi_FIN_DDR_ARCACHE,
        m_axi_FIN_DDR_ARPROT,
        m_axi_FIN_DDR_ARQOS,
        m_axi_FIN_DDR_ARREGION,
        m_axi_FIN_DDR_ARUSER,
        m_axi_FIN_DDR_RVALID,
        m_axi_FIN_DDR_RREADY,
        m_axi_FIN_DDR_RDATA,
        m_axi_FIN_DDR_RLAST,
        m_axi_FIN_DDR_RID,
        m_axi_FIN_DDR_RUSER,
        m_axi_FIN_DDR_RRESP,
        m_axi_FIN_DDR_BVALID,
        m_axi_FIN_DDR_BREADY,
        m_axi_FIN_DDR_BRESP,
        m_axi_FIN_DDR_BID,
        m_axi_FIN_DDR_BUSER,
        s_axi_axilite_AWVALID,
        s_axi_axilite_AWREADY,
        s_axi_axilite_AWADDR,
        s_axi_axilite_WVALID,
        s_axi_axilite_WREADY,
        s_axi_axilite_WDATA,
        s_axi_axilite_WSTRB,
        s_axi_axilite_ARVALID,
        s_axi_axilite_ARREADY,
        s_axi_axilite_ARADDR,
        s_axi_axilite_RVALID,
        s_axi_axilite_RREADY,
        s_axi_axilite_RDATA,
        s_axi_axilite_RRESP,
        s_axi_axilite_BVALID,
        s_axi_axilite_BREADY,
        s_axi_axilite_BRESP,
        interrupt
);

parameter   C_S_AXI_AXILITE_DATA_WIDTH = 32;
parameter   C_S_AXI_AXILITE_ADDR_WIDTH = 7;
parameter   C_S_AXI_DATA_WIDTH = 32;
parameter   C_M_AXI_FIN_DDR_ID_WIDTH = 1;
parameter   C_M_AXI_FIN_DDR_ADDR_WIDTH = 32;
parameter   C_M_AXI_FIN_DDR_DATA_WIDTH = 128;
parameter   C_M_AXI_FIN_DDR_AWUSER_WIDTH = 1;
parameter   C_M_AXI_FIN_DDR_ARUSER_WIDTH = 1;
parameter   C_M_AXI_FIN_DDR_WUSER_WIDTH = 1;
parameter   C_M_AXI_FIN_DDR_RUSER_WIDTH = 1;
parameter   C_M_AXI_FIN_DDR_BUSER_WIDTH = 1;
parameter   C_M_AXI_FIN_DDR_USER_VALUE = 0;
parameter   C_M_AXI_FIN_DDR_PROT_VALUE = 0;
parameter   C_M_AXI_FIN_DDR_CACHE_VALUE = 3;
parameter 	C_S_AXI_AXILITE_WSTRB_WIDTH = (32 / 8);
parameter 	C_S_AXI_WSTRB_WIDTH = (32 / 8);
parameter 	C_M_AXI_FIN_DDR_WSTRB_WIDTH = (128 / 8);
parameter 	C_M_AXI_WSTRB_WIDTH = (32 / 8);

parameter C_M_AXI_ID_WIDTH		= 1	  	;
parameter C_M_AXI_LEN_WIDTH		= 32  	; 
parameter C_M_AXI_SIZE_WIDTH    = 3  	; 
parameter C_M_AXI_USER_WIDTH	= 1	  	; 
parameter C_M_AXI_ADDR_WIDTH    = 32 	;	 
parameter C_M_AXI_DATA_WIDTH    = 128	; 

input   ap_clk;
input   ap_rst_n;
output   m_axi_FIN_DDR_AWVALID;
input   m_axi_FIN_DDR_AWREADY;
output  [C_M_AXI_FIN_DDR_ADDR_WIDTH - 1:0] m_axi_FIN_DDR_AWADDR;
output  [C_M_AXI_FIN_DDR_ID_WIDTH - 1:0] m_axi_FIN_DDR_AWID;
output  [7:0] m_axi_FIN_DDR_AWLEN;
output  [2:0] m_axi_FIN_DDR_AWSIZE;
output  [1:0] m_axi_FIN_DDR_AWBURST;
output  [1:0] m_axi_FIN_DDR_AWLOCK;
output  [3:0] m_axi_FIN_DDR_AWCACHE;
output  [2:0] m_axi_FIN_DDR_AWPROT;
output  [3:0] m_axi_FIN_DDR_AWQOS;
output  [3:0] m_axi_FIN_DDR_AWREGION;
output  [C_M_AXI_FIN_DDR_AWUSER_WIDTH - 1:0] m_axi_FIN_DDR_AWUSER;
output   m_axi_FIN_DDR_WVALID;
input   m_axi_FIN_DDR_WREADY;
output  [C_M_AXI_FIN_DDR_DATA_WIDTH - 1:0] m_axi_FIN_DDR_WDATA;
output  [C_M_AXI_FIN_DDR_WSTRB_WIDTH - 1:0] m_axi_FIN_DDR_WSTRB;
output   m_axi_FIN_DDR_WLAST;
output  [C_M_AXI_FIN_DDR_ID_WIDTH - 1:0] m_axi_FIN_DDR_WID;
output  [C_M_AXI_FIN_DDR_WUSER_WIDTH - 1:0] m_axi_FIN_DDR_WUSER;
output   m_axi_FIN_DDR_ARVALID;
input   m_axi_FIN_DDR_ARREADY;
output  [C_M_AXI_FIN_DDR_ADDR_WIDTH - 1:0] m_axi_FIN_DDR_ARADDR;
output  [C_M_AXI_FIN_DDR_ID_WIDTH - 1:0] m_axi_FIN_DDR_ARID;
output  [7:0] m_axi_FIN_DDR_ARLEN;
output  [2:0] m_axi_FIN_DDR_ARSIZE;
output  [1:0] m_axi_FIN_DDR_ARBURST;
output  [1:0] m_axi_FIN_DDR_ARLOCK;
output  [3:0] m_axi_FIN_DDR_ARCACHE;
output  [2:0] m_axi_FIN_DDR_ARPROT;
output  [3:0] m_axi_FIN_DDR_ARQOS;
output  [3:0] m_axi_FIN_DDR_ARREGION;
output  [C_M_AXI_FIN_DDR_ARUSER_WIDTH - 1:0] m_axi_FIN_DDR_ARUSER;
input   m_axi_FIN_DDR_RVALID;
output   m_axi_FIN_DDR_RREADY;
input  [C_M_AXI_FIN_DDR_DATA_WIDTH - 1:0] m_axi_FIN_DDR_RDATA;
input   m_axi_FIN_DDR_RLAST;
input  [C_M_AXI_FIN_DDR_ID_WIDTH - 1:0] m_axi_FIN_DDR_RID;
input  [C_M_AXI_FIN_DDR_RUSER_WIDTH - 1:0] m_axi_FIN_DDR_RUSER;
input  [1:0] m_axi_FIN_DDR_RRESP;
input   m_axi_FIN_DDR_BVALID;
output   m_axi_FIN_DDR_BREADY;
input  [1:0] m_axi_FIN_DDR_BRESP;
input  [C_M_AXI_FIN_DDR_ID_WIDTH - 1:0] m_axi_FIN_DDR_BID;
input  [C_M_AXI_FIN_DDR_BUSER_WIDTH - 1:0] m_axi_FIN_DDR_BUSER;
input   s_axi_axilite_AWVALID;
output   s_axi_axilite_AWREADY;
input  [C_S_AXI_AXILITE_ADDR_WIDTH - 1:0] s_axi_axilite_AWADDR;
input   s_axi_axilite_WVALID;
output   s_axi_axilite_WREADY;
input  [C_S_AXI_AXILITE_DATA_WIDTH - 1:0] s_axi_axilite_WDATA;
input  [C_S_AXI_AXILITE_WSTRB_WIDTH - 1:0] s_axi_axilite_WSTRB;
input   s_axi_axilite_ARVALID;
output   s_axi_axilite_ARREADY;
input  [C_S_AXI_AXILITE_ADDR_WIDTH - 1:0] s_axi_axilite_ARADDR;
output   s_axi_axilite_RVALID;
input   s_axi_axilite_RREADY;
output  [C_S_AXI_AXILITE_DATA_WIDTH - 1:0] s_axi_axilite_RDATA;
output  [1:0] s_axi_axilite_RRESP;
output   s_axi_axilite_BVALID;
input   s_axi_axilite_BREADY;
output  [1:0] s_axi_axilite_BRESP;
output   interrupt;

wire   [15:0] layer_iPara_batchSize;
wire   [15:0] layer_iPara_width;
wire   [15:0] layer_iPara_height;
wire   [12:0] layer_iPara_ci_V;
wire   [12:0] layer_iPara_ciAlign_V;
wire   [12:0] layer_iPara_ciGroup_V;
wire   [39:0] layer_iPara_memAddrImgIn_V;

wire							ap_rst_n_inv	;
wire							ap_start		;
wire							ap_ready		;
wire							ap_done			;
wire							ap_idle			;
wire	[C_M_AXI_LEN_WIDTH-1 :0]S_len			;
wire 	[				   31:0]fiddr_V			;	
wire 	[				   31:0]S_base_addr		;	
wire	[C_M_AXI_USER_WIDTH-1:0]S_maxi_aruser	;
wire	[C_M_AXI_FIN_DDR_ID_WIDTH-1:0]S_maxi_arid	;
wire	[					1:0]S_maxi_arburst	;
wire	[					1:0]S_maxi_arlock	;
wire	[					3:0]S_maxi_arcache	;
wire	[					2:0]S_maxi_arprot	;
wire	[					3:0]S_maxi_arqos	;
wire	[					3:0]S_maxi_arregion	;
wire	[C_M_AXI_SIZE_WIDTH-1:0]S_maxi_arsize	;
wire	[C_M_AXI_LEN_WIDTH-1 :0]S_maxi_arlen	;
wire							S_maxi_arready	;
wire							S_maxi_arvalid 	;
wire	[C_M_AXI_ADDR_WIDTH-1:0]S_maxi_araddr	;
wire	[C_M_AXI_ID_WIDTH-1  :0]S_maxi_rid		;
wire	[C_M_AXI_USER_WIDTH-1:0]S_maxi_ruser	;
wire	[					1:0]S_maxi_rresp	;
wire	[					1:0]S_maxi_rlast	;
wire							S_maxi_rready	;
wire							S_maxi_rvalid	;
wire	[C_M_AXI_DATA_WIDTH-1:0]S_maxi_rdata	;
wire	[C_M_AXI_USER_WIDTH-1:0]S_maxi_awuser	;
wire	[C_M_AXI_ID_WIDTH-1  :0]S_maxi_awid		;
wire	[					1:0]S_maxi_awburst	;
wire	[					1:0]S_maxi_awlock	;
wire	[					3:0]S_maxi_awcache	;
wire	[					2:0]S_maxi_awprot	;
wire	[					3:0]S_maxi_awqos	;
wire	[					3:0]S_maxi_awregion	;
wire	[C_M_AXI_SIZE_WIDTH-1:0]S_maxi_awsize	;
wire	[C_M_AXI_LEN_WIDTH-1 :0]S_maxi_awlen	;
wire							S_maxi_awready	;
wire							S_maxi_awvalid 	;
wire	[C_M_AXI_ADDR_WIDTH-1:0]S_maxi_awaddr	;
wire	[C_M_AXI_ID_WIDTH-1  :0]S_maxi_wid		;
wire	[C_M_AXI_USER_WIDTH-1:0]S_maxi_wuser	;
wire	[				   15:0]S_maxi_wstrb	;
wire	[					1:0]S_maxi_wlast	;
wire							S_maxi_wready	;
wire							S_maxi_wvalid	;
wire	[C_M_AXI_DATA_WIDTH-1:0]S_maxi_wdata	; 
wire	[C_M_AXI_ID_WIDTH-1  :0]S_maxi_bid		;
wire	[C_M_AXI_USER_WIDTH-1:0]S_maxi_buser	;
wire	[					1:0]S_maxi_bresp	;
wire							S_maxi_bvalid	;
wire							S_maxi_bready	;

assign ap_rst_n_inv = ~ap_rst_n;
assign S_len = 28*28; 
assign S_base_addr = fiddr_V[31:0] + layer_iPara_memAddrImgIn_V[31:0];			

cnna_axilite_s_axi #(
    .C_S_AXI_ADDR_WIDTH( C_S_AXI_AXILITE_ADDR_WIDTH ),
    .C_S_AXI_DATA_WIDTH( C_S_AXI_AXILITE_DATA_WIDTH ))
cnna_axilite_s_axi_U(
    .AWVALID(s_axi_axilite_AWVALID),
    .AWREADY(s_axi_axilite_AWREADY),
    .AWADDR(s_axi_axilite_AWADDR),
    .WVALID(s_axi_axilite_WVALID),
    .WREADY(s_axi_axilite_WREADY),
    .WDATA(s_axi_axilite_WDATA),
    .WSTRB(s_axi_axilite_WSTRB),
    .ARVALID(s_axi_axilite_ARVALID),
    .ARREADY(s_axi_axilite_ARREADY),
    .ARADDR(s_axi_axilite_ARADDR),
    .RVALID(s_axi_axilite_RVALID),
    .RREADY(s_axi_axilite_RREADY),
    .RDATA(s_axi_axilite_RDATA),
    .RRESP(s_axi_axilite_RRESP),
    .BVALID(s_axi_axilite_BVALID),
    .BREADY(s_axi_axilite_BREADY),
    .BRESP(s_axi_axilite_BRESP),
    .ACLK(ap_clk),
    .ARESET(ap_rst_n_inv),
    .ACLK_EN(1'b1),
    .ap_start(ap_start),
    .interrupt(interrupt),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .fiddr_V(fiddr_V),
    .layer_iPara_batchSize(layer_iPara_batchSize),
    .layer_iPara_width(layer_iPara_width),
    .layer_iPara_height(layer_iPara_height),
    .layer_iPara_ci_V(layer_iPara_ci_V),
    .layer_iPara_ciAlign_V(layer_iPara_ciAlign_V),
    .layer_iPara_ciGroup_V(layer_iPara_ciGroup_V),
    .layer_iPara_memAddrImgIn_V(layer_iPara_memAddrImgIn_V)
);

cnna_FIN_DDR_m_axi #(
    .CONSERVATIVE( 0 ),
    .USER_DW( 128 ),
    .USER_AW( 32 ),
    .USER_MAXREQS( 5 ),
    .NUM_READ_OUTSTANDING( 16 ),
    .NUM_WRITE_OUTSTANDING( 16 ),
    .MAX_READ_BURST_LENGTH( 16 ),
    .MAX_WRITE_BURST_LENGTH( 16 ),
    .C_M_AXI_ID_WIDTH( C_M_AXI_FIN_DDR_ID_WIDTH ),
    .C_M_AXI_ADDR_WIDTH( C_M_AXI_FIN_DDR_ADDR_WIDTH ),
    .C_M_AXI_DATA_WIDTH( C_M_AXI_FIN_DDR_DATA_WIDTH ),
    .C_M_AXI_AWUSER_WIDTH( C_M_AXI_FIN_DDR_AWUSER_WIDTH ),
    .C_M_AXI_ARUSER_WIDTH( C_M_AXI_FIN_DDR_ARUSER_WIDTH ),
    .C_M_AXI_WUSER_WIDTH( C_M_AXI_FIN_DDR_WUSER_WIDTH ),
    .C_M_AXI_RUSER_WIDTH( C_M_AXI_FIN_DDR_RUSER_WIDTH ),
    .C_M_AXI_BUSER_WIDTH( C_M_AXI_FIN_DDR_BUSER_WIDTH ),
    .C_USER_VALUE( C_M_AXI_FIN_DDR_USER_VALUE ),
    .C_PROT_VALUE( C_M_AXI_FIN_DDR_PROT_VALUE ),
    .C_CACHE_VALUE( C_M_AXI_FIN_DDR_CACHE_VALUE ))
cnna_FIN_DDR_m_axi_U(
    .AWVALID(m_axi_FIN_DDR_AWVALID),
    .AWREADY(m_axi_FIN_DDR_AWREADY),
    .AWADDR(m_axi_FIN_DDR_AWADDR),
    .AWID(m_axi_FIN_DDR_AWID),
    .AWLEN(m_axi_FIN_DDR_AWLEN),
    .AWSIZE(m_axi_FIN_DDR_AWSIZE),
    .AWBURST(m_axi_FIN_DDR_AWBURST),
    .AWLOCK(m_axi_FIN_DDR_AWLOCK),
    .AWCACHE(m_axi_FIN_DDR_AWCACHE),
    .AWPROT(m_axi_FIN_DDR_AWPROT),
    .AWQOS(m_axi_FIN_DDR_AWQOS),
    .AWREGION(m_axi_FIN_DDR_AWREGION),
    .AWUSER(m_axi_FIN_DDR_AWUSER),
    .WVALID(m_axi_FIN_DDR_WVALID),
    .WREADY(m_axi_FIN_DDR_WREADY),
    .WDATA(m_axi_FIN_DDR_WDATA),
    .WSTRB(m_axi_FIN_DDR_WSTRB),
    .WLAST(m_axi_FIN_DDR_WLAST),
    .WID(m_axi_FIN_DDR_WID),
    .WUSER(m_axi_FIN_DDR_WUSER),
    .ARVALID(m_axi_FIN_DDR_ARVALID),
    .ARREADY(m_axi_FIN_DDR_ARREADY),
    .ARADDR(m_axi_FIN_DDR_ARADDR),
    .ARID(m_axi_FIN_DDR_ARID),
    .ARLEN(m_axi_FIN_DDR_ARLEN),
    .ARSIZE(m_axi_FIN_DDR_ARSIZE),
    .ARBURST(m_axi_FIN_DDR_ARBURST),
    .ARLOCK(m_axi_FIN_DDR_ARLOCK),
    .ARCACHE(m_axi_FIN_DDR_ARCACHE),
    .ARPROT(m_axi_FIN_DDR_ARPROT),
    .ARQOS(m_axi_FIN_DDR_ARQOS),
    .ARREGION(m_axi_FIN_DDR_ARREGION),
    .ARUSER(m_axi_FIN_DDR_ARUSER),
    .RVALID(m_axi_FIN_DDR_RVALID),
    .RREADY(m_axi_FIN_DDR_RREADY),
    .RDATA(m_axi_FIN_DDR_RDATA),
    .RLAST(m_axi_FIN_DDR_RLAST),
    .RID(m_axi_FIN_DDR_RID),
    .RUSER(m_axi_FIN_DDR_RUSER),
    .RRESP(m_axi_FIN_DDR_RRESP),
    .BVALID(m_axi_FIN_DDR_BVALID),
    .BREADY(m_axi_FIN_DDR_BREADY),
    .BRESP(m_axi_FIN_DDR_BRESP),
    .BID(m_axi_FIN_DDR_BID),
    .BUSER(m_axi_FIN_DDR_BUSER),
    .ACLK(ap_clk),
    .ARESET(ap_rst_n_inv),
    .ACLK_EN(1'b1),

    .I_ARVALID	(S_maxi_arvalid		),
    .I_ARREADY	(S_maxi_arready		),
    .I_ARADDR	(S_maxi_araddr		),
    .I_ARID		(S_maxi_arid		),
    .I_ARLEN	(S_maxi_arlen		),
    .I_ARSIZE	(S_maxi_arsize		),
    .I_ARLOCK	(S_maxi_arlock		),
    .I_ARCACHE	(S_maxi_arcache		),
    .I_ARQOS	(S_maxi_arqos		),
    .I_ARPROT	(S_maxi_arprot		),
    .I_ARUSER	(S_maxi_aruser		),
    .I_ARBURST	(S_maxi_arburst		),
    .I_ARREGION	(S_maxi_arregion	),
    .I_RVALID	(S_maxi_rvalid		),
    .I_RREADY	(S_maxi_rready		),
    .I_RDATA	(S_maxi_rdata		),
    .I_RID		(S_maxi_rid			),
    .I_RUSER	(S_maxi_ruser		),
    .I_RRESP	(S_maxi_rresp		),
    .I_RLAST	(S_maxi_rlast		),
    .I_AWVALID	(S_maxi_awvalid		),
    .I_AWREADY	(S_maxi_awready		),
    .I_AWADDR	(S_maxi_awaddr		),
    .I_AWID		(S_maxi_awid	    ),	
    .I_AWLEN	(S_maxi_awlen		),	
    .I_AWSIZE	(S_maxi_awsize		),	
    .I_AWLOCK	(S_maxi_awlock		),	
    .I_AWCACHE	(S_maxi_awcache		),	
    .I_AWQOS	(S_maxi_awqos		),	
    .I_AWPROT	(S_maxi_awprot		),	
    .I_AWUSER	(S_maxi_awuser		),	
    .I_AWBURST	(S_maxi_awburst		),	
    .I_AWREGION	(S_maxi_awregion	),	
    .I_WVALID	(S_maxi_wvalid		),	
    .I_WREADY	(S_maxi_wready		),	 
    .I_WDATA	(S_maxi_wdata		),	
    .I_WID		(S_maxi_wid			),	
    .I_WUSER	(S_maxi_wuser		),	
    .I_WLAST	(S_maxi_wlast		),	
    .I_WSTRB	(S_maxi_wstrb		),	
    .I_BVALID	(S_maxi_bvalid		),	
    .I_BREADY	(S_maxi_bready		),	
    .I_BRESP	(S_maxi_bresp		),	
    .I_BID		(S_maxi_bid			),	
    .I_BUSER	(S_maxi_buser		)
);

test_axirambus #(
	.C_M_AXI_ID_WIDTH	(1),
	.C_M_AXI_LEN_WIDTH	(32),
	.C_M_AXI_SIZE_WIDTH (3),
	.C_M_AXI_USER_WIDTH	(1), 
    .C_M_AXI_ADDR_WIDTH (32),
    .C_M_AXI_DATA_WIDTH (128),
    .C_RAM_ADDR_WIDTH   (10), 
    .C_RAM_DATA_WIDTH   (128))
u0_axictrl_ram(
.I_clk			 (ap_clk			),
.I_rst			 (ap_rst_n_inv		),
.I_ap_start		 (ap_start			),
.O_ap_done		 (ap_done			),
.O_ap_idle		 (ap_idle		  	),
.O_ap_ready		 (ap_ready		  	),
.I_base_addr	 (S_base_addr		),
.I_len			 (S_len			  	),
.O_maxi_aruser	 (S_maxi_aruser	  	),
.O_maxi_arid	 (S_maxi_arid	  	),
.O_maxi_arburst	 (S_maxi_arburst	),
.O_maxi_arlock	 (S_maxi_arlock	  	),
.O_maxi_arcache	 (S_maxi_arcache	),
.O_maxi_arprot	 (S_maxi_arprot	  	),
.O_maxi_arqos	 (S_maxi_arqos	  	),
.O_maxi_arregion (S_maxi_arregion  	),
.O_maxi_arsize	 (S_maxi_arsize	  	),
.O_maxi_arlen	 (S_maxi_arlen	  	),
.I_maxi_arready	 (S_maxi_arready	),
.O_maxi_arvalid  (S_maxi_arvalid   	),
.O_maxi_araddr	 (S_maxi_araddr	  	),
.I_maxi_rid		 (S_maxi_rid		),
.I_maxi_ruser	 (S_maxi_ruser	  	),
.I_maxi_rresp	 (S_maxi_rresp	  	),
.I_maxi_rlast	 (S_maxi_rlast	  	),
.O_maxi_rready	 (S_maxi_rready	  	),
.I_maxi_rvalid	 (S_maxi_rvalid	  	),
.I_maxi_rdata	 (S_maxi_rdata	  	),
.O_maxi_awuser	 (S_maxi_awuser	  	),
.O_maxi_awid	 (S_maxi_awid	  	),
.O_maxi_awburst	 (S_maxi_awburst	),
.O_maxi_awlock	 (S_maxi_awlock	  	),
.O_maxi_awcache	 (S_maxi_awcache	),
.O_maxi_awprot	 (S_maxi_awprot	  	),
.O_maxi_awqos	 (S_maxi_awqos	  	),
.O_maxi_awregion (S_maxi_awregion  	),
.O_maxi_awsize	 (S_maxi_awsize	  	),
.O_maxi_awlen	 (S_maxi_awlen	  	),
.I_maxi_awready	 (S_maxi_awready	),
.O_maxi_awvalid  (S_maxi_awvalid   	),
.O_maxi_awaddr	 (S_maxi_awaddr	  	),
.O_maxi_wid		 (S_maxi_wid		),
.O_maxi_wuser	 (S_maxi_wuser	  	),
.O_maxi_wstrb	 (S_maxi_wstrb	  	),
.O_maxi_wlast	 (S_maxi_wlast	  	),
.I_maxi_wready	 (S_maxi_wready	  	),
.O_maxi_wvalid	 (S_maxi_wvalid	  	),
.O_maxi_wdata	 (S_maxi_wdata	  	), 
.I_maxi_bid		 (S_maxi_bid	  	),
.I_maxi_buser	 (S_maxi_buser	  	),
.I_maxi_bresp	 (S_maxi_bresp	  	),
.I_maxi_bvalid	 (S_maxi_bvalid	  	),
.O_maxi_bready	 (S_maxi_bready	  	)
);

endmodule

