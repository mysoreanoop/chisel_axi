module testSlave(input clk, input reset,
    input  S_AXI_RREADY,
    output S_AXI_RVALID,
    output[5:0] S_AXI_RID,
    output[31:0] S_AXI_RDATA,
    output[1:0] S_AXI_RRESP,
    output S_AXI_RLAST,
    output S_AXI_ARREADY,
    input  S_AXI_ARVALID,
    input [5:0] S_AXI_ARID,
    input [5:0] S_AXI_ARADDR,
    input [7:0] S_AXI_ARLEN,
    input [2:0] S_AXI_ARSIZE,
    input [1:0] S_AXI_ARBURST,
    output S_AXI_WREADY,
    input  S_AXI_WVALID,
    input [31:0] S_AXI_WDATA,
    input [3:0] S_AXI_WSTRB,
    input  S_AXI_WLAST,
    output S_AXI_AWREADY,
    input  S_AXI_AWVALID,
    input [5:0] S_AXI_AWID,
    input [5:0] S_AXI_AWADDR,
    input [7:0] S_AXI_AWLEN,
    input [2:0] S_AXI_AWSIZE,
    input [1:0] S_AXI_AWBURST,
    input  S_AXI_BREADY,
    output S_AXI_BVALID,
    output[5:0] S_AXI_BID,
    output[1:0] S_AXI_BRESP
);

  reg [1:0] axi_bresp;
  wire[1:0] T0;
  wire[1:0] T1;
  wire T2;
  wire T3;
  wire T4;
  wire T5;
  wire T6;
  reg  axi_bvalid;
  wire T7;
  wire T8;
  wire T9;
  wire T10;
  wire T11;
  wire T12;
  wire T13;
  wire T14;
  wire T15;
  reg  axi_wready;
  wire T16;
  wire T17;
  wire T18;
  wire T19;
  wire T20;
  wire T21;
  wire T22;
  wire T23;
  wire T24;
  wire T25;
  wire T26;
  wire T27;
  wire T28;
  reg  axi_awv_awr_flag;
  wire T29;
  wire T30;
  wire T31;
  wire T32;
  wire T33;
  wire T34;
  wire T35;
  reg  axi_arv_arr_flag;
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
  reg  axi_arready;
  wire T47;
  wire T48;
  wire T49;
  wire T50;
  wire T51;
  wire T52;
  wire T53;
  wire T54;
  reg [7:0] axi_arlen;
  wire[7:0] T55;
  wire[7:0] T56;
  wire T57;
  wire T58;
  wire T59;
  wire T60;
  wire T61;
  wire T62;
  wire T63;
  reg [7:0] axi_arlen_cntr;
  wire[7:0] T64;
  wire[7:0] T65;
  wire[7:0] T66;
  wire[7:0] T67;
  wire T68;
  wire T69;
  wire T70;
  wire T71;
  reg  axi_rvalid;
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
  reg  axi_awready;
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
  reg  axi_rlast;
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
  wire T118;
  wire T119;
  wire T120;
  wire T121;
  wire T122;
  wire T123;
  reg [1:0] axi_rresp;
  wire[1:0] T124;
  wire[1:0] T125;
  reg [31:0] axi_rdata;
  wire[31:0] T126;
  wire[31:0] data_out;
  wire[31:0] T127;
  wire[31:0] T128;
  wire[31:0] T129;
  wire[31:0] T130;
  reg [31:0] bram_0;
  wire[31:0] T131;
  wire[31:0] T132;
  wire T133;
  wire[31:0] data_in;
  wire T134;
  wire T135;
  wire[15:0] T136;
  wire[3:0] T137;
  wire[3:0] mem_address;
  wire[3:0] T138;
  wire[3:0] T139;
  wire[3:0] T140;
  reg [5:0] axi_awaddr;
  wire[5:0] T325;
  wire[6:0] T141;
  wire[6:0] T142;
  wire[6:0] T143;
  wire[6:0] T326;
  wire[5:0] T144;
  wire[5:0] T145;
  wire[5:0] T146;
  wire T147;
  wire T148;
  wire T149;
  wire T150;
  wire T151;
  wire T152;
  wire T153;
  wire T154;
  wire T155;
  reg [1:0] axi_awburst;
  wire[1:0] T156;
  wire[1:0] T157;
  wire T158;
  wire T159;
  wire T160;
  wire T161;
  wire T162;
  reg [7:0] axi_awlen;
  wire[7:0] T163;
  wire[7:0] T164;
  reg [7:0] axi_awlen_cntr;
  wire[7:0] T165;
  wire[7:0] T166;
  wire[7:0] T167;
  wire[7:0] T168;
  wire T169;
  wire[6:0] T170;
  wire[6:0] T327;
  wire[5:0] T171;
  wire[3:0] T172;
  wire[3:0] T173;
  wire[3:0] T174;
  wire[6:0] T175;
  wire[6:0] T176;
  wire[6:0] T177;
  wire[6:0] T328;
  wire[6:0] T178;
  wire[6:0] T179;
  wire[6:0] T329;
  wire[2:0] T180;
  wire[2:0] T181;
  wire[3:0] T330;
  wire T331;
  wire T182;
  wire T183;
  wire T184;
  wire T185;
  wire[6:0] T332;
  wire[3:0] T186;
  wire[3:0] T187;
  wire T188;
  wire T189;
  wire T190;
  wire[3:0] T191;
  reg [5:0] axi_araddr;
  wire[5:0] T333;
  wire[6:0] T192;
  wire[6:0] T193;
  wire[6:0] T194;
  wire[6:0] T334;
  wire[5:0] T195;
  wire[5:0] T196;
  wire[5:0] T197;
  wire T198;
  wire T199;
  reg [1:0] axi_arburst;
  wire[1:0] T200;
  wire[1:0] T201;
  wire[6:0] T202;
  wire[6:0] T335;
  wire[5:0] T203;
  wire[3:0] T204;
  wire[3:0] T205;
  wire[3:0] T206;
  wire[6:0] T207;
  wire[6:0] T208;
  wire[6:0] T209;
  wire[6:0] T336;
  wire[6:0] T210;
  wire[6:0] T211;
  wire[6:0] T337;
  wire[2:0] T212;
  wire[2:0] T213;
  wire[3:0] T338;
  wire T339;
  wire T214;
  wire T215;
  wire T216;
  wire T217;
  wire[6:0] T340;
  wire[3:0] T218;
  wire[3:0] T219;
  wire T220;
  wire T221;
  wire T222;
  wire mem_wren;
  wire T223;
  reg [31:0] bram_1;
  wire[31:0] T224;
  wire[31:0] T225;
  wire T226;
  wire T227;
  wire T228;
  wire T229;
  wire[31:0] T230;
  reg [31:0] bram_2;
  wire[31:0] T231;
  wire[31:0] T232;
  wire T233;
  wire T234;
  wire T235;
  reg [31:0] bram_3;
  wire[31:0] T236;
  wire[31:0] T237;
  wire T238;
  wire T239;
  wire T240;
  wire T241;
  wire T242;
  wire[31:0] T243;
  wire[31:0] T244;
  reg [31:0] bram_4;
  wire[31:0] T245;
  wire[31:0] T246;
  wire T247;
  wire T248;
  wire T249;
  reg [31:0] bram_5;
  wire[31:0] T250;
  wire[31:0] T251;
  wire T252;
  wire T253;
  wire T254;
  wire T255;
  wire[31:0] T256;
  reg [31:0] bram_6;
  wire[31:0] T257;
  wire[31:0] T258;
  wire T259;
  wire T260;
  wire T261;
  reg [31:0] bram_7;
  wire[31:0] T262;
  wire[31:0] T263;
  wire T264;
  wire T265;
  wire T266;
  wire T267;
  wire T268;
  wire T269;
  wire[31:0] T270;
  wire[31:0] T271;
  wire[31:0] T272;
  reg [31:0] bram_8;
  wire[31:0] T273;
  wire[31:0] T274;
  wire T275;
  wire T276;
  wire T277;
  reg [31:0] bram_9;
  wire[31:0] T278;
  wire[31:0] T279;
  wire T280;
  wire T281;
  wire T282;
  wire T283;
  wire[31:0] T284;
  reg [31:0] bram_10;
  wire[31:0] T285;
  wire[31:0] T286;
  wire T287;
  wire T288;
  wire T289;
  reg [31:0] bram_11;
  wire[31:0] T290;
  wire[31:0] T291;
  wire T292;
  wire T293;
  wire T294;
  wire T295;
  wire T296;
  wire[31:0] T297;
  wire[31:0] T298;
  reg [31:0] bram_12;
  wire[31:0] T299;
  wire[31:0] T300;
  wire T301;
  wire T302;
  wire T303;
  reg [31:0] bram_13;
  wire[31:0] T304;
  wire[31:0] T305;
  wire T306;
  wire T307;
  wire T308;
  wire T309;
  wire[31:0] T310;
  reg [31:0] bram_14;
  wire[31:0] T311;
  wire[31:0] T312;
  wire T313;
  wire T314;
  wire T315;
  reg [31:0] bram_15;
  wire[31:0] T316;
  wire[31:0] T317;
  wire T318;
  wire T319;
  wire T320;
  wire T321;
  wire T322;
  wire T323;
  wire T324;
  wire mem_rden;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    axi_bresp = {1{$random}};
    axi_bvalid = {1{$random}};
    axi_wready = {1{$random}};
    axi_awv_awr_flag = {1{$random}};
    axi_arv_arr_flag = {1{$random}};
    axi_arready = {1{$random}};
    axi_arlen = {1{$random}};
    axi_arlen_cntr = {1{$random}};
    axi_rvalid = {1{$random}};
    axi_awready = {1{$random}};
    axi_rlast = {1{$random}};
    axi_rresp = {1{$random}};
    axi_rdata = {1{$random}};
    bram_0 = {1{$random}};
    axi_awaddr = {1{$random}};
    axi_awburst = {1{$random}};
    axi_awlen = {1{$random}};
    axi_awlen_cntr = {1{$random}};
    axi_araddr = {1{$random}};
    axi_arburst = {1{$random}};
    bram_1 = {1{$random}};
    bram_2 = {1{$random}};
    bram_3 = {1{$random}};
    bram_4 = {1{$random}};
    bram_5 = {1{$random}};
    bram_6 = {1{$random}};
    bram_7 = {1{$random}};
    bram_8 = {1{$random}};
    bram_9 = {1{$random}};
    bram_10 = {1{$random}};
    bram_11 = {1{$random}};
    bram_12 = {1{$random}};
    bram_13 = {1{$random}};
    bram_14 = {1{$random}};
    bram_15 = {1{$random}};
  end
