module testMaster(input clk, input reset,
//    output M_AXI_RREADY,
//    input  M_AXI_RVALID,
//    input [5:0] M_AXI_RID,
//    input [31:0] M_AXI_RDATA,
//    input [1:0] M_AXI_RRESP,
//    input  M_AXI_RLAST,
//    input  M_AXI_ARREADY,
//    output M_AXI_ARVALID,
//    output[5:0] M_AXI_ARID,
//    output[5:0] M_AXI_ARADDR,
//    output[7:0] M_AXI_ARLEN,
//    output[2:0] M_AXI_ARSIZE,
//    output[1:0] M_AXI_ARBURST,
//    input M_AXI_WREADY,
//    output M_AXI_WVALID,
//    output[31:0] M_AXI_WDATA,
//    output[3:0] M_AXI_WSTRB,
//    output M_AXI_WLAST,
//    input M_AXI_AWREADY,
//    output M_AXI_AWVALID,
//    output[5:0] M_AXI_AWID,
//    output[5:0] M_AXI_AWADDR,
//    output[7:0] M_AXI_AWLEN,
//    output[2:0] M_AXI_AWSIZE,
//    output[1:0] M_AXI_AWBURST,
//    output M_AXI_BREADY,
//    input  M_AXI_BVALID,
//    input [5:0] M_AXI_BID,
//    input [1:0] M_AXI_BRESP,

        input  io_start_single_burst_write,
        input  io_start_single_burst_read
//    input  io_INIT_AXI_TXN,
//    output io_TXN_DONE
);
    wire M_AXI_RREADY;
    wire  M_AXI_RVALID;
    wire [5:0] M_AXI_RID;
    wire [31:0] M_AXI_RDATA;
    wire [1:0] M_AXI_RRESP;
    wire  M_AXI_RLAST;
    wire  M_AXI_ARREADY;
    wire M_AXI_ARVALID;
    wire[5:0] M_AXI_ARID;
    wire[5:0] M_AXI_ARADDR;
    wire[7:0] M_AXI_ARLEN;
    wire[2:0] M_AXI_ARSIZE;
    wire[1:0] M_AXI_ARBURST;
    wire M_AXI_WREADY;
    wire M_AXI_WVALID;
    wire[31:0] M_AXI_WDATA;
    wire[3:0] M_AXI_WSTRB;
    wire M_AXI_WLAST;
    wire M_AXI_AWREADY;
    wire M_AXI_AWVALID;
    wire[5:0] M_AXI_AWID;
    wire[5:0] M_AXI_AWADDR;
    wire[7:0] M_AXI_AWLEN;
    wire[2:0] M_AXI_AWSIZE;
    wire[1:0] M_AXI_AWBURST;
    wire M_AXI_BREADY;
    wire  M_AXI_BVALID;
    wire [5:0] M_AXI_BID;
    wire [1:0] M_AXI_BRESP;
