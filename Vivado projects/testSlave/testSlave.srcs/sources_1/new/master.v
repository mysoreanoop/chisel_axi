//testSlave instSlave(
//    .clk(clk),   
//    .reset(reset),
//    .S_AXI_RREADY(M_AXI_RREADY),                                                                                                                 
//    .S_AXI_RVALID(M_AXI_RVALID),
//    .S_AXI_RID(M_AXI_RID),
//    .S_AXI_RDATA(M_AXI_RDATA),
//    .S_AXI_RRESP(M_AXI_RRESP),
//    .S_AXI_RLAST(M_AXI_RLAST),
//    .S_AXI_ARREADY(M_AXI_ARREADY),
//    .S_AXI_ARVALID(M_AXI_ARVALID),
//    .S_AXI_ARID(M_AXI_ARID),
//    .S_AXI_ARADDR(M_AXI_ARADDR),
//    .S_AXI_ARLEN(M_AXI_ARLEN),
//    .S_AXI_ARSIZE(M_AXI_ARSIZE),
//    .S_AXI_ARBURST(M_AXI_ARBURST),
//    .S_AXI_WREADY(M_AXI_WREADY),
//    .S_AXI_WVALID(M_AXI_WVALID),
//    .S_AXI_WDATA(M_AXI_WDATA),
//    .S_AXI_WLAST(M_AXI_WLAST),
//    .S_AXI_AWREADY(M_AXI_AWREADY),
//    .S_AXI_AWVALID(M_AXI_AWVALID),
//    .S_AXI_AWID(M_AXI_AWID),
//    .S_AXI_AWADDR(M_AXI_AWADDR),
//    .S_AXI_AWLEN(M_AXI_AWLEN),
//    .S_AXI_AWSIZE(M_AXI_AWSIZE),
//    .S_AXI_AWBURST(M_AXI_AWBURST),
//    .S_AXI_BREADY(M_AXI_BREADY),
//    .S_AXI_BVALID(M_AXI_BVALID),
//    .S_AXI_BID(M_AXI_BID),
//    .S_AXI_BRESP(M_AXI_BRESP));
module testMaster(input clk, input reset,
    output M_AXI_RREADY,
    input  M_AXI_RVALID,
    input [5:0] M_AXI_RID,
    input [31:0] M_AXI_RDATA,
    input [1:0] M_AXI_RRESP,
    input  M_AXI_RLAST,
    input  M_AXI_ARREADY,
    output M_AXI_ARVALID,
    output[5:0] M_AXI_ARID,
    output[5:0] M_AXI_ARADDR,
    output[7:0] M_AXI_ARLEN,
    output[2:0] M_AXI_ARSIZE,
    output[1:0] M_AXI_ARBURST,
    input M_AXI_WREADY,
    output M_AXI_WVALID,
    output[31:0] M_AXI_WDATA,
    output[3:0] M_AXI_WSTRB,
    output M_AXI_WLAST,
    input M_AXI_AWREADY,
    output M_AXI_AWVALID,
    output[5:0] M_AXI_AWID,
    output[5:0] M_AXI_AWADDR,
    output[7:0] M_AXI_AWLEN,
    output[2:0] M_AXI_AWSIZE,
    output[1:0] M_AXI_AWBURST,
    output M_AXI_BREADY,
    input  M_AXI_BVALID,
    input [5:0] M_AXI_BID,
    input [1:0] M_AXI_BRESP,
    input  io_INIT_AXI_TXN,
    output io_TXN_DONE
);
test_64_v1_0_S64_AXI instSlave(
    .S_AXI_ACLK(clk),   
    .S_AXI_ARESETN(reset),
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
 

  
      reg  compare_done;
      wire T0;
      wire T1;
      wire T2;
      wire T3;
      wire T4;
      wire T5;
      wire init_txn_pulse;
      wire T6;
      reg  init_txn_ff;
      wire T7;
      wire T8;
      wire T9;
      wire T10;
      wire T11;
      reg  init_txn_ff2;
      wire T12;
      wire T13;
      wire T14;
      wire T15;
      reg [1:0] mst_exec_state;
      wire[1:0] T16;
      wire[1:0] T17;
      wire[1:0] T18;
      wire[1:0] T19;
      wire[1:0] T20;
      wire[1:0] T21;
      wire[1:0] T22;
      wire[1:0] T23;
      wire[1:0] T24;
      wire T25;
      wire T26;
      wire T27;
      reg  writes_done;
      wire T28;
      wire T29;
      wire T30;
      wire T31;
      wire T32;
      wire T33;
      wire T34;
      reg  axi_bready;
      wire T35;
      wire T36;
      wire T37;
      wire T38;
      wire T39;
      wire T40;
      wire T41;
      wire T42;
      wire T43;
      wire T44;
      wire T45;
      wire T46;
      wire T47;
      wire T48;
      wire T49;
      wire T50;
      wire T51;
      wire T52;
      reg [6:0] write_burst_counter;
      wire[6:0] T53;
      wire[6:0] T54;
      wire[6:0] T55;
      wire T56;
      wire T57;
      wire T58;
      wire[6:0] T59;
      wire T60;
      wire T61;
      wire T62;
      wire T63;
      wire T64;
      reg  axi_awvalid;
      wire T65;
      wire T66;
      wire T67;
      wire T68;
      wire T69;
      wire T70;
      wire T71;
      wire T72;
      wire T73;
      reg  start_single_burst_write;
      wire T74;
      wire T75;
      wire T76;
      wire T77;
      wire T78;
      wire T79;
      reg  burst_write_active;
      wire T80;
      wire T81;
      wire T82;
      wire T83;
      wire T84;
      wire T85;
      wire T86;
      wire T87;
      wire T88;
      wire T89;
      wire T90;
      wire T91;
      wire T92;
      wire T93;
      wire T94;
      wire T95;
      wire T96;
      wire T97;
      wire T98;
      wire T99;
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
      wire T116;
      wire T117;
      reg  reads_done;
      wire T118;
      wire T119;
      wire T120;
      wire T121;
      wire T122;
      wire T123;
      wire T124;
      wire T125;
      wire T126;
      reg [6:0] read_burst_counter;
      wire[6:0] T127;
      wire[6:0] T128;
      wire[6:0] T129;
      wire T130;
      wire T131;
      wire T132;
      wire[6:0] T133;
      wire T134;
      wire T135;
      wire T136;
      wire T137;
      wire T138;
      reg  axi_arvalid;
      wire T139;
      wire T140;
      wire T141;
      wire T142;
      wire T143;
      wire T144;
      wire T145;
      wire T146;
      wire T147;
      reg  start_single_burst_read;
      wire T148;
      wire T149;
      wire T150;
      wire T151;
      wire T152;
      wire T153;
      wire T154;
      wire T155;
      reg  burst_read_active;
      wire T156;
      wire T157;
      wire T158;
      wire T159;
      wire T160;
      wire T161;
      wire T162;
      wire T163;
      wire T164;
      wire T165;
      wire T166;
      reg  axi_rready;
      wire T167;
      wire T168;
      wire T169;
      wire T170;
      wire T171;
      wire T172;
      wire T173;
      wire T174;
      wire T175;
      wire T176;
      wire T177;
      wire T178;
      wire T179;
      wire T180;
      wire T181;
      wire T182;
      wire T183;
      wire T184;
      wire T185;
      wire T186;
      wire T187;
      wire T188;
      wire T189;
      wire T190;
      wire T191;
      wire T192;
      wire T193;
      wire T194;
      wire T195;
      wire T196;
      reg [4:0] read_index;
      wire[4:0] T197;
      wire[4:0] T198;
      wire[4:0] T199;
      wire T200;
      wire T201;
      wire T202;
      wire T203;
      wire[4:0] T204;
      wire T205;
      wire T206;
      wire T207;
      wire rnext;
      wire T208;
      wire T209;
      wire T210;
      wire T211;
      wire T212;
      wire T213;
      wire T214;
      wire T215;
      wire T216;
      wire T217;
      wire T218;
      wire T219;
      wire T220;
      wire T221;
      wire T222;
      wire T223;
      wire T224;
      wire T225;
      wire T226;
      wire T227;
      wire T228;
      wire T229;
      wire T230;
      wire T231;
      wire[5:0] T318;
      wire[30:0] T232;
      wire[30:0] T319;
      reg [5:0] axi_awaddr;
      wire[5:0] T320;
      wire[6:0] T233;
      wire[6:0] T234;
      wire[6:0] T321;
      wire[5:0] T235;
      wire T236;
      wire T237;
      wire T238;
      wire[6:0] T239;
      wire[6:0] burst_size_bytes;
      wire[6:0] T322;
      wire T240;
      wire T241;
      wire T242;
      wire[6:0] T323;
      wire T243;
      wire T244;
      reg  axi_wlast;
      wire T245;
      wire T246;
      wire T247;
      wire T248;
      wire T249;
      wire T250;
      wire T251;
      wire T252;
      wire T253;
      wire wnext;
      wire T254;
      reg  axi_wvalid;
      wire T255;
      wire T256;
      wire T257;
      wire T258;
      wire T259;
      wire T260;
      wire T261;
      wire T262;
      wire T263;
      wire T264;
      wire T265;
      wire T266;
      wire T267;
      wire T268;
      wire T269;
      wire T270;
      wire T271;
      wire T272;
      reg [4:0] write_index;
      wire[4:0] T273;
      wire[4:0] T274;
      wire[4:0] T275;
      wire T276;
      wire T277;
      wire T278;
      wire T279;
      wire T280;
      wire[4:0] T281;
      wire T282;
      wire T283;
      wire T284;
      wire T285;
      wire T286;
      wire T287;
      wire T288;
      wire T289;
      wire T290;
      wire T291;
      wire T292;
      wire T293;
      reg [31:0] axi_wdata;
      wire[31:0] T294;
      wire[31:0] T295;
      wire[31:0] T296;
      wire T297;
      wire T298;
      wire T299;
      wire[31:0] T300;
      wire T301;
      wire T302;
      wire T303;
      wire T304;
      wire[5:0] T324;
      wire[30:0] T305;
      wire[30:0] T325;
      reg [5:0] axi_araddr;
      wire[5:0] T326;
      wire[6:0] T306;
      wire[6:0] T307;
      wire[6:0] T327;
      wire[5:0] T308;
      wire T309;
      wire T310;
      wire T311;
      wire[6:0] T312;
      wire[6:0] T328;
      wire T313;
      wire T314;
      wire T315;
      wire[6:0] T329;
      wire T316;
      wire T317;
    
    `ifndef SYNTHESIS
    // synthesis translate_off
      integer initvar;
      initial begin
        #0.002;
        compare_done = {1{$random}};
        init_txn_ff = {1{$random}};
        init_txn_ff2 = {1{$random}};
        mst_exec_state = {1{$random}};
        writes_done = {1{$random}};
        axi_bready = {1{$random}};
        write_burst_counter = {1{$random}};
        axi_awvalid = {1{$random}};
        start_single_burst_write = {1{$random}};
        burst_write_active = {1{$random}};
        reads_done = {1{$random}};
        read_burst_counter = {1{$random}};
        axi_arvalid = {1{$random}};
        start_single_burst_read = {1{$random}};
        burst_read_active = {1{$random}};
        axi_rready = {1{$random}};
        read_index = {1{$random}};
        axi_awaddr = {1{$random}};
        axi_wlast = {1{$random}};
        axi_wvalid = {1{$random}};
        write_index = {1{$random}};
        axi_wdata = {1{$random}};
        axi_araddr = {1{$random}};
      end
    // synthesis translate_on
    `endif
    
      assign io_TXN_DONE = compare_done;
      assign T0 = T229 ? 1'h1 : T1;
      assign T1 = T4 ? 1'h0 : T2;
      assign T2 = T3 ? 1'h0 : compare_done;
      assign T3 = reset ^ 1'h1;
      assign T4 = T14 & T5;
      assign T5 = init_txn_pulse == 1'h1;
      assign init_txn_pulse = T6;
      assign T6 = T11 & init_txn_ff;
      assign T7 = T10 ? io_INIT_AXI_TXN : T8;
      assign T8 = T9 ? 1'h0 : init_txn_ff;
      assign T9 = reset ^ 1'h1;
      assign T10 = T9 ^ 1'h1;
      assign T11 = init_txn_ff2 ^ 1'h1;
      assign T12 = T10 ? init_txn_ff : T13;
      assign T13 = T9 ? 1'h0 : init_txn_ff2;
      assign T14 = T228 & T15;
      assign T15 = mst_exec_state == 2'h0;
      assign T16 = T223 ? 2'h0 : T17;
      assign T17 = T229 ? 2'h0 : T18;
      assign T18 = T221 ? 2'h2 : T19;
      assign T19 = T117 ? 2'h3 : T20;
      assign T20 = T115 ? 2'h1 : T21;
      assign T21 = T27 ? 2'h2 : T22;
      assign T22 = T25 ? 2'h0 : T23;
      assign T23 = T4 ? 2'h1 : T24;
      assign T24 = T3 ? 2'h0 : mst_exec_state;
      assign T25 = T14 & T26;
      assign T26 = T5 ^ 1'h1;
      assign T27 = T111 & writes_done;
      assign T28 = T109 ? writes_done : T29;
      assign T29 = T33 ? 1'h1 : T30;
      assign T30 = T31 ? 1'h0 : writes_done;
      assign T31 = T32 | init_txn_pulse;
      assign T32 = reset ^ 1'h1;
      assign T33 = T108 & T34;
      assign T34 = T51 & axi_bready;
      assign T35 = T49 ? axi_bready : T36;
      assign T36 = T46 ? 1'h0 : T37;
      assign T37 = T42 ? 1'h1 : T38;
      assign T38 = T39 ? 1'h0 : axi_bready;
      assign T39 = T41 | T40;
      assign T40 = init_txn_pulse == 1'h1;
      assign T41 = reset ^ 1'h1;
      assign T42 = T45 & T43;
      assign T43 = M_AXI_BVALID & T44;
      assign T44 = axi_bready ^ 1'h1;
      assign T45 = T39 ^ 1'h1;
      assign T46 = T47 & axi_bready;
      assign T47 = T48 ^ 1'h1;
      assign T48 = T39 | T43;
      assign T49 = T50 ^ 1'h1;
      assign T50 = T48 | axi_bready;
      assign T51 = M_AXI_BVALID & T52;
      assign T52 = write_burst_counter[6];
      assign T53 = T106 ? write_burst_counter : T54;
      assign T54 = T60 ? T59 : T55;
      assign T55 = T56 ? 7'h0 : write_burst_counter;
      assign T56 = T58 | T57;
      assign T57 = init_txn_pulse == 1'h1;
      assign T58 = reset ^ 1'h1;
      assign T59 = write_burst_counter + 7'h1;
      assign T60 = T63 & T61;
      assign T61 = T62 == 1'h0;
      assign T62 = write_burst_counter[6];
      assign T63 = T105 & T64;
      assign T64 = M_AXI_AWREADY & axi_awvalid;
      assign T65 = T103 ? axi_awvalid : T66;
      assign T66 = T99 ? 1'h0 : T67;
      assign T67 = T72 ? 1'h1 : T68;
      assign T68 = T69 ? 1'h0 : axi_awvalid;
      assign T69 = T71 | T70;
      assign T70 = init_txn_pulse == 1'h1;
      assign T71 = reset ^ 1'h1;
      assign T72 = T98 & T73;
      assign T73 = T97 & start_single_burst_write;
      assign T74 = T95 ? 1'h0 : T75;
      assign T75 = T77 ? 1'h1 : T76;
      assign T76 = T3 ? 1'h0 : start_single_burst_write;
      assign T77 = T115 & T78;
      assign T78 = T92 & T79;
      assign T79 = burst_write_active ^ 1'h1;
      assign T80 = T88 ? 1'h0 : T81;
      assign T81 = T86 ? 1'h1 : T82;
      assign T82 = T83 ? 1'h0 : burst_write_active;
      assign T83 = T85 | T84;
      assign T84 = init_txn_pulse == 1'h1;
      assign T85 = reset ^ 1'h1;
      assign T86 = T87 & start_single_burst_write;
      assign T87 = T83 ^ 1'h1;
      assign T88 = T90 & T89;
      assign T89 = M_AXI_BVALID & axi_bready;
      assign T90 = T91 ^ 1'h1;
      assign T91 = T83 | start_single_burst_write;
      assign T92 = T94 & T93;
      assign T93 = start_single_burst_write ^ 1'h1;
      assign T94 = axi_awvalid ^ 1'h1;
      assign T95 = T115 & T96;
      assign T96 = T78 ^ 1'h1;
      assign T97 = axi_awvalid ^ 1'h1;
      assign T98 = T69 ^ 1'h1;
      assign T99 = T101 & T100;
      assign T100 = M_AXI_AWREADY & axi_awvalid;
      assign T101 = T102 ^ 1'h1;
      assign T102 = T69 | T73;
      assign T103 = T104 ^ 1'h1;
      assign T104 = T102 | T100;
      assign T105 = T56 ^ 1'h1;
      assign T106 = T107 ^ 1'h1;
      assign T107 = T56 | T64;
      assign T108 = T31 ^ 1'h1;
      assign T109 = T110 ^ 1'h1;
      assign T110 = T31 | T34;
      assign T111 = T228 & T112;
      assign T112 = T114 & T113;
      assign T113 = mst_exec_state == 2'h1;
      assign T114 = T15 ^ 1'h1;
      assign T115 = T111 & T116;
      assign T116 = writes_done ^ 1'h1;
      assign T117 = T216 & reads_done;
      assign T118 = T214 ? reads_done : T119;
      assign T119 = T124 ? 1'h1 : T120;
      assign T120 = T121 ? 1'h0 : reads_done;
      assign T121 = T123 | T122;
      assign T122 = init_txn_pulse == 1'h1;
      assign T123 = reset ^ 1'h1;
      assign T124 = T213 & T125;
      assign T125 = T195 & T126;
      assign T126 = read_burst_counter[6];
      assign T127 = T193 ? read_burst_counter : T128;
      assign T128 = T134 ? T133 : T129;
      assign T129 = T130 ? 7'h0 : read_burst_counter;
      assign T130 = T132 | T131;
      assign T131 = init_txn_pulse == 1'h1;
      assign T132 = reset ^ 1'h1;
      assign T133 = read_burst_counter + 7'h1;
      assign T134 = T137 & T135;
      assign T135 = T136 == 1'h0;
      assign T136 = read_burst_counter[6];
      assign T137 = T192 & T138;
      assign T138 = M_AXI_ARREADY & axi_arvalid;
      assign T139 = T190 ? axi_arvalid : T140;
      assign T140 = T186 ? 1'h0 : T141;
      assign T141 = T146 ? 1'h1 : T142;
      assign T142 = T143 ? 1'h0 : axi_arvalid;
      assign T143 = T145 | T144;
      assign T144 = init_txn_pulse == 1'h1;
      assign T145 = reset ^ 1'h1;
      assign T146 = T185 & T147;
      assign T147 = T184 & start_single_burst_read;
      assign T148 = T182 ? 1'h0 : T149;
      assign T149 = T151 ? 1'h1 : T150;
      assign T150 = T3 ? 1'h0 : start_single_burst_read;
      assign T151 = T221 & T152;
      assign T152 = T154 & T153;
      assign T153 = start_single_burst_read ^ 1'h1;
      assign T154 = T181 & T155;
      assign T155 = burst_read_active ^ 1'h1;
      assign T156 = T164 ? 1'h0 : T157;
      assign T157 = T162 ? 1'h1 : T158;
      assign T158 = T159 ? 1'h0 : burst_read_active;
      assign T159 = T161 | T160;
      assign T160 = init_txn_pulse == 1'h1;
      assign T161 = reset ^ 1'h1;
      assign T162 = T163 & start_single_burst_read;
      assign T163 = T159 ^ 1'h1;
      assign T164 = T179 & T165;
      assign T165 = T166 & M_AXI_RLAST;
      assign T166 = M_AXI_RVALID & axi_rready;
      assign T167 = T177 ? 1'h1 : T168;
      assign T168 = T173 ? 1'h0 : T169;
      assign T169 = T170 ? 1'h0 : axi_rready;
      assign T170 = T172 | T171;
      assign T171 = init_txn_pulse == 1'h1;
      assign T172 = reset ^ 1'h1;
      assign T173 = T175 & T174;
      assign T174 = M_AXI_RLAST & axi_rready;
      assign T175 = T176 & M_AXI_RVALID;
      assign T176 = T170 ^ 1'h1;
      assign T177 = T175 & T178;
      assign T178 = T174 ^ 1'h1;
      assign T179 = T180 ^ 1'h1;
      assign T180 = T159 | start_single_burst_read;
      assign T181 = axi_arvalid ^ 1'h1;
      assign T182 = T221 & T183;
      assign T183 = T152 ^ 1'h1;
      assign T184 = axi_arvalid ^ 1'h1;
      assign T185 = T143 ^ 1'h1;
      assign T186 = T188 & T187;
      assign T187 = M_AXI_ARREADY & axi_arvalid;
      assign T188 = T189 ^ 1'h1;
      assign T189 = T143 | T147;
      assign T190 = T191 ^ 1'h1;
      assign T191 = T189 | T187;
      assign T192 = T130 ^ 1'h1;
      assign T193 = T194 ^ 1'h1;
      assign T194 = T130 | T138;
      assign T195 = T212 & T196;
      assign T196 = read_index == 5'hf;
      assign T197 = T210 ? read_index : T198;
      assign T198 = T205 ? T204 : T199;
      assign T199 = T200 ? 5'h0 : read_index;
      assign T200 = T201 | start_single_burst_read;
      assign T201 = T203 | T202;
      assign T202 = init_txn_pulse == 1'h1;
      assign T203 = reset ^ 1'h1;
      assign T204 = read_index + 5'h1;
      assign T205 = T209 & T206;
      assign T206 = rnext & T207;
      assign T207 = read_index != 5'hf;
      assign rnext = T208;
      assign T208 = M_AXI_RVALID & axi_rready;
      assign T209 = T200 ^ 1'h1;
      assign T210 = T211 ^ 1'h1;
      assign T211 = T200 | T206;
      assign T212 = M_AXI_RVALID & axi_rready;
      assign T213 = T121 ^ 1'h1;
      assign T214 = T215 ^ 1'h1;
      assign T215 = T121 | T125;
      assign T216 = T228 & T217;
      assign T217 = T219 & T218;
      assign T218 = mst_exec_state == 2'h2;
      assign T219 = T220 ^ 1'h1;
      assign T220 = T15 | T113;
      assign T221 = T216 & T222;
      assign T222 = reads_done ^ 1'h1;
      assign T223 = T228 & T224;
      assign T224 = T225 ^ 1'h1;
      assign T225 = T227 | T226;
      assign T226 = mst_exec_state == 2'h3;
      assign T227 = T220 | T218;
      assign T228 = T3 ^ 1'h1;
      assign T229 = T228 & T230;
      assign T230 = T231 & T226;
      assign T231 = T227 ^ 1'h1;
      assign M_AXI_BREADY = axi_bready;
      assign M_AXI_AWBURST = 2'h1;
      assign M_AXI_AWSIZE = 3'h2;
      assign M_AXI_AWLEN = 8'hf;
      assign M_AXI_AWADDR = T318;
      assign T318 = T232[5:0];
      assign T232 = 31'h40000000 + T319;
      assign T319 = {25'h0, axi_awaddr};
      assign T320 = T233[5:0];
      assign T233 = T243 ? T323 : T234;
      assign T234 = T240 ? T239 : T321;
      assign T321 = {1'h0, T235};
      assign T235 = T236 ? 6'h0 : axi_awaddr;
      assign T236 = T238 | T237;
      assign T237 = init_txn_pulse == 1'h1;
      assign T238 = reset ^ 1'h1;
      assign T239 = T322 + burst_size_bytes;
      assign burst_size_bytes = 7'h40;
      assign T322 = {1'h0, axi_awaddr};
      assign T240 = T242 & T241;
      assign T241 = M_AXI_AWREADY & axi_awvalid;
      assign T242 = T236 ^ 1'h1;
      assign T323 = {1'h0, axi_awaddr};
      assign T243 = T244 ^ 1'h1;
      assign T244 = T236 | T241;
      assign M_AXI_AWID = 6'h0;
      assign M_AXI_AWVALID = axi_awvalid;
      assign M_AXI_WLAST = axi_wlast;
      assign T245 = T292 ? axi_wlast : T246;
      assign T246 = T289 ? 1'h0 : T247;
      assign T247 = T252 ? 1'h1 : T248;
      assign T248 = T249 ? 1'h0 : axi_wlast;
      assign T249 = T251 | T250;
      assign T250 = init_txn_pulse == 1'h1;
      assign T251 = reset ^ 1'h1;
      assign T252 = T288 & T253;
      assign T253 = T272 & wnext;
      assign wnext = T254;
      assign T254 = M_AXI_WREADY & axi_wvalid;
      assign T255 = T270 ? axi_wvalid : T256;
      assign T256 = T266 ? 1'h0 : T257;
      assign T257 = T262 ? 1'h1 : T258;
      assign T258 = T259 ? 1'h0 : axi_wvalid;
      assign T259 = T261 | T260;
      assign T260 = init_txn_pulse == 1'h1;
      assign T261 = reset ^ 1'h1;
      assign T262 = T265 & T263;
      assign T263 = T264 & start_single_burst_write;
      assign T264 = axi_wvalid ^ 1'h1;
      assign T265 = T259 ^ 1'h1;
      assign T266 = T268 & T267;
      assign T267 = wnext & axi_wlast;
      assign T268 = T269 ^ 1'h1;
      assign T269 = T259 | T263;
      assign T270 = T271 ^ 1'h1;
      assign T271 = T269 | T267;
      assign T272 = write_index == 5'he;
      assign T273 = T286 ? write_index : T274;
      assign T274 = T282 ? T281 : T275;
      assign T275 = T276 ? 5'h0 : write_index;
      assign T276 = T278 | T277;
      assign T277 = start_single_burst_write == 1'h1;
      assign T278 = T280 | T279;
      assign T279 = init_txn_pulse == 1'h1;
      assign T280 = reset ^ 1'h1;
      assign T281 = write_index + 5'h1;
      assign T282 = T285 & T283;
      assign T283 = wnext & T284;
      assign T284 = write_index != 5'hf;
      assign T285 = T276 ^ 1'h1;
      assign T286 = T287 ^ 1'h1;
      assign T287 = T276 | T283;
      assign T288 = T249 ^ 1'h1;
      assign T289 = T290 & wnext;
      assign T290 = T291 ^ 1'h1;
      assign T291 = T249 | T253;
      assign T292 = T293 ^ 1'h1;
      assign T293 = T291 | wnext;
      assign M_AXI_WSTRB = 4'hf;
      assign M_AXI_WDATA = axi_wdata;
      assign T294 = T303 ? axi_wdata : T295;
      assign T295 = T301 ? T300 : T296;
      assign T296 = T297 ? 32'h1 : axi_wdata;
      assign T297 = T299 | T298;
      assign T298 = init_txn_pulse == 1'h1;
      assign T299 = reset ^ 1'h1;
      assign T300 = axi_wdata + 32'h1;
      assign T301 = T302 & wnext;
      assign T302 = T297 ^ 1'h1;
      assign T303 = T304 ^ 1'h1;
      assign T304 = T297 | wnext;
      assign M_AXI_WVALID = axi_wvalid;
      assign M_AXI_ARBURST = 2'h1;
      assign M_AXI_ARSIZE = 3'h2;
      assign M_AXI_ARLEN = 8'hf;
      assign M_AXI_ARADDR = T324;
      assign T324 = T305[5:0];
      assign T305 = T325 + 31'h40000000;
      assign T325 = {25'h0, axi_araddr};
      assign T326 = T306[5:0];
      assign T306 = T316 ? T329 : T307;
      assign T307 = T313 ? T312 : T327;
      assign T327 = {1'h0, T308};
      assign T308 = T309 ? 6'h0 : axi_araddr;
      assign T309 = T311 | T310;
      assign T310 = init_txn_pulse == 1'h1;
      assign T311 = reset ^ 1'h1;
      assign T312 = T328 + burst_size_bytes;
      assign T328 = {1'h0, axi_araddr};
      assign T313 = T315 & T314;
      assign T314 = M_AXI_ARREADY & axi_arvalid;
      assign T315 = T309 ^ 1'h1;
      assign T329 = {1'h0, axi_araddr};
      assign T316 = T317 ^ 1'h1;
      assign T317 = T309 | T314;
      assign M_AXI_ARID = 6'h0;
      assign M_AXI_ARVALID = axi_arvalid;
      assign M_AXI_RREADY = axi_rready;
    
      always @(posedge clk) begin
        if(T229) begin
          compare_done <= 1'h1;
        end else if(T4) begin
          compare_done <= 1'h0;
        end else if(T3) begin
          compare_done <= 1'h0;
        end
        if(T10) begin
          init_txn_ff <= io_INIT_AXI_TXN;
        end else if(T9) begin
          init_txn_ff <= 1'h0;
        end
        if(T10) begin
          init_txn_ff2 <= init_txn_ff;
        end else if(T9) begin
          init_txn_ff2 <= 1'h0;
        end
        if(T223) begin
          mst_exec_state <= 2'h0;
        end else if(T229) begin
          mst_exec_state <= 2'h0;
        end else if(T221) begin
          mst_exec_state <= 2'h2;
        end else if(T117) begin
          mst_exec_state <= 2'h3;
        end else if(T115) begin
          mst_exec_state <= 2'h1;
        end else if(T27) begin
          mst_exec_state <= 2'h2;
        end else if(T25) begin
          mst_exec_state <= 2'h0;
        end else if(T4) begin
          mst_exec_state <= 2'h1;
        end else if(T3) begin
          mst_exec_state <= 2'h0;
        end
        if(T109) begin
          writes_done <= writes_done;
        end else if(T33) begin
          writes_done <= 1'h1;
        end else if(T31) begin
          writes_done <= 1'h0;
        end
        if(T49) begin
          axi_bready <= axi_bready;
        end else if(T46) begin
          axi_bready <= 1'h0;
        end else if(T42) begin
          axi_bready <= 1'h1;
        end else if(T39) begin
          axi_bready <= 1'h0;
        end
        if(T106) begin
          write_burst_counter <= write_burst_counter;
        end else if(T60) begin
          write_burst_counter <= T59;
        end else if(T56) begin
          write_burst_counter <= 7'h0;
        end
        if(T103) begin
          axi_awvalid <= axi_awvalid;
        end else if(T99) begin
          axi_awvalid <= 1'h0;
        end else if(T72) begin
          axi_awvalid <= 1'h1;
        end else if(T69) begin
          axi_awvalid <= 1'h0;
        end
        if(T95) begin
          start_single_burst_write <= 1'h0;
        end else if(T77) begin
          start_single_burst_write <= 1'h1;
        end else if(T3) begin
          start_single_burst_write <= 1'h0;
        end
        if(T88) begin
          burst_write_active <= 1'h0;
        end else if(T86) begin
          burst_write_active <= 1'h1;
        end else if(T83) begin
          burst_write_active <= 1'h0;
        end
        if(T214) begin
          reads_done <= reads_done;
        end else if(T124) begin
          reads_done <= 1'h1;
        end else if(T121) begin
          reads_done <= 1'h0;
        end
        if(T193) begin
          read_burst_counter <= read_burst_counter;
        end else if(T134) begin
          read_burst_counter <= T133;
        end else if(T130) begin
          read_burst_counter <= 7'h0;
        end
        if(T190) begin
          axi_arvalid <= axi_arvalid;
        end else if(T186) begin
          axi_arvalid <= 1'h0;
        end else if(T146) begin
          axi_arvalid <= 1'h1;
        end else if(T143) begin
          axi_arvalid <= 1'h0;
        end
        if(T182) begin
          start_single_burst_read <= 1'h0;
        end else if(T151) begin
          start_single_burst_read <= 1'h1;
        end else if(T3) begin
          start_single_burst_read <= 1'h0;
        end
        if(T164) begin
          burst_read_active <= 1'h0;
        end else if(T162) begin
          burst_read_active <= 1'h1;
        end else if(T159) begin
          burst_read_active <= 1'h0;
        end
        if(T177) begin
          axi_rready <= 1'h1;
        end else if(T173) begin
          axi_rready <= 1'h0;
        end else if(T170) begin
          axi_rready <= 1'h0;
        end
        if(T210) begin
          read_index <= read_index;
        end else if(T205) begin
          read_index <= T204;
        end else if(T200) begin
          read_index <= 5'h0;
        end
        axi_awaddr <= T320;
        if(T292) begin
          axi_wlast <= axi_wlast;
        end else if(T289) begin
          axi_wlast <= 1'h0;
        end else if(T252) begin
          axi_wlast <= 1'h1;
        end else if(T249) begin
          axi_wlast <= 1'h0;
        end
        if(T270) begin
          axi_wvalid <= axi_wvalid;
        end else if(T266) begin
          axi_wvalid <= 1'h0;
        end else if(T262) begin
          axi_wvalid <= 1'h1;
        end else if(T259) begin
          axi_wvalid <= 1'h0;
        end
        if(T286) begin
          write_index <= write_index;
        end else if(T282) begin
          write_index <= T281;
        end else if(T276) begin
          write_index <= 5'h0;
        end
        if(T303) begin
          axi_wdata <= axi_wdata;
        end else if(T301) begin
          axi_wdata <= T300;
        end else if(T297) begin
          axi_wdata <= 32'h1;
        end
        axi_araddr <= T326;
      end
    endmodule