// synthesis translate_on
`endif

  assign S_AXI_BRESP = axi_bresp;
  assign T0 = T3 ? 2'h0 : T1;
  assign T1 = T2 ? 2'h0 : axi_bresp;
  assign T2 = reset ^ 1'h1;
  assign T3 = T106 & T4;
  assign T4 = T5 & S_AXI_WLAST;
  assign T5 = T14 & T6;
  assign T6 = ~ axi_bvalid;
  assign T7 = T10 ? 1'h0 : T8;
  assign T8 = T3 ? 1'h1 : T9;
  assign T9 = T2 ? 1'h0 : axi_bvalid;
  assign T10 = T12 & T11;
  assign T11 = S_AXI_BREADY & axi_bvalid;
  assign T12 = T106 & T13;
  assign T13 = T4 ^ 1'h1;
  assign T14 = T15 & S_AXI_WVALID;
  assign T15 = axi_awv_awr_flag & axi_wready;
  assign T16 = T25 ? 1'h0 : T17;
  assign T17 = T20 ? 1'h1 : T18;
  assign T18 = T19 ? 1'h0 : axi_wready;
  assign T19 = reset ^ 1'h1;
  assign T20 = T24 & T21;
  assign T21 = T22 & axi_awv_awr_flag;
  assign T22 = T23 & S_AXI_WVALID;
  assign T23 = axi_wready ^ 1'h1;
  assign T24 = T19 ^ 1'h1;
  assign T25 = T24 & T26;
  assign T26 = T28 & T27;
  assign T27 = S_AXI_WLAST & axi_wready;
  assign T28 = T21 ^ 1'h1;
  assign T29 = T103 ? 1'h0 : T30;
  assign T30 = T33 ? 1'h1 : T31;
  assign T31 = T32 ? 1'h0 : axi_awv_awr_flag;
  assign T32 = reset ^ 1'h1;
  assign T33 = T102 & T34;
  assign T34 = T91 & T35;
  assign T35 = axi_arv_arr_flag ^ 1'h1;
  assign T36 = T88 ? 1'h0 : T37;
  assign T37 = T40 ? 1'h1 : T38;
  assign T38 = T39 ? 1'h0 : axi_arv_arr_flag;
  assign T39 = reset ^ 1'h1;
  assign T40 = T87 & T41;
  assign T41 = T43 & T42;
  assign T42 = axi_arv_arr_flag ^ 1'h1;
  assign T43 = T45 & T44;
  assign T44 = axi_awv_awr_flag ^ 1'h1;
  assign T45 = T46 & S_AXI_ARVALID;
  assign T46 = axi_arready ^ 1'h1;
  assign T47 = T50 ? 1'h0 : T48;
  assign T48 = T40 ? 1'h1 : T49;
  assign T49 = T39 ? 1'h0 : axi_arready;
  assign T50 = T87 & T51;
  assign T51 = T52 ^ 1'h1;
  assign T52 = T41 | T53;
  assign T53 = T86 & T54;
  assign T54 = axi_arlen_cntr == axi_arlen;
  assign T55 = T58 ? S_AXI_ARLEN : T56;
  assign T56 = T57 ? 8'h0 : axi_arlen;
  assign T57 = reset ^ 1'h1;
  assign T58 = T63 & T59;
  assign T59 = T61 & T60;
  assign T60 = axi_arv_arr_flag ^ 1'h1;
  assign T61 = T62 & S_AXI_ARVALID;
  assign T62 = axi_arready ^ 1'h1;
  assign T63 = T57 ^ 1'h1;
  assign T64 = T68 ? T67 : T65;
  assign T65 = T58 ? 8'h0 : T66;
  assign T66 = T57 ? 8'h0 : axi_arlen_cntr;
  assign T67 = axi_arlen_cntr + 8'h1;
  assign T68 = T63 & T69;
  assign T69 = T85 & T70;
  assign T70 = T71 & S_AXI_RREADY;
  assign T71 = T84 & axi_rvalid;
  assign T72 = T80 ? 1'h0 : T73;
  assign T73 = T76 ? 1'h1 : T74;
  assign T74 = T75 ? 1'h0 : axi_rvalid;
  assign T75 = reset ^ 1'h1;
  assign T76 = T79 & T77;
  assign T77 = axi_arv_arr_flag & T78;
  assign T78 = axi_rvalid ^ 1'h1;
  assign T79 = T75 ^ 1'h1;
  assign T80 = T79 & T81;
  assign T81 = T83 & T82;
  assign T82 = axi_rvalid & S_AXI_RREADY;
  assign T83 = T77 ^ 1'h1;
  assign T84 = axi_arlen_cntr <= axi_arlen;
  assign T85 = T59 ^ 1'h1;
  assign T86 = axi_rvalid & S_AXI_RREADY;
  assign T87 = T39 ^ 1'h1;
  assign T88 = T87 & T89;
  assign T89 = T90 & T53;
  assign T90 = T41 ^ 1'h1;
  assign T91 = T93 & T92;
  assign T92 = axi_awv_awr_flag ^ 1'h1;
  assign T93 = T94 & S_AXI_AWVALID;
  assign T94 = axi_awready ^ 1'h1;
  assign T95 = T98 ? 1'h0 : T96;
  assign T96 = T33 ? 1'h1 : T97;
  assign T97 = T32 ? 1'h0 : axi_awready;
  assign T98 = T102 & T99;
  assign T99 = T100 ^ 1'h1;
  assign T100 = T34 | T101;
  assign T101 = S_AXI_WLAST & axi_wready;
  assign T102 = T32 ^ 1'h1;
  assign T103 = T102 & T104;
  assign T104 = T105 & T101;
  assign T105 = T34 ^ 1'h1;
  assign T106 = T2 ^ 1'h1;
  assign S_AXI_BID = S_AXI_AWID;
  assign S_AXI_BVALID = axi_bvalid;
  assign S_AXI_AWREADY = axi_awready;
  assign S_AXI_WREADY = axi_wready;
  assign S_AXI_ARREADY = axi_arready;
  assign S_AXI_RLAST = axi_rlast;
  assign T107 = T120 ? 1'h0 : T108;
  assign T108 = T112 ? 1'h1 : T109;
  assign T109 = T68 ? 1'h0 : T110;
  assign T110 = T58 ? 1'h0 : T111;
  assign T111 = T57 ? 1'h0 : axi_rlast;
  assign T112 = T63 & T113;
  assign T113 = T118 & T114;
  assign T114 = T115 & axi_arv_arr_flag;
  assign T115 = T117 & T116;
  assign T116 = axi_rlast ^ 1'h1;
  assign T117 = axi_arlen_cntr == axi_arlen;
  assign T118 = T119 ^ 1'h1;
  assign T119 = T59 | T70;
  assign T120 = T63 & T121;
  assign T121 = T122 & S_AXI_RREADY;
  assign T122 = T123 ^ 1'h1;
  assign T123 = T119 | T114;
  assign S_AXI_RRESP = axi_rresp;
  assign T124 = T76 ? 2'h0 : T125;
  assign T125 = T75 ? 2'h0 : axi_rresp;
  assign S_AXI_RDATA = axi_rdata;
  assign T126 = mem_rden ? data_out : axi_rdata;
  assign data_out = T127;
  assign T127 = T324 ? T270 : T128;
  assign T128 = T269 ? T243 : T129;
  assign T129 = T242 ? T230 : T130;
  assign T130 = T229 ? bram_1 : bram_0;
  assign T131 = T134 ? data_in : T132;
  assign T132 = T133 ? 32'h1 : bram_0;
  assign T133 = reset ^ 1'h1;
  assign data_in = S_AXI_WDATA;
  assign T134 = mem_wren & T135;
  assign T135 = T136[0];
  assign T136 = 1'h1 << T137;
  assign T137 = mem_address;
  assign mem_address = T138;
  assign T138 = axi_arv_arr_flag ? T191 : T139;
  assign T139 = axi_awv_awr_flag ? T140 : 4'h0;
  assign T140 = axi_awaddr[5:2];
  assign T325 = T141[5:0];
  assign T141 = T188 ? T332 : T142;
  assign T142 = T182 ? T178 : T143;
  assign T143 = T182 ? T170 : T326;
  assign T326 = {1'h0, T144};
  assign T144 = T154 ? axi_awaddr : T145;
  assign T145 = T148 ? S_AXI_AWADDR : T146;
  assign T146 = T147 ? 6'h0 : axi_awaddr;
  assign T147 = reset ^ 1'h1;
  assign T148 = T153 & T149;
  assign T149 = T151 & T150;
  assign T150 = axi_awv_awr_flag ^ 1'h1;
  assign T151 = T152 & S_AXI_AWVALID;
  assign T152 = axi_awready ^ 1'h1;
  assign T153 = T147 ^ 1'h1;
  assign T154 = T158 & T155;
  assign T155 = axi_awburst == 2'h0;
  assign T156 = T148 ? S_AXI_AWBURST : T157;
  assign T157 = T147 ? 2'h0 : axi_awburst;
  assign T158 = T153 & T159;
  assign T159 = T169 & T160;
  assign T160 = T161 & S_AXI_WVALID;
  assign T161 = T162 & axi_wready;
  assign T162 = axi_awlen_cntr <= axi_awlen;
  assign T163 = T148 ? S_AXI_AWLEN : T164;
  assign T164 = T147 ? 8'h0 : axi_awlen;
  assign T165 = T158 ? T168 : T166;
  assign T166 = T148 ? 8'h0 : T167;
  assign T167 = T147 ? 8'h0 : axi_awlen_cntr;
  assign T168 = axi_awlen_cntr + 8'h1;
  assign T169 = T149 ^ 1'h1;
  assign T170 = T175 | T327;
  assign T327 = {1'h0, T171};
  assign T171 = T172 << 2'h2;
  assign T172 = T173 & 4'hf;
  assign T173 = T174 + 4'h1;
  assign T174 = axi_awaddr[5:2];
  assign T175 = T328 & T176;
  assign T176 = ~ T177;
  assign T177 = 7'h3c;
  assign T328 = {1'h0, T144};
  assign T178 = T179 | 7'h0;
  assign T179 = T143 & T329;
  assign T329 = {T330, T180};
  assign T180 = ~ T181;
  assign T181 = 3'h3;
  assign T330 = T331 ? 4'hf : 4'h0;
  assign T331 = T180[2];
  assign T182 = T158 & T183;
  assign T183 = T185 & T184;
  assign T184 = axi_awburst == 2'h1;
  assign T185 = T155 ^ 1'h1;
  assign T332 = {3'h0, T186};
  assign T186 = T187 + 4'h1;
  assign T187 = axi_awaddr[5:2];
  assign T188 = T158 & T189;
  assign T189 = T190 ^ 1'h1;
  assign T190 = T155 | T184;
  assign T191 = axi_araddr[5:2];
  assign T333 = T192[5:0];
  assign T192 = T220 ? T340 : T193;
  assign T193 = T214 ? T210 : T194;
  assign T194 = T214 ? T202 : T334;
  assign T334 = {1'h0, T195};
  assign T195 = T198 ? axi_araddr : T196;
  assign T196 = T58 ? S_AXI_ARADDR : T197;
  assign T197 = T57 ? 6'h0 : axi_araddr;
  assign T198 = T68 & T199;
  assign T199 = axi_arburst == 2'h0;
  assign T200 = T58 ? S_AXI_ARBURST : T201;
  assign T201 = T57 ? 2'h0 : axi_arburst;
  assign T202 = T207 | T335;
  assign T335 = {1'h0, T203};
  assign T203 = T204 << 2'h2;
  assign T204 = T205 & 4'hf;
  assign T205 = T206 + 4'h1;
  assign T206 = axi_araddr[5:2];
  assign T207 = T336 & T208;
  assign T208 = ~ T209;
  assign T209 = 7'h3c;
  assign T336 = {1'h0, T195};
  assign T210 = T211 | 7'h0;
  assign T211 = T194 & T337;
  assign T337 = {T338, T212};
  assign T212 = ~ T213;
  assign T213 = 3'h3;
  assign T338 = T339 ? 4'hf : 4'h0;
  assign T339 = T212[2];
  assign T214 = T68 & T215;
  assign T215 = T217 & T216;
  assign T216 = axi_arburst == 2'h1;
  assign T217 = T199 ^ 1'h1;
  assign T340 = {3'h0, T218};
  assign T218 = T219 + 4'h1;
  assign T219 = axi_araddr[5:2];
  assign T220 = T68 & T221;
  assign T221 = T222 ^ 1'h1;
  assign T222 = T199 | T216;
  assign mem_wren = T223;
  assign T223 = axi_wready & S_AXI_WVALID;
  assign T224 = T227 ? data_in : T225;
  assign T225 = T226 ? 32'h2 : bram_1;
  assign T226 = reset ^ 1'h1;
  assign T227 = mem_wren & T228;
  assign T228 = T136[1];
  assign T229 = T137[0];
  assign T230 = T241 ? bram_3 : bram_2;
  assign T231 = T234 ? data_in : T232;
  assign T232 = T233 ? 32'h4 : bram_2;
  assign T233 = reset ^ 1'h1;
  assign T234 = mem_wren & T235;
  assign T235 = T136[2];
  assign T236 = T239 ? data_in : T237;
  assign T237 = T238 ? 32'h8 : bram_3;
  assign T238 = reset ^ 1'h1;
  assign T239 = mem_wren & T240;
  assign T240 = T136[3];
  assign T241 = T137[0];
  assign T242 = T137[1];
  assign T243 = T268 ? T256 : T244;
  assign T244 = T255 ? bram_5 : bram_4;
  assign T245 = T248 ? data_in : T246;
  assign T246 = T247 ? 32'h10 : bram_4;
  assign T247 = reset ^ 1'h1;
  assign T248 = mem_wren & T249;
  assign T249 = T136[4];
  assign T250 = T253 ? data_in : T251;
  assign T251 = T252 ? 32'h20 : bram_5;
  assign T252 = reset ^ 1'h1;
  assign T253 = mem_wren & T254;
  assign T254 = T136[5];
  assign T255 = T137[0];
  assign T256 = T267 ? bram_7 : bram_6;
  assign T257 = T260 ? data_in : T258;
  assign T258 = T259 ? 32'h40 : bram_6;
  assign T259 = reset ^ 1'h1;
  assign T260 = mem_wren & T261;
  assign T261 = T136[6];
  assign T262 = T265 ? data_in : T263;
  assign T263 = T264 ? 32'h80 : bram_7;
  assign T264 = reset ^ 1'h1;
  assign T265 = mem_wren & T266;
  assign T266 = T136[7];
  assign T267 = T137[0];
  assign T268 = T137[1];
  assign T269 = T137[2];
  assign T270 = T323 ? T297 : T271;
  assign T271 = T296 ? T284 : T272;
  assign T272 = T283 ? bram_9 : bram_8;
  assign T273 = T276 ? data_in : T274;
  assign T274 = T275 ? 32'h100 : bram_8;
  assign T275 = reset ^ 1'h1;
  assign T276 = mem_wren & T277;
  assign T277 = T136[8];
  assign T278 = T281 ? data_in : T279;
  assign T279 = T280 ? 32'h200 : bram_9;
  assign T280 = reset ^ 1'h1;
  assign T281 = mem_wren & T282;
  assign T282 = T136[9];
  assign T283 = T137[0];
  assign T284 = T295 ? bram_11 : bram_10;
  assign T285 = T288 ? data_in : T286;
  assign T286 = T287 ? 32'h400 : bram_10;
  assign T287 = reset ^ 1'h1;
  assign T288 = mem_wren & T289;
  assign T289 = T136[10];
  assign T290 = T293 ? data_in : T291;
  assign T291 = T292 ? 32'h800 : bram_11;
  assign T292 = reset ^ 1'h1;
  assign T293 = mem_wren & T294;
  assign T294 = T136[11];
  assign T295 = T137[0];
  assign T296 = T137[1];
  assign T297 = T322 ? T310 : T298;
  assign T298 = T309 ? bram_13 : bram_12;
  assign T299 = T302 ? data_in : T300;
  assign T300 = T301 ? 32'h1000 : bram_12;
  assign T301 = reset ^ 1'h1;
  assign T302 = mem_wren & T303;
  assign T303 = T136[12];
  assign T304 = T307 ? data_in : T305;
  assign T305 = T306 ? 32'h2000 : bram_13;
  assign T306 = reset ^ 1'h1;
  assign T307 = mem_wren & T308;
  assign T308 = T136[13];
  assign T309 = T137[0];
  assign T310 = T321 ? bram_15 : bram_14;
  assign T311 = T314 ? data_in : T312;
  assign T312 = T313 ? 32'h4000 : bram_14;
  assign T313 = reset ^ 1'h1;
  assign T314 = mem_wren & T315;
  assign T315 = T136[14];
  assign T316 = T319 ? data_in : T317;
  assign T317 = T318 ? 32'h8000 : bram_15;
  assign T318 = reset ^ 1'h1;
  assign T319 = mem_wren & T320;
  assign T320 = T136[15];
  assign T321 = T137[0];
  assign T322 = T137[1];
  assign T323 = T137[2];
  assign T324 = T137[3];
  assign mem_rden = axi_arv_arr_flag;
  assign S_AXI_RID = S_AXI_ARID;
  assign S_AXI_RVALID = axi_rvalid;

  always @(posedge clk) begin
    if(T3) begin
      axi_bresp <= 2'h0;
    end else if(T2) begin
      axi_bresp <= 2'h0;
    end
    if(T10) begin
      axi_bvalid <= 1'h0;
    end else if(T3) begin
      axi_bvalid <= 1'h1;
    end else if(T2) begin
      axi_bvalid <= 1'h0;
    end
    if(T25) begin
      axi_wready <= 1'h0;
    end else if(T20) begin
      axi_wready <= 1'h1;
    end else if(T19) begin
      axi_wready <= 1'h0;
    end
    if(T103) begin
      axi_awv_awr_flag <= 1'h0;
    end else if(T33) begin
      axi_awv_awr_flag <= 1'h1;
    end else if(T32) begin
      axi_awv_awr_flag <= 1'h0;
    end
    if(T88) begin
      axi_arv_arr_flag <= 1'h0;
    end else if(T40) begin
      axi_arv_arr_flag <= 1'h1;
    end else if(T39) begin
      axi_arv_arr_flag <= 1'h0;
    end
    if(T50) begin
      axi_arready <= 1'h0;
    end else if(T40) begin
      axi_arready <= 1'h1;
    end else if(T39) begin
      axi_arready <= 1'h0;
    end
    if(T58) begin
      axi_arlen <= S_AXI_ARLEN;
    end else if(T57) begin
      axi_arlen <= 8'h0;
    end
    if(T68) begin
      axi_arlen_cntr <= T67;
    end else if(T58) begin
      axi_arlen_cntr <= 8'h0;
    end else if(T57) begin
      axi_arlen_cntr <= 8'h0;
    end
    if(T80) begin
      axi_rvalid <= 1'h0;
    end else if(T76) begin
      axi_rvalid <= 1'h1;
    end else if(T75) begin
      axi_rvalid <= 1'h0;
    end
    if(T98) begin
      axi_awready <= 1'h0;
    end else if(T33) begin
      axi_awready <= 1'h1;
    end else if(T32) begin
      axi_awready <= 1'h0;
    end
    if(T120) begin
      axi_rlast <= 1'h0;
    end else if(T112) begin
      axi_rlast <= 1'h1;
    end else if(T68) begin
      axi_rlast <= 1'h0;
    end else if(T58) begin
      axi_rlast <= 1'h0;
    end else if(T57) begin
      axi_rlast <= 1'h0;
    end
    if(T76) begin
      axi_rresp <= 2'h0;
    end else if(T75) begin
      axi_rresp <= 2'h0;
    end
    if(mem_rden) begin
      axi_rdata <= data_out;
    end
    if(T134) begin
      bram_0 <= data_in;
    end else if(T133) begin
      bram_0 <= 32'h1;
    end
    axi_awaddr <= T325;
    if(T148) begin
      axi_awburst <= S_AXI_AWBURST;
    end else if(T147) begin
      axi_awburst <= 2'h0;
    end
    if(T148) begin
      axi_awlen <= S_AXI_AWLEN;
    end else if(T147) begin
      axi_awlen <= 8'h0;
    end
    if(T158) begin
      axi_awlen_cntr <= T168;
    end else if(T148) begin
      axi_awlen_cntr <= 8'h0;
    end else if(T147) begin
      axi_awlen_cntr <= 8'h0;
    end
    axi_araddr <= T333;
    if(T58) begin
      axi_arburst <= S_AXI_ARBURST;
    end else if(T57) begin
      axi_arburst <= 2'h0;
    end
    if(T227) begin
      bram_1 <= data_in;
    end else if(T226) begin
      bram_1 <= 32'h2;
    end
    if(T234) begin
      bram_2 <= data_in;
    end else if(T233) begin
      bram_2 <= 32'h4;
    end
    if(T239) begin
      bram_3 <= data_in;
    end else if(T238) begin
      bram_3 <= 32'h8;
    end
    if(T248) begin
      bram_4 <= data_in;
    end else if(T247) begin
      bram_4 <= 32'h10;
    end
    if(T253) begin
      bram_5 <= data_in;
    end else if(T252) begin
      bram_5 <= 32'h20;
    end
    if(T260) begin
      bram_6 <= data_in;
    end else if(T259) begin
      bram_6 <= 32'h40;
    end
    if(T265) begin
      bram_7 <= data_in;
    end else if(T264) begin
      bram_7 <= 32'h80;
    end
    if(T276) begin
      bram_8 <= data_in;
    end else if(T275) begin
      bram_8 <= 32'h100;
    end
    if(T281) begin
      bram_9 <= data_in;
    end else if(T280) begin
      bram_9 <= 32'h200;
    end
    if(T288) begin
      bram_10 <= data_in;
    end else if(T287) begin
      bram_10 <= 32'h400;
    end
    if(T293) begin
      bram_11 <= data_in;
    end else if(T292) begin
      bram_11 <= 32'h800;
    end
    if(T302) begin
      bram_12 <= data_in;
    end else if(T301) begin
      bram_12 <= 32'h1000;
    end
    if(T307) begin
      bram_13 <= data_in;
    end else if(T306) begin
      bram_13 <= 32'h2000;
    end
    if(T314) begin
      bram_14 <= data_in;
    end else if(T313) begin
      bram_14 <= 32'h4000;
    end
    if(T319) begin
      bram_15 <= data_in;
    end else if(T318) begin
      bram_15 <= 32'h8000;
    end
  end
endmodule
