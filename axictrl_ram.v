//FILE_HEADER-----------------------------------------------------------------
//ZTE  Copyright (C)
//ZTE Company Confidential
//----------------------------------------------------------------------------
//Project Name : cnna
//FILE NAME    : axictrl_ram.v
//AUTHOR       : qiu.chao 
//Department   : Technical Planning Department/System Products/ZTE
//Email        : qiu.chao@zte.com.cn
//----------------------------------------------------------------------------
//Module Hiberarchy :
//        |--U01_axictrl_ram
//        |--U02_axim_wddr
// cnna --|--U03_axis_reg
//        |--U04_main_process
//----------------------------------------------------------------------------
//Relaese History :
//----------------------------------------------------------------------------
//Version         Date           Author        Description
// 1.1           july-30-2019                    
//----------------------------------------------------------------------------
//Main Function:
//a)Get the data from ddr chip using axi master bus
//b)Write it to the ibuf ram
//----------------------------------------------------------------------------
//REUSE ISSUES: none
//Reset Strategy: synchronization 
//Clock Strategy: one common clock 
//Critical Timing: none 
//Asynchronous Interface: none 
//END_HEADER------------------------------------------------------------------
`timescale 1 ns / 100 ps
module axictrl_ram #(
parameter 
    C_M_AXI_ID_WIDTH        = 1     ,
    C_M_AXI_LEN_WIDTH       = 32    ,
    C_M_AXI_SIZE_WIDTH      = 3     ,
    C_M_AXI_USER_WIDTH      = 1     , 
    C_M_AXI_ADDR_WIDTH      = 32    ,
    C_M_AXI_DATA_WIDTH      = 128 
)(
// clk
input                               I_clk           ,
input                               I_rst           ,
// ap signals
input                               I_ap_start      ,
output reg                          O_ap_done       ,
output                              O_ap_idle       ,
output reg                          O_ap_ready      ,
// reg 
input       [27                  :0]I_base_addr     ,
input       [31                  :0]I_len           ,
// master read address channel
output      [C_M_AXI_USER_WIDTH-1:0]O_maxi_aruser   ,   
output      [C_M_AXI_ID_WIDTH-1  :0]O_maxi_arid     ,
output      [                   1:0]O_maxi_arburst  ,
output      [                   1:0]O_maxi_arlock   ,
output      [                   3:0]O_maxi_arcache  ,
output      [                   2:0]O_maxi_arprot   ,
output      [                   3:0]O_maxi_arqos    ,
output      [                   3:0]O_maxi_arregion ,
output      [C_M_AXI_SIZE_WIDTH-1:0]O_maxi_arsize   ,
output reg  [C_M_AXI_LEN_WIDTH-1 :0]O_maxi_arlen    ,
input                               I_maxi_arready  ,   
output reg                          O_maxi_arvalid  ,
output reg  [C_M_AXI_ADDR_WIDTH-1:0]O_maxi_araddr   ,
// master read data channel
input       [C_M_AXI_ID_WIDTH-1  :0]I_maxi_rid      ,
input       [C_M_AXI_USER_WIDTH-1:0]I_maxi_ruser    ,   
input       [                   1:0]I_maxi_rresp    ,
input       [                   1:0]I_maxi_rlast    ,   
output reg                          O_maxi_rready   ,
input                               I_maxi_rvalid   ,
input       [C_M_AXI_DATA_WIDTH-1:0]I_maxi_rdata    ,
// master write address channel
output      [C_M_AXI_USER_WIDTH-1:0]O_maxi_awuser   ,   
output      [C_M_AXI_ID_WIDTH-1  :0]O_maxi_awid     ,
output      [                   1:0]O_maxi_awburst  ,
output      [                   1:0]O_maxi_awlock   ,
output      [                   3:0]O_maxi_awcache  ,
output      [                   2:0]O_maxi_awprot   ,
output      [                   3:0]O_maxi_awqos    ,
output      [                   3:0]O_maxi_awregion ,
output      [C_M_AXI_SIZE_WIDTH-1:0]O_maxi_awsize   ,
output reg  [C_M_AXI_LEN_WIDTH-1 :0]O_maxi_awlen    ,
input                               I_maxi_awready  ,   
output reg                          O_maxi_awvalid  ,
output reg  [C_M_AXI_ADDR_WIDTH-1:0]O_maxi_awaddr   ,
// master write data channel
output      [C_M_AXI_ID_WIDTH-1  :0]O_maxi_wid      ,
output      [C_M_AXI_USER_WIDTH-1:0]O_maxi_wuser    ,   
output      [                  15:0]O_maxi_wstrb    ,
output      [                   1:0]O_maxi_wlast    ,   
input                               I_maxi_wready   ,
output reg                          O_maxi_wvalid   ,
output reg  [C_M_AXI_DATA_WIDTH-1:0]O_maxi_wdata    ,       
// master write response
input       [C_M_AXI_ID_WIDTH-1  :0]I_maxi_bid      ,
input       [C_M_AXI_USER_WIDTH-1:0]I_maxi_buser    ,   
input       [                   1:0]I_maxi_bresp    ,
input                               I_maxi_bvalid   ,
output reg                          O_maxi_bready   
);


assign O_maxi_awuser    = {C_M_AXI_USER_WIDTH{1'b0}};
assign O_maxi_awid      = {C_M_AXI_ID_WIDTH{1'b0}};
assign O_maxi_awburst   = {2{1'b0}};
assign O_maxi_awlock    = {2{1'b0}};
assign O_maxi_awcache   = {4{1'b0}};
assign O_maxi_awprot    = {3{1'b0}};
assign O_maxi_awqos     = {4{1'b0}};
assign O_maxi_awregion  = {4{1'b0}};
assign O_maxi_awsize    = {C_M_AXI_SIZE_WIDTH{1'b0}};

assign O_maxi_wid       = {C_M_AXI_ID_WIDTH{1'b0}};
assign O_maxi_wuser     = {C_M_AXI_USER_WIDTH{1'b0}};
assign O_maxi_wstrb     = {16{1'b0}};
assign O_maxi_wlast     = {2{1'b0}};

assign O_ap_idle        = I_ap_start            ;

//// write ram process 
// master axi araddr channel 
assign O_maxi_aruser    = {C_M_AXI_USER_WIDTH{1'b0}}; 
assign O_maxi_arid      = {C_M_AXI_SIZE_WIDTH{1'b0}};
assign O_maxi_arburst   = {2{1'b0}};
assign O_maxi_arlock    = {2{1'b0}};
assign O_maxi_arcache   = {4{1'b0}};
assign O_maxi_arprot    = {3{1'b0}};
assign O_maxi_arqos     = {4{1'b0}};
assign O_maxi_arregion  = {4{1'b0}};
assign O_maxi_arsize    = {C_M_AXI_SIZE_WIDTH{1'b0}};

reg [                  15:0]S_len               ;   
reg [                  15:0]S_wcnt              ; 
wire                        S_wcnt_valid        ;
reg                         S_wcnt_en           ;
reg                         S_wcnt_en_1d        ;
reg                         S_ap_start_1d       ;
reg                         S_maxi_arvalid_en   ;
reg                         S_maxi_arvalid_en_1d;


always @(posedge I_clk)begin
    S_ap_start_1d   <= I_ap_start   ;
    S_wcnt_en_1d    <= S_wcnt_en    ; 
    S_maxi_arvalid_en_1d<=S_maxi_arvalid_en;
end

always @(posedge I_clk)begin
    if(I_ap_start)begin
        if(I_maxi_arready  && (S_maxi_arvalid_en) )begin
            O_maxi_arvalid      <= 1'b1;
            S_maxi_arvalid_en   <= 1'b0;
        end
        else if(I_maxi_arready && (O_maxi_arvalid))begin
            O_maxi_arvalid      <= 1'b0;
            S_maxi_arvalid_en   <= 1'b0;
        end
        else begin 
            O_maxi_arvalid      <= 1'b0; 
            S_maxi_arvalid_en   <= 1'b0;
        end
    end
    else begin
        O_maxi_arvalid <= 1'b0;
        S_maxi_arvalid_en   <= 1'b1;
    end
end

always @(posedge I_clk)begin
    O_maxi_araddr   <= I_base_addr + S_len;
end

// master axi rdata channel 

always @(posedge I_clk)begin
    if(I_rst)begin
        S_wcnt_en <= 1'b0;
    end
    else if(I_maxi_arready && O_maxi_arvalid)begin
        S_wcnt_en <= 1'b1;
    end
    else if(S_wcnt_valid && (S_wcnt == (S_len-1)))begin
        S_wcnt_en <= 1'b0;
    end
    else begin
        S_wcnt_en <= S_wcnt_en  ; 
    end
end

assign S_wcnt_valid = O_maxi_rready && I_maxi_rvalid && S_wcnt_en;

always @(posedge I_clk)begin
    if(I_ap_start)begin
        O_maxi_rready <= 1'b1;
    end
    else begin
        O_maxi_rready <= 1'b0; 
    end
end

always @(posedge I_clk)begin
    S_len           <= I_len;
    O_maxi_arlen    <= I_len;
    O_maxi_awlen    <= I_len;
end

always @(posedge I_clk)begin
    if(S_wcnt_en)begin 
        if(S_wcnt_valid)begin
            S_wcnt <= S_wcnt + 16'd1    ;
        end
        else begin
            S_wcnt <= S_wcnt            ; 
        end
    end
    else begin
        S_wcnt <= 16'h0;
    end
end

wire[C_M_AXI_ADDR_WIDTH-1:0]S_waddr         ;
wire[C_M_AXI_DATA_WIDTH-1:0]S_wdata         ;
wire                        S_wr            ;

assign S_waddr = S_wcnt[15:0]               ;
assign S_wdata = I_maxi_rdata               ;
assign S_wr    = S_wcnt_valid               ;

//// read ram process 
// master axi rdata channel 

wire [C_M_AXI_ADDR_WIDTH-1:0]S_raddr            ;
wire [C_M_AXI_DATA_WIDTH-1:0]S_rdata            ;
reg  [C_M_AXI_DATA_WIDTH-1:0]S_rdata_1d         ;
wire                         S_rd               ;
reg  [                  15:0]S_rcnt             ;
reg  [                  15:0]S_rcnt_1d          ;
reg                          S_rcnt_en          ;
reg                          S_rcnt_en_1d       ;
reg                          S_rcnt_en_2d       ;
wire                         S_rcnt_valid       ;
reg                          S_has_handshake_aw ; 
reg                          S_has_write2ram    ;

assign S_raddr[C_M_AXI_ADDR_WIDTH-1:16]= { C_M_AXI_ADDR_WIDTH-16{1'b0}};
assign S_raddr[15:0] = S_rcnt[15:0];
assign S_rd = S_rcnt_en && I_maxi_wready; 

assign S_rcnt_valid = O_maxi_wvalid && I_maxi_wready    ;
assign O_maxi_wdata = S_rdata_1d;


// ram instance 
sdpram #(
    .MEM_STYLE("block"),
    .DSIZE(C_M_AXI_ADDR_WIDTH),
    .ASIZE(C_M_AXI_DATA_WIDTH))
U0_sdpram(
.I_rst  (I_rst      ),  
.I_wclk (I_clk      ),
.I_waddr(S_waddr    ),
.I_wdata(S_wdata    ),
.I_ce   (1'b1       ),
.I_wr   (S_wr       ),
.I_rclk (I_clk      ),
.I_raddr(S_raddr    ),
.I_rd   (S_rd       ),
.O_rdata(S_rdata    )
);

always @(posedge I_clk)begin
    if(I_rst)begin
        S_rcnt_en <= 1'b0;
    end
    if ( S_has_handshake_aw && S_has_write2ram )begin
        S_rcnt_en <= 1'b1;
    end
    else if( S_rd && (S_rcnt == S_len+1) )begin
        S_rcnt_en <= 1'b0;
    end
    else begin
        S_rcnt_en <= S_rcnt_en;
    end
end

always @(posedge I_clk)begin
    S_rcnt_en_1d<=S_rcnt_en     ; 
    S_rcnt_en_2d<=S_rcnt_en_1d  ; 
end

always @(posedge I_clk)begin
    if(S_rd)begin
        S_rdata_1d  <= S_rdata      ;
    end
    else begin
        S_rdata_1d  <= S_rdata_1d   ;
    end
end

//always @(posedge I_clk)begin
//    if(S_rcnt_en)begin
//        if(S_rd && (S_rcnt_1d < S_cnt-1))begin
//            S_rcnt_1d   <= S_rcnt   ;
//        end
//    end
//    else begin
//        S_rcnt_1d   <= 0            ; 
//    end
//end


always @(posedge I_clk)begin
    if(S_rcnt_en)begin
        if(S_rd)begin
            S_rcnt      <= S_rcnt + 16'd1   ;
        end
        else begin
            S_rcnt      <= S_rcnt           ; 
        end
    end
    else begin
        S_rcnt      <= 16'd0                ; 
    end
end


always @(posedge I_clk)begin
    if(I_ap_start)begin
        if ( (~S_wcnt_en) && S_wcnt_en_1d )begin
            S_has_write2ram <= 1'b1;
        end
        else begin
            S_has_write2ram <= S_has_write2ram ;
        end
    end
    else begin
            S_has_write2ram <= 1'b0;
    end
end

always @(posedge I_clk)begin
    if(I_ap_start)begin
        if(I_maxi_awready && O_maxi_awvalid)begin
            S_has_handshake_aw <= 1'b1;
        end
        else begin
            S_has_handshake_aw <= S_has_handshake_aw ;
        end
    end
    else begin
        S_has_handshake_aw <= 1'b0;
    end
end

always @(posedge I_clk)begin
    if(I_ap_start)begin
        if(I_maxi_awready && (~O_maxi_awvalid) )begin
            O_maxi_awvalid <= 1'b1;
        end
        else if(I_maxi_awready && (O_maxi_awvalid))begin
            O_maxi_awvalid <= 1'b0;
        end
        else begin 
            O_maxi_awvalid <= O_maxi_awvalid; 
        end
    end
    else begin
        O_maxi_awvalid <= 1'b0;
    end
end

always @(posedge I_clk)begin
    O_maxi_awaddr   <= I_base_addr + S_len;
end


always @(posedge I_clk)begin
    O_maxi_wvalid <= S_rcnt_en_1d && S_rcnt_en ;
end

endmodule