testSlave instSlave(
    .clk(clk),   
    .reset(reset),
    .S_AXI_RREADY(M_AXI_RREADY),                                                                                                                 
    .S_AXI_RVALID(M_AXI_RVALID),
    .S_AXI_RID(M_AXI_RID),
    .S_AXI_RDATA(M_AXI_RDATA),
    .S_AXI_RRESP(M_AXI_RRESP),
    .S_AXI_RLAST(M_AXI_RLAST),
    .S_AXI_ARREADY(M_AXI_ARREADY),
    .S_AXI_ARVALID(M_AXI_ARVALID),
    .S_AXI_ARID(M_AXI_ARID),
    .S_AXI_ARADDR(M_AXI_ARADDR),
    .S_AXI_ARLEN(M_AXI_ARLEN),
    .S_AXI_ARSIZE(M_AXI_ARSIZE),
    .S_AXI_ARBURST(M_AXI_ARBURST),
    .S_AXI_WREADY(M_AXI_WREADY),
    .S_AXI_WVALID(M_AXI_WVALID),
    .S_AXI_WDATA(M_AXI_WDATA),
    .S_AXI_WSTRB(M_AXI_WSTRB),
    .S_AXI_WLAST(M_AXI_WLAST),
    .S_AXI_AWREADY(M_AXI_AWREADY),
    .S_AXI_AWVALID(M_AXI_AWVALID),
    .S_AXI_AWID(M_AXI_AWID),
    .S_AXI_AWADDR(M_AXI_AWADDR),
    .S_AXI_AWLEN(M_AXI_AWLEN),
    .S_AXI_AWSIZE(M_AXI_AWSIZE),
    .S_AXI_AWBURST(M_AXI_AWBURST),
    .S_AXI_BREADY(M_AXI_BREADY),
    .S_AXI_BVALID(M_AXI_BVALID),
    .S_AXI_BID(M_AXI_BID),
    .S_AXI_BRESP(M_AXI_BRESP));


      reg  axi_bready;
      wire T0;
      wire T1;
      wire T2;
      wire T3;
      wire T4;
      wire T5;
      wire T6;
      wire T7;
      wire T8;
      wire T9;
      wire T10;
      wire T11;
      wire T12;
      wire T13;
      wire[5:0] T128;
      wire[30:0] T14;
      wire[30:0] T129;
      reg [5:0] axi_awaddr;
      wire[5:0] T130;
      wire[6:0] T15;
      wire[6:0] T16;
      wire[6:0] T131;
      wire[5:0] T17;
      wire T18;
      wire[6:0] T19;
      wire[6:0] burst_size_bytes;
      wire[6:0] T132;
      wire T20;
      wire T21;
      reg  axi_awvalid;
      wire T22;
      wire T23;
      wire T24;
      wire T25;
      wire T26;
      wire T27;
      wire T28;
      wire T29;
      wire T30;
      wire T31;
      wire T32;
      wire T33;
      wire T34;
      wire T35;
      wire T36;
      wire T37;
      wire[6:0] T133;
      wire T38;
      wire T39;
      reg  axi_wlast;
      wire T40;
      wire T41;
      wire T42;
      wire T43;
      wire T44;
      wire T45;
      wire T46;
      wire wnext;
      wire T47;
      reg  axi_wvalid;
      wire T48;
      wire T49;
      wire T50;
      wire T51;
      wire T52;
      wire T53;
      wire T54;
      wire T55;
      wire T56;
      wire T57;
      wire T58;
      wire T59;
      wire T60;
      wire T61;
      wire T62;
      wire T63;
      reg [4:0] write_index;
      wire[4:0] T64;
      wire[4:0] T65;
      wire[4:0] T66;
      wire T67;
      wire T68;
      wire T69;
      wire[4:0] T70;
      wire T71;
      wire T72;
      wire T73;
      wire T74;
      wire T75;
      wire T76;
      wire T77;
      wire T78;
      wire T79;
      wire T80;
      wire T81;
      wire T82;
      reg [31:0] axi_wdata;
      wire[31:0] T83;
      wire[31:0] T84;
      wire[31:0] T85;
      wire T86;
      wire[31:0] T87;
      wire T88;
      wire T89;
      wire T90;
      wire T91;
      wire[5:0] T134;
      wire[30:0] T92;
      wire[30:0] T135;
      reg [5:0] axi_araddr;
      wire[5:0] T136;
      wire[6:0] T93;
      wire[6:0] T94;
      wire[6:0] T137;
      wire[5:0] T95;
      wire T96;
      wire[6:0] T97;
      wire[6:0] T138;
      wire T98;
      wire T99;
      reg  axi_arvalid;
      wire T100;
      wire T101;
      wire T102;
      wire T103;
      wire T104;
      wire T105;
      wire T106;
      wire T107;
      wire T108;
      wire T109;
      wire T110;
      wire T111;
      wire T112;
      wire T113;
      wire T114;
      wire T115;
      wire[6:0] T139;
      wire T116;
      wire T117;
      reg  axi_rready;
      wire T118;
      wire T119;
      wire T120;
      wire T121;
      wire T122;
      wire T123;
      wire T124;
      wire T125;
      wire T126;
      wire T127;
    
    `ifndef SYNTHESIS
    // synthesis translate_off
      integer initvar;
      initial begin
        #0.002;
        axi_bready = {1{$random}};
        axi_awaddr = {1{$random}};
        axi_awvalid = {1{$random}};
        axi_wlast = {1{$random}};
        axi_wvalid = {1{$random}};
        write_index = {1{$random}};
        axi_wdata = {1{$random}};
        axi_araddr = {1{$random}};
        axi_arvalid = {1{$random}};
        axi_rready = {1{$random}};
      end
    // synthesis translate_on
    `endif
    
      assign M_AXI_BREADY = axi_bready;
      assign T0 = T12 ? axi_bready : T1;
      assign T1 = T9 ? 1'h0 : T2;
      assign T2 = T5 ? 1'h1 : T3;
      assign T3 = T4 ? 1'h0 : axi_bready;
      assign T4 = reset ^ 1'h1;
      assign T5 = T8 & T6;
      assign T6 = M_AXI_BVALID & T7;
      assign T7 = axi_bready ^ 1'h1;
      assign T8 = T4 ^ 1'h1;
      assign T9 = T10 & axi_bready;
      assign T10 = T11 ^ 1'h1;
      assign T11 = T4 | T6;
      assign T12 = T13 ^ 1'h1;
      assign T13 = T11 | axi_bready;
      assign M_AXI_AWBURST = 2'h1;
      assign M_AXI_AWSIZE = 3'h2;
      assign M_AXI_AWLEN = 8'hf;
      assign M_AXI_AWADDR = T128;
      assign T128 = T14[5:0];
      assign T14 = 31'h40000000 + T129;
      assign T129 = {25'h0, axi_awaddr};
      assign T130 = T15[5:0];
      assign T15 = T38 ? T133 : T16;
      assign T16 = T20 ? T19 : T131;
      assign T131 = {1'h0, T17};
      assign T17 = T18 ? 6'h0 : axi_awaddr;
      assign T18 = reset ^ 1'h1;
      assign T19 = T132 + burst_size_bytes;
      assign burst_size_bytes = 7'h40;
      assign T132 = {1'h0, axi_awaddr};
      assign T20 = T37 & T21;
      assign T21 = M_AXI_AWREADY & axi_awvalid;
      assign T22 = T35 ? axi_awvalid : T23;
      assign T23 = T31 ? 1'h0 : T24;
      assign T24 = T27 ? 1'h1 : T25;
      assign T25 = T26 ? 1'h0 : axi_awvalid;
      assign T26 = reset ^ 1'h1;
      assign T27 = T30 & T28;
      assign T28 = T29 & io_start_single_burst_write;
      assign T29 = axi_awvalid ^ 1'h1;
      assign T30 = T26 ^ 1'h1;
      assign T31 = T33 & T32;
      assign T32 = M_AXI_AWREADY & axi_awvalid;
      assign T33 = T34 ^ 1'h1;
      assign T34 = T26 | T28;
      assign T35 = T36 ^ 1'h1;
      assign T36 = T34 | T32;
      assign T37 = T18 ^ 1'h1;
      assign T133 = {1'h0, axi_awaddr};
      assign T38 = T39 ^ 1'h1;
      assign T39 = T18 | T21;
      assign M_AXI_AWID = 6'h0;
      assign M_AXI_AWVALID = axi_awvalid;
      assign M_AXI_WLAST = axi_wlast;
      assign T40 = T81 ? axi_wlast : T41;
      assign T41 = T78 ? 1'h0 : T42;
      assign T42 = T45 ? 1'h1 : T43;
      assign T43 = T44 ? 1'h0 : axi_wlast;
      assign T44 = reset ^ 1'h1;
      assign T45 = T77 & T46;
      assign T46 = T63 & wnext;
      assign wnext = T47;
      assign T47 = M_AXI_WREADY & axi_wvalid;
      assign T48 = T61 ? axi_wvalid : T49;
      assign T49 = T57 ? 1'h0 : T50;
      assign T50 = T53 ? 1'h1 : T51;
      assign T51 = T52 ? 1'h0 : axi_wvalid;
      assign T52 = reset ^ 1'h1;
      assign T53 = T56 & T54;
      assign T54 = T55 & io_start_single_burst_write;
      assign T55 = axi_wvalid ^ 1'h1;
      assign T56 = T52 ^ 1'h1;
      assign T57 = T59 & T58;
      assign T58 = wnext & axi_wlast;
      assign T59 = T60 ^ 1'h1;
      assign T60 = T52 | T54;
      assign T61 = T62 ^ 1'h1;
      assign T62 = T60 | T58;
      assign T63 = write_index == 5'he;
      assign T64 = T75 ? write_index : T65;
      assign T65 = T71 ? T70 : T66;
      assign T66 = T67 ? 5'h0 : write_index;
      assign T67 = T69 | T68;
      assign T68 = io_start_single_burst_write == 1'h1;
      assign T69 = reset ^ 1'h1;
      assign T70 = write_index + 5'h1;
      assign T71 = T74 & T72;
      assign T72 = wnext & T73;
      assign T73 = write_index != 5'hf;
      assign T74 = T67 ^ 1'h1;
      assign T75 = T76 ^ 1'h1;
      assign T76 = T67 | T72;
      assign T77 = T44 ^ 1'h1;
      assign T78 = T79 & wnext;
      assign T79 = T80 ^ 1'h1;
      assign T80 = T44 | T46;
      assign T81 = T82 ^ 1'h1;
      assign T82 = T80 | wnext;
      assign M_AXI_WSTRB = 4'hf;
      assign M_AXI_WDATA = axi_wdata;
      assign T83 = T90 ? axi_wdata : T84;
      assign T84 = T88 ? T87 : T85;
      assign T85 = T86 ? 32'h1 : axi_wdata;
      assign T86 = reset ^ 1'h1;
      assign T87 = axi_wdata + 32'h1;
      assign T88 = T89 & wnext;
      assign T89 = T86 ^ 1'h1;
      assign T90 = T91 ^ 1'h1;
      assign T91 = T86 | wnext;
      assign M_AXI_WVALID = axi_wvalid;
      assign M_AXI_ARBURST = 2'h1;
      assign M_AXI_ARSIZE = 3'h2;
      assign M_AXI_ARLEN = 8'hf;
      assign M_AXI_ARADDR = T134;
      assign T134 = T92[5:0];
      assign T92 = T135 + 31'h40000000;
      assign T135 = {25'h0, axi_araddr};
      assign T136 = T93[5:0];
      assign T93 = T116 ? T139 : T94;
      assign T94 = T98 ? T97 : T137;
      assign T137 = {1'h0, T95};
      assign T95 = T96 ? 6'h0 : axi_araddr;
      assign T96 = reset ^ 1'h1;
      assign T97 = T138 + burst_size_bytes;
      assign T138 = {1'h0, axi_araddr};
      assign T98 = T115 & T99;
      assign T99 = M_AXI_ARREADY & axi_arvalid;
      assign T100 = T113 ? axi_arvalid : T101;
      assign T101 = T109 ? 1'h0 : T102;
      assign T102 = T105 ? 1'h1 : T103;
      assign T103 = T104 ? 1'h0 : axi_arvalid;
      assign T104 = reset ^ 1'h1;
      assign T105 = T108 & T106;
      assign T106 = T107 & io_start_single_burst_read;
      assign T107 = axi_arvalid ^ 1'h1;
      assign T108 = T104 ^ 1'h1;
      assign T109 = T111 & T110;
      assign T110 = M_AXI_ARREADY & axi_arvalid;
      assign T111 = T112 ^ 1'h1;
      assign T112 = T104 | T106;
      assign T113 = T114 ^ 1'h1;
      assign T114 = T112 | T110;
      assign T115 = T96 ^ 1'h1;
      assign T139 = {1'h0, axi_araddr};
      assign T116 = T117 ^ 1'h1;
      assign T117 = T96 | T99;
      assign M_AXI_ARID = 6'h0;
      assign M_AXI_ARVALID = axi_arvalid;
      assign M_AXI_RREADY = axi_rready;
      assign T118 = T126 ? 1'h1 : T119;
      assign T119 = T122 ? 1'h0 : T120;
      assign T120 = T121 ? 1'h0 : axi_rready;
      assign T121 = reset ^ 1'h1;
      assign T122 = T124 & T123;
      assign T123 = M_AXI_RLAST & axi_rready;
      assign T124 = T125 & M_AXI_RVALID;
      assign T125 = T121 ^ 1'h1;
      assign T126 = T124 & T127;
      assign T127 = T123 ^ 1'h1;
    
      always @(posedge clk) begin
        if(T12) begin
          axi_bready <= axi_bready;
        end else if(T9) begin
          axi_bready <= 1'h0;
        end else if(T5) begin
          axi_bready <= 1'h1;
        end else if(T4) begin
          axi_bready <= 1'h0;
        end
        axi_awaddr <= T130;
        if(T35) begin
          axi_awvalid <= axi_awvalid;
        end else if(T31) begin
          axi_awvalid <= 1'h0;
        end else if(T27) begin
          axi_awvalid <= 1'h1;
        end else if(T26) begin
          axi_awvalid <= 1'h0;
        end
        if(T81) begin
          axi_wlast <= axi_wlast;
        end else if(T78) begin
          axi_wlast <= 1'h0;
        end else if(T45) begin
          axi_wlast <= 1'h1;
        end else if(T44) begin
          axi_wlast <= 1'h0;
        end
        if(T61) begin
          axi_wvalid <= axi_wvalid;
        end else if(T57) begin
          axi_wvalid <= 1'h0;
        end else if(T53) begin
          axi_wvalid <= 1'h1;
        end else if(T52) begin
          axi_wvalid <= 1'h0;
        end
        if(T75) begin
          write_index <= write_index;
        end else if(T71) begin
          write_index <= T70;
        end else if(T67) begin
          write_index <= 5'h0;
        end
        if(T90) begin
          axi_wdata <= axi_wdata;
        end else if(T88) begin
          axi_wdata <= T87;
        end else if(T86) begin
          axi_wdata <= 32'h1;
        end
        axi_araddr <= T136;
        if(T113) begin
          axi_arvalid <= axi_arvalid;
        end else if(T109) begin
          axi_arvalid <= 1'h0;
        end else if(T105) begin
          axi_arvalid <= 1'h1;
        end else if(T104) begin
          axi_arvalid <= 1'h0;
        end
        if(T126) begin
          axi_rready <= 1'h1;
        end else if(T122) begin
          axi_rready <= 1'h0;
        end else if(T121) begin
          axi_rready <= 1'h0;
        end
      end
    endmodule
