#include "testSlave.h"

void testSlave_t::init ( val_t rand_init ) {
  this->__srand(rand_init);
  testSlave__bram_15.randomize(&__rand_seed);
  testSlave__bram_14.randomize(&__rand_seed);
  testSlave__bram_13.randomize(&__rand_seed);
  testSlave__bram_12.randomize(&__rand_seed);
  testSlave__bram_11.randomize(&__rand_seed);
  testSlave__bram_10.randomize(&__rand_seed);
  testSlave__bram_9.randomize(&__rand_seed);
  testSlave__bram_8.randomize(&__rand_seed);
  testSlave__bram_7.randomize(&__rand_seed);
  testSlave__bram_6.randomize(&__rand_seed);
  testSlave__bram_5.randomize(&__rand_seed);
  testSlave__bram_4.randomize(&__rand_seed);
  testSlave__bram_3.randomize(&__rand_seed);
  testSlave__bram_2.randomize(&__rand_seed);
  testSlave__bram_1.randomize(&__rand_seed);
  testSlave__axi_arburst.randomize(&__rand_seed);
  testSlave__axi_araddr.randomize(&__rand_seed);
  testSlave__axi_awlen_cntr.randomize(&__rand_seed);
  testSlave__axi_awlen.randomize(&__rand_seed);
  testSlave__axi_awburst.randomize(&__rand_seed);
  testSlave__axi_awaddr.randomize(&__rand_seed);
  testSlave__bram_0.randomize(&__rand_seed);
  testSlave__axi_rdata.randomize(&__rand_seed);
  testSlave__axi_rresp.randomize(&__rand_seed);
  testSlave__axi_rlast.randomize(&__rand_seed);
  testSlave__axi_awready.randomize(&__rand_seed);
  testSlave__axi_rvalid.randomize(&__rand_seed);
  testSlave__axi_arlen_cntr.randomize(&__rand_seed);
  testSlave__axi_arlen.randomize(&__rand_seed);
  testSlave__axi_arready.randomize(&__rand_seed);
  testSlave__axi_arv_arr_flag.randomize(&__rand_seed);
  testSlave__axi_awv_awr_flag.randomize(&__rand_seed);
  testSlave__axi_wready.randomize(&__rand_seed);
  testSlave__axi_bvalid.randomize(&__rand_seed);
  testSlave__axi_bresp.randomize(&__rand_seed);
  clk.len = 1;
  clk.cnt = 0;
  clk.values[0] = 0;
}


int testSlave_t::clock ( dat_t<1> reset ) {
  uint32_t min = ((uint32_t)1<<31)-1;
  if (clk.cnt < min) min = clk.cnt;
  clk.cnt-=min;
  if (clk.cnt == 0) clock_lo( reset );
  if (!reset.to_bool()) print( std::cerr );
  mod_t::dump( reset );
  if (clk.cnt == 0) clock_hi( reset );
  if (clk.cnt == 0) clk.cnt = clk.len;
  return min;
}


void testSlave_t::print ( FILE* f ) {
}
void testSlave_t::print ( std::ostream& s ) {
}


void testSlave_t::dump_init ( FILE* f ) {
  fputs("$timescale 1ps $end\n", f);
  fputs("$scope module testSlave $end\n", f);
  fputs("$var wire 1 \x21 clk $end\n", f);
  fputs("$var wire 1 \x22 reset $end\n", f);
  fputs("$var wire 1 \x23 S_AXI_RVALID $end\n", f);
  fputs("$var wire 1 \x24 S_AXI_WVALID $end\n", f);
  fputs("$var wire 1 \x25 mem_wren $end\n", f);
  fputs("$var wire 1 \x26 S_AXI_ARVALID $end\n", f);
  fputs("$var wire 1 \x27 S_AXI_RREADY $end\n", f);
  fputs("$var wire 1 \x28 S_AXI_AWVALID $end\n", f);
  fputs("$var wire 1 \x29 mem_rden $end\n", f);
  fputs("$var wire 1 \x2a axi_rlast $end\n", f);
  fputs("$var wire 1 \x2b S_AXI_RLAST $end\n", f);
  fputs("$var wire 1 \x2c S_AXI_ARREADY $end\n", f);
  fputs("$var wire 1 \x2d S_AXI_WREADY $end\n", f);
  fputs("$var wire 1 \x2e S_AXI_AWREADY $end\n", f);
  fputs("$var wire 1 \x2f S_AXI_BVALID $end\n", f);
  fputs("$var wire 1 \x30 S_AXI_WLAST $end\n", f);
  fputs("$var wire 1 \x31 axi_awready $end\n", f);
  fputs("$var wire 1 \x32 axi_rvalid $end\n", f);
  fputs("$var wire 1 \x33 axi_arready $end\n", f);
  fputs("$var wire 1 \x34 axi_arv_arr_flag $end\n", f);
  fputs("$var wire 1 \x35 axi_awv_awr_flag $end\n", f);
  fputs("$var wire 1 \x36 axi_wready $end\n", f);
  fputs("$var wire 1 \x37 S_AXI_BREADY $end\n", f);
  fputs("$var wire 1 \x38 axi_bvalid $end\n", f);
  fputs("$var wire 2 \x39 S_AXI_ARBURST $end\n", f);
  fputs("$var wire 2 \x3a axi_arburst $end\n", f);
  fputs("$var wire 2 \x3b S_AXI_AWBURST $end\n", f);
  fputs("$var wire 2 \x3c axi_awburst $end\n", f);
  fputs("$var wire 2 \x3d axi_rresp $end\n", f);
  fputs("$var wire 2 \x3e S_AXI_RRESP $end\n", f);
  fputs("$var wire 2 \x3f axi_bresp $end\n", f);
  fputs("$var wire 2 \x40 S_AXI_BRESP $end\n", f);
  fputs("$var wire 3 \x41 S_AXI_AWSIZE $end\n", f);
  fputs("$var wire 3 \x42 S_AXI_ARSIZE $end\n", f);
  fputs("$var wire 4 \x43 mem_address $end\n", f);
  fputs("$var wire 4 \x44 S_AXI_WSTRB $end\n", f);
  fputs("$var wire 6 \x45 S_AXI_ARID $end\n", f);
  fputs("$var wire 6 \x46 S_AXI_RID $end\n", f);
  fputs("$var wire 6 \x47 S_AXI_ARADDR $end\n", f);
  fputs("$var wire 6 \x48 axi_araddr $end\n", f);
  fputs("$var wire 6 \x49 S_AXI_AWADDR $end\n", f);
  fputs("$var wire 6 \x4a axi_awaddr $end\n", f);
  fputs("$var wire 6 \x4b S_AXI_AWID $end\n", f);
  fputs("$var wire 6 \x4c S_AXI_BID $end\n", f);
  fputs("$var wire 8 \x4d axi_awlen_cntr $end\n", f);
  fputs("$var wire 8 \x4e S_AXI_AWLEN $end\n", f);
  fputs("$var wire 8 \x4f axi_awlen $end\n", f);
  fputs("$var wire 8 \x50 axi_arlen_cntr $end\n", f);
  fputs("$var wire 8 \x51 S_AXI_ARLEN $end\n", f);
  fputs("$var wire 8 \x52 axi_arlen $end\n", f);
  fputs("$var wire 32 \x53 S_AXI_WDATA $end\n", f);
  fputs("$var wire 32 \x54 data_in $end\n", f);
  fputs("$var wire 32 \x55 bram_15 $end\n", f);
  fputs("$var wire 32 \x56 bram_14 $end\n", f);
  fputs("$var wire 32 \x57 bram_13 $end\n", f);
  fputs("$var wire 32 \x58 bram_12 $end\n", f);
  fputs("$var wire 32 \x59 bram_11 $end\n", f);
  fputs("$var wire 32 \x5a bram_10 $end\n", f);
  fputs("$var wire 32 \x5b bram_9 $end\n", f);
  fputs("$var wire 32 \x5c bram_8 $end\n", f);
  fputs("$var wire 32 \x5d bram_7 $end\n", f);
  fputs("$var wire 32 \x5e bram_6 $end\n", f);
  fputs("$var wire 32 \x5f bram_5 $end\n", f);
  fputs("$var wire 32 \x60 bram_4 $end\n", f);
  fputs("$var wire 32 \x61 bram_3 $end\n", f);
  fputs("$var wire 32 \x62 bram_2 $end\n", f);
  fputs("$var wire 32 \x63 bram_1 $end\n", f);
  fputs("$var wire 32 \x64 bram_0 $end\n", f);
  fputs("$var wire 32 \x65 data_out $end\n", f);
  fputs("$var wire 32 \x66 axi_rdata $end\n", f);
  fputs("$var wire 32 \x67 S_AXI_RDATA $end\n", f);
  fputs("$upscope $end\n", f);
  fputs("$enddefinitions $end\n", f);
  fputs("$dumpvars\n", f);
  fputs("$end\n", f);
  fputs("#0\n", f);
  if (clk.cnt == 0) {
    clk.values[0] = 1;
    dat_dump<1>(f, clk, 0x21);
  }
  dat_t<1> reset = LIT<1>(1);
  dat_dump<1>(f, reset, 0x22);
  dat_dump<1>(f, testSlave__S_AXI_RVALID, 0x23);
  testSlave__S_AXI_RVALID__prev = testSlave__S_AXI_RVALID;
  dat_dump<1>(f, testSlave__S_AXI_WVALID, 0x24);
  testSlave__S_AXI_WVALID__prev = testSlave__S_AXI_WVALID;
  dat_dump<1>(f, testSlave__mem_wren, 0x25);
  testSlave__mem_wren__prev = testSlave__mem_wren;
  dat_dump<1>(f, testSlave__S_AXI_ARVALID, 0x26);
  testSlave__S_AXI_ARVALID__prev = testSlave__S_AXI_ARVALID;
  dat_dump<1>(f, testSlave__S_AXI_RREADY, 0x27);
  testSlave__S_AXI_RREADY__prev = testSlave__S_AXI_RREADY;
  dat_dump<1>(f, testSlave__S_AXI_AWVALID, 0x28);
  testSlave__S_AXI_AWVALID__prev = testSlave__S_AXI_AWVALID;
  dat_dump<1>(f, testSlave__mem_rden, 0x29);
  testSlave__mem_rden__prev = testSlave__mem_rden;
  dat_dump<1>(f, testSlave__axi_rlast, 0x2a);
  testSlave__axi_rlast__prev = testSlave__axi_rlast;
  dat_dump<1>(f, testSlave__S_AXI_RLAST, 0x2b);
  testSlave__S_AXI_RLAST__prev = testSlave__S_AXI_RLAST;
  dat_dump<1>(f, testSlave__S_AXI_ARREADY, 0x2c);
  testSlave__S_AXI_ARREADY__prev = testSlave__S_AXI_ARREADY;
  dat_dump<1>(f, testSlave__S_AXI_WREADY, 0x2d);
  testSlave__S_AXI_WREADY__prev = testSlave__S_AXI_WREADY;
  dat_dump<1>(f, testSlave__S_AXI_AWREADY, 0x2e);
  testSlave__S_AXI_AWREADY__prev = testSlave__S_AXI_AWREADY;
  dat_dump<1>(f, testSlave__S_AXI_BVALID, 0x2f);
  testSlave__S_AXI_BVALID__prev = testSlave__S_AXI_BVALID;
  dat_dump<1>(f, testSlave__S_AXI_WLAST, 0x30);
  testSlave__S_AXI_WLAST__prev = testSlave__S_AXI_WLAST;
  dat_dump<1>(f, testSlave__axi_awready, 0x31);
  testSlave__axi_awready__prev = testSlave__axi_awready;
  dat_dump<1>(f, testSlave__axi_rvalid, 0x32);
  testSlave__axi_rvalid__prev = testSlave__axi_rvalid;
  dat_dump<1>(f, testSlave__axi_arready, 0x33);
  testSlave__axi_arready__prev = testSlave__axi_arready;
  dat_dump<1>(f, testSlave__axi_arv_arr_flag, 0x34);
  testSlave__axi_arv_arr_flag__prev = testSlave__axi_arv_arr_flag;
  dat_dump<1>(f, testSlave__axi_awv_awr_flag, 0x35);
  testSlave__axi_awv_awr_flag__prev = testSlave__axi_awv_awr_flag;
  dat_dump<1>(f, testSlave__axi_wready, 0x36);
  testSlave__axi_wready__prev = testSlave__axi_wready;
  dat_dump<1>(f, testSlave__S_AXI_BREADY, 0x37);
  testSlave__S_AXI_BREADY__prev = testSlave__S_AXI_BREADY;
  dat_dump<1>(f, testSlave__axi_bvalid, 0x38);
  testSlave__axi_bvalid__prev = testSlave__axi_bvalid;
  dat_dump<1>(f, testSlave__S_AXI_ARBURST, 0x39);
  testSlave__S_AXI_ARBURST__prev = testSlave__S_AXI_ARBURST;
  dat_dump<1>(f, testSlave__axi_arburst, 0x3a);
  testSlave__axi_arburst__prev = testSlave__axi_arburst;
  dat_dump<1>(f, testSlave__S_AXI_AWBURST, 0x3b);
  testSlave__S_AXI_AWBURST__prev = testSlave__S_AXI_AWBURST;
  dat_dump<1>(f, testSlave__axi_awburst, 0x3c);
  testSlave__axi_awburst__prev = testSlave__axi_awburst;
  dat_dump<1>(f, testSlave__axi_rresp, 0x3d);
  testSlave__axi_rresp__prev = testSlave__axi_rresp;
  dat_dump<1>(f, testSlave__S_AXI_RRESP, 0x3e);
  testSlave__S_AXI_RRESP__prev = testSlave__S_AXI_RRESP;
  dat_dump<1>(f, testSlave__axi_bresp, 0x3f);
  testSlave__axi_bresp__prev = testSlave__axi_bresp;
  dat_dump<1>(f, testSlave__S_AXI_BRESP, 0x40);
  testSlave__S_AXI_BRESP__prev = testSlave__S_AXI_BRESP;
  dat_dump<1>(f, testSlave__S_AXI_AWSIZE, 0x41);
  testSlave__S_AXI_AWSIZE__prev = testSlave__S_AXI_AWSIZE;
  dat_dump<1>(f, testSlave__S_AXI_ARSIZE, 0x42);
  testSlave__S_AXI_ARSIZE__prev = testSlave__S_AXI_ARSIZE;
  dat_dump<1>(f, testSlave__mem_address, 0x43);
  testSlave__mem_address__prev = testSlave__mem_address;
  dat_dump<1>(f, testSlave__S_AXI_WSTRB, 0x44);
  testSlave__S_AXI_WSTRB__prev = testSlave__S_AXI_WSTRB;
  dat_dump<1>(f, testSlave__S_AXI_ARID, 0x45);
  testSlave__S_AXI_ARID__prev = testSlave__S_AXI_ARID;
  dat_dump<1>(f, testSlave__S_AXI_RID, 0x46);
  testSlave__S_AXI_RID__prev = testSlave__S_AXI_RID;
  dat_dump<1>(f, testSlave__S_AXI_ARADDR, 0x47);
  testSlave__S_AXI_ARADDR__prev = testSlave__S_AXI_ARADDR;
  dat_dump<1>(f, testSlave__axi_araddr, 0x48);
  testSlave__axi_araddr__prev = testSlave__axi_araddr;
  dat_dump<1>(f, testSlave__S_AXI_AWADDR, 0x49);
  testSlave__S_AXI_AWADDR__prev = testSlave__S_AXI_AWADDR;
  dat_dump<1>(f, testSlave__axi_awaddr, 0x4a);
  testSlave__axi_awaddr__prev = testSlave__axi_awaddr;
  dat_dump<1>(f, testSlave__S_AXI_AWID, 0x4b);
  testSlave__S_AXI_AWID__prev = testSlave__S_AXI_AWID;
  dat_dump<1>(f, testSlave__S_AXI_BID, 0x4c);
  testSlave__S_AXI_BID__prev = testSlave__S_AXI_BID;
  dat_dump<1>(f, testSlave__axi_awlen_cntr, 0x4d);
  testSlave__axi_awlen_cntr__prev = testSlave__axi_awlen_cntr;
  dat_dump<1>(f, testSlave__S_AXI_AWLEN, 0x4e);
  testSlave__S_AXI_AWLEN__prev = testSlave__S_AXI_AWLEN;
  dat_dump<1>(f, testSlave__axi_awlen, 0x4f);
  testSlave__axi_awlen__prev = testSlave__axi_awlen;
  dat_dump<1>(f, testSlave__axi_arlen_cntr, 0x50);
  testSlave__axi_arlen_cntr__prev = testSlave__axi_arlen_cntr;
  dat_dump<1>(f, testSlave__S_AXI_ARLEN, 0x51);
  testSlave__S_AXI_ARLEN__prev = testSlave__S_AXI_ARLEN;
  dat_dump<1>(f, testSlave__axi_arlen, 0x52);
  testSlave__axi_arlen__prev = testSlave__axi_arlen;
  dat_dump<1>(f, testSlave__S_AXI_WDATA, 0x53);
  testSlave__S_AXI_WDATA__prev = testSlave__S_AXI_WDATA;
  dat_dump<1>(f, testSlave__data_in, 0x54);
  testSlave__data_in__prev = testSlave__data_in;
  dat_dump<1>(f, testSlave__bram_15, 0x55);
  testSlave__bram_15__prev = testSlave__bram_15;
  dat_dump<1>(f, testSlave__bram_14, 0x56);
  testSlave__bram_14__prev = testSlave__bram_14;
  dat_dump<1>(f, testSlave__bram_13, 0x57);
  testSlave__bram_13__prev = testSlave__bram_13;
  dat_dump<1>(f, testSlave__bram_12, 0x58);
  testSlave__bram_12__prev = testSlave__bram_12;
  dat_dump<1>(f, testSlave__bram_11, 0x59);
  testSlave__bram_11__prev = testSlave__bram_11;
  dat_dump<1>(f, testSlave__bram_10, 0x5a);
  testSlave__bram_10__prev = testSlave__bram_10;
  dat_dump<1>(f, testSlave__bram_9, 0x5b);
  testSlave__bram_9__prev = testSlave__bram_9;
  dat_dump<1>(f, testSlave__bram_8, 0x5c);
  testSlave__bram_8__prev = testSlave__bram_8;
  dat_dump<1>(f, testSlave__bram_7, 0x5d);
  testSlave__bram_7__prev = testSlave__bram_7;
  dat_dump<1>(f, testSlave__bram_6, 0x5e);
  testSlave__bram_6__prev = testSlave__bram_6;
  dat_dump<1>(f, testSlave__bram_5, 0x5f);
  testSlave__bram_5__prev = testSlave__bram_5;
  dat_dump<1>(f, testSlave__bram_4, 0x60);
  testSlave__bram_4__prev = testSlave__bram_4;
  dat_dump<1>(f, testSlave__bram_3, 0x61);
  testSlave__bram_3__prev = testSlave__bram_3;
  dat_dump<1>(f, testSlave__bram_2, 0x62);
  testSlave__bram_2__prev = testSlave__bram_2;
  dat_dump<1>(f, testSlave__bram_1, 0x63);
  testSlave__bram_1__prev = testSlave__bram_1;
  dat_dump<1>(f, testSlave__bram_0, 0x64);
  testSlave__bram_0__prev = testSlave__bram_0;
  dat_dump<1>(f, testSlave__data_out, 0x65);
  testSlave__data_out__prev = testSlave__data_out;
  dat_dump<1>(f, testSlave__axi_rdata, 0x66);
  testSlave__axi_rdata__prev = testSlave__axi_rdata;
  dat_dump<1>(f, testSlave__S_AXI_RDATA, 0x67);
  testSlave__S_AXI_RDATA__prev = testSlave__S_AXI_RDATA;
  fputs("#1\n", f);
  if (clk.cnt == 0) {
    clk.values[0] = 0;
    dat_dump<1>(f, clk, 0x21);
  }
}


void testSlave_t::dump ( FILE* f, val_t t, dat_t<1> reset ) {
  if (t == 0L) return dump_init(f);
  fprintf(f, "#%lu\n", t << 1);
  if (clk.cnt == 0)  goto L0;
K0:  if (reset != reset__prev)  goto L1;
K1:  if (testSlave__S_AXI_RVALID != testSlave__S_AXI_RVALID__prev)  goto L2;
K2:  if (testSlave__S_AXI_WVALID != testSlave__S_AXI_WVALID__prev)  goto L3;
K3:  if (testSlave__mem_wren != testSlave__mem_wren__prev)  goto L4;
K4:  if (testSlave__S_AXI_ARVALID != testSlave__S_AXI_ARVALID__prev)  goto L5;
K5:  if (testSlave__S_AXI_RREADY != testSlave__S_AXI_RREADY__prev)  goto L6;
K6:  if (testSlave__S_AXI_AWVALID != testSlave__S_AXI_AWVALID__prev)  goto L7;
K7:  if (testSlave__mem_rden != testSlave__mem_rden__prev)  goto L8;
K8:  if (testSlave__axi_rlast != testSlave__axi_rlast__prev)  goto L9;
K9:  if (testSlave__S_AXI_RLAST != testSlave__S_AXI_RLAST__prev)  goto L10;
K10:  if (testSlave__S_AXI_ARREADY != testSlave__S_AXI_ARREADY__prev)  goto L11;
K11:  if (testSlave__S_AXI_WREADY != testSlave__S_AXI_WREADY__prev)  goto L12;
K12:  if (testSlave__S_AXI_AWREADY != testSlave__S_AXI_AWREADY__prev)  goto L13;
K13:  if (testSlave__S_AXI_BVALID != testSlave__S_AXI_BVALID__prev)  goto L14;
K14:  if (testSlave__S_AXI_WLAST != testSlave__S_AXI_WLAST__prev)  goto L15;
K15:  if (testSlave__axi_awready != testSlave__axi_awready__prev)  goto L16;
K16:  if (testSlave__axi_rvalid != testSlave__axi_rvalid__prev)  goto L17;
K17:  if (testSlave__axi_arready != testSlave__axi_arready__prev)  goto L18;
K18:  if (testSlave__axi_arv_arr_flag != testSlave__axi_arv_arr_flag__prev)  goto L19;
K19:  if (testSlave__axi_awv_awr_flag != testSlave__axi_awv_awr_flag__prev)  goto L20;
K20:  if (testSlave__axi_wready != testSlave__axi_wready__prev)  goto L21;
K21:  if (testSlave__S_AXI_BREADY != testSlave__S_AXI_BREADY__prev)  goto L22;
K22:  if (testSlave__axi_bvalid != testSlave__axi_bvalid__prev)  goto L23;
K23:  if (testSlave__S_AXI_ARBURST != testSlave__S_AXI_ARBURST__prev)  goto L24;
K24:  if (testSlave__axi_arburst != testSlave__axi_arburst__prev)  goto L25;
K25:  if (testSlave__S_AXI_AWBURST != testSlave__S_AXI_AWBURST__prev)  goto L26;
K26:  if (testSlave__axi_awburst != testSlave__axi_awburst__prev)  goto L27;
K27:  if (testSlave__axi_rresp != testSlave__axi_rresp__prev)  goto L28;
K28:  if (testSlave__S_AXI_RRESP != testSlave__S_AXI_RRESP__prev)  goto L29;
K29:  if (testSlave__axi_bresp != testSlave__axi_bresp__prev)  goto L30;
K30:  if (testSlave__S_AXI_BRESP != testSlave__S_AXI_BRESP__prev)  goto L31;
K31:  if (testSlave__S_AXI_AWSIZE != testSlave__S_AXI_AWSIZE__prev)  goto L32;
K32:  if (testSlave__S_AXI_ARSIZE != testSlave__S_AXI_ARSIZE__prev)  goto L33;
K33:  if (testSlave__mem_address != testSlave__mem_address__prev)  goto L34;
K34:  if (testSlave__S_AXI_WSTRB != testSlave__S_AXI_WSTRB__prev)  goto L35;
K35:  if (testSlave__S_AXI_ARID != testSlave__S_AXI_ARID__prev)  goto L36;
K36:  if (testSlave__S_AXI_RID != testSlave__S_AXI_RID__prev)  goto L37;
K37:  if (testSlave__S_AXI_ARADDR != testSlave__S_AXI_ARADDR__prev)  goto L38;
K38:  if (testSlave__axi_araddr != testSlave__axi_araddr__prev)  goto L39;
K39:  if (testSlave__S_AXI_AWADDR != testSlave__S_AXI_AWADDR__prev)  goto L40;
K40:  if (testSlave__axi_awaddr != testSlave__axi_awaddr__prev)  goto L41;
K41:  if (testSlave__S_AXI_AWID != testSlave__S_AXI_AWID__prev)  goto L42;
K42:  if (testSlave__S_AXI_BID != testSlave__S_AXI_BID__prev)  goto L43;
K43:  if (testSlave__axi_awlen_cntr != testSlave__axi_awlen_cntr__prev)  goto L44;
K44:  if (testSlave__S_AXI_AWLEN != testSlave__S_AXI_AWLEN__prev)  goto L45;
K45:  if (testSlave__axi_awlen != testSlave__axi_awlen__prev)  goto L46;
K46:  if (testSlave__axi_arlen_cntr != testSlave__axi_arlen_cntr__prev)  goto L47;
K47:  if (testSlave__S_AXI_ARLEN != testSlave__S_AXI_ARLEN__prev)  goto L48;
K48:  if (testSlave__axi_arlen != testSlave__axi_arlen__prev)  goto L49;
K49:  if (testSlave__S_AXI_WDATA != testSlave__S_AXI_WDATA__prev)  goto L50;
K50:  if (testSlave__data_in != testSlave__data_in__prev)  goto L51;
K51:  if (testSlave__bram_15 != testSlave__bram_15__prev)  goto L52;
K52:  if (testSlave__bram_14 != testSlave__bram_14__prev)  goto L53;
K53:  if (testSlave__bram_13 != testSlave__bram_13__prev)  goto L54;
K54:  if (testSlave__bram_12 != testSlave__bram_12__prev)  goto L55;
K55:  if (testSlave__bram_11 != testSlave__bram_11__prev)  goto L56;
K56:  if (testSlave__bram_10 != testSlave__bram_10__prev)  goto L57;
K57:  if (testSlave__bram_9 != testSlave__bram_9__prev)  goto L58;
K58:  if (testSlave__bram_8 != testSlave__bram_8__prev)  goto L59;
K59:  if (testSlave__bram_7 != testSlave__bram_7__prev)  goto L60;
K60:  if (testSlave__bram_6 != testSlave__bram_6__prev)  goto L61;
K61:  if (testSlave__bram_5 != testSlave__bram_5__prev)  goto L62;
K62:  if (testSlave__bram_4 != testSlave__bram_4__prev)  goto L63;
K63:  if (testSlave__bram_3 != testSlave__bram_3__prev)  goto L64;
K64:  if (testSlave__bram_2 != testSlave__bram_2__prev)  goto L65;
K65:  if (testSlave__bram_1 != testSlave__bram_1__prev)  goto L66;
K66:  if (testSlave__bram_0 != testSlave__bram_0__prev)  goto L67;
K67:  if (testSlave__data_out != testSlave__data_out__prev)  goto L68;
K68:  if (testSlave__axi_rdata != testSlave__axi_rdata__prev)  goto L69;
K69:  if (testSlave__S_AXI_RDATA != testSlave__S_AXI_RDATA__prev)  goto L70;
K70:  fprintf(f, "#%lu\n", (t << 1) + 1);
  if (clk.cnt == 0)  goto Z0;
C0:  return;
L0:
  clk.values[0] = 1;
  dat_dump<1>(f, clk, 0x21);
  goto K0;
L1:
  reset__prev = reset;
  dat_dump<1>(f, reset, 0x22);
  goto K1;
L2:
  testSlave__S_AXI_RVALID__prev = testSlave__S_AXI_RVALID;
  dat_dump<1>(f, testSlave__S_AXI_RVALID, 0x23);
  goto K2;
L3:
  testSlave__S_AXI_WVALID__prev = testSlave__S_AXI_WVALID;
  dat_dump<1>(f, testSlave__S_AXI_WVALID, 0x24);
  goto K3;
L4:
  testSlave__mem_wren__prev = testSlave__mem_wren;
  dat_dump<1>(f, testSlave__mem_wren, 0x25);
  goto K4;
L5:
  testSlave__S_AXI_ARVALID__prev = testSlave__S_AXI_ARVALID;
  dat_dump<1>(f, testSlave__S_AXI_ARVALID, 0x26);
  goto K5;
L6:
  testSlave__S_AXI_RREADY__prev = testSlave__S_AXI_RREADY;
  dat_dump<1>(f, testSlave__S_AXI_RREADY, 0x27);
  goto K6;
L7:
  testSlave__S_AXI_AWVALID__prev = testSlave__S_AXI_AWVALID;
  dat_dump<1>(f, testSlave__S_AXI_AWVALID, 0x28);
  goto K7;
L8:
  testSlave__mem_rden__prev = testSlave__mem_rden;
  dat_dump<1>(f, testSlave__mem_rden, 0x29);
  goto K8;
L9:
  testSlave__axi_rlast__prev = testSlave__axi_rlast;
  dat_dump<1>(f, testSlave__axi_rlast, 0x2a);
  goto K9;
L10:
  testSlave__S_AXI_RLAST__prev = testSlave__S_AXI_RLAST;
  dat_dump<1>(f, testSlave__S_AXI_RLAST, 0x2b);
  goto K10;
L11:
  testSlave__S_AXI_ARREADY__prev = testSlave__S_AXI_ARREADY;
  dat_dump<1>(f, testSlave__S_AXI_ARREADY, 0x2c);
  goto K11;
L12:
  testSlave__S_AXI_WREADY__prev = testSlave__S_AXI_WREADY;
  dat_dump<1>(f, testSlave__S_AXI_WREADY, 0x2d);
  goto K12;
L13:
  testSlave__S_AXI_AWREADY__prev = testSlave__S_AXI_AWREADY;
  dat_dump<1>(f, testSlave__S_AXI_AWREADY, 0x2e);
  goto K13;
L14:
  testSlave__S_AXI_BVALID__prev = testSlave__S_AXI_BVALID;
  dat_dump<1>(f, testSlave__S_AXI_BVALID, 0x2f);
  goto K14;
L15:
  testSlave__S_AXI_WLAST__prev = testSlave__S_AXI_WLAST;
  dat_dump<1>(f, testSlave__S_AXI_WLAST, 0x30);
  goto K15;
L16:
  testSlave__axi_awready__prev = testSlave__axi_awready;
  dat_dump<1>(f, testSlave__axi_awready, 0x31);
  goto K16;
L17:
  testSlave__axi_rvalid__prev = testSlave__axi_rvalid;
  dat_dump<1>(f, testSlave__axi_rvalid, 0x32);
  goto K17;
L18:
  testSlave__axi_arready__prev = testSlave__axi_arready;
  dat_dump<1>(f, testSlave__axi_arready, 0x33);
  goto K18;
L19:
  testSlave__axi_arv_arr_flag__prev = testSlave__axi_arv_arr_flag;
  dat_dump<1>(f, testSlave__axi_arv_arr_flag, 0x34);
  goto K19;
L20:
  testSlave__axi_awv_awr_flag__prev = testSlave__axi_awv_awr_flag;
  dat_dump<1>(f, testSlave__axi_awv_awr_flag, 0x35);
  goto K20;
L21:
  testSlave__axi_wready__prev = testSlave__axi_wready;
  dat_dump<1>(f, testSlave__axi_wready, 0x36);
  goto K21;
L22:
  testSlave__S_AXI_BREADY__prev = testSlave__S_AXI_BREADY;
  dat_dump<1>(f, testSlave__S_AXI_BREADY, 0x37);
  goto K22;
L23:
  testSlave__axi_bvalid__prev = testSlave__axi_bvalid;
  dat_dump<1>(f, testSlave__axi_bvalid, 0x38);
  goto K23;
L24:
  testSlave__S_AXI_ARBURST__prev = testSlave__S_AXI_ARBURST;
  dat_dump<1>(f, testSlave__S_AXI_ARBURST, 0x39);
  goto K24;
L25:
  testSlave__axi_arburst__prev = testSlave__axi_arburst;
  dat_dump<1>(f, testSlave__axi_arburst, 0x3a);
  goto K25;
L26:
  testSlave__S_AXI_AWBURST__prev = testSlave__S_AXI_AWBURST;
  dat_dump<1>(f, testSlave__S_AXI_AWBURST, 0x3b);
  goto K26;
L27:
  testSlave__axi_awburst__prev = testSlave__axi_awburst;
  dat_dump<1>(f, testSlave__axi_awburst, 0x3c);
  goto K27;
L28:
  testSlave__axi_rresp__prev = testSlave__axi_rresp;
  dat_dump<1>(f, testSlave__axi_rresp, 0x3d);
  goto K28;
L29:
  testSlave__S_AXI_RRESP__prev = testSlave__S_AXI_RRESP;
  dat_dump<1>(f, testSlave__S_AXI_RRESP, 0x3e);
  goto K29;
L30:
  testSlave__axi_bresp__prev = testSlave__axi_bresp;
  dat_dump<1>(f, testSlave__axi_bresp, 0x3f);
  goto K30;
L31:
  testSlave__S_AXI_BRESP__prev = testSlave__S_AXI_BRESP;
  dat_dump<1>(f, testSlave__S_AXI_BRESP, 0x40);
  goto K31;
L32:
  testSlave__S_AXI_AWSIZE__prev = testSlave__S_AXI_AWSIZE;
  dat_dump<1>(f, testSlave__S_AXI_AWSIZE, 0x41);
  goto K32;
L33:
  testSlave__S_AXI_ARSIZE__prev = testSlave__S_AXI_ARSIZE;
  dat_dump<1>(f, testSlave__S_AXI_ARSIZE, 0x42);
  goto K33;
L34:
  testSlave__mem_address__prev = testSlave__mem_address;
  dat_dump<1>(f, testSlave__mem_address, 0x43);
  goto K34;
L35:
  testSlave__S_AXI_WSTRB__prev = testSlave__S_AXI_WSTRB;
  dat_dump<1>(f, testSlave__S_AXI_WSTRB, 0x44);
  goto K35;
L36:
  testSlave__S_AXI_ARID__prev = testSlave__S_AXI_ARID;
  dat_dump<1>(f, testSlave__S_AXI_ARID, 0x45);
  goto K36;
L37:
  testSlave__S_AXI_RID__prev = testSlave__S_AXI_RID;
  dat_dump<1>(f, testSlave__S_AXI_RID, 0x46);
  goto K37;
L38:
  testSlave__S_AXI_ARADDR__prev = testSlave__S_AXI_ARADDR;
  dat_dump<1>(f, testSlave__S_AXI_ARADDR, 0x47);
  goto K38;
L39:
  testSlave__axi_araddr__prev = testSlave__axi_araddr;
  dat_dump<1>(f, testSlave__axi_araddr, 0x48);
  goto K39;
L40:
  testSlave__S_AXI_AWADDR__prev = testSlave__S_AXI_AWADDR;
  dat_dump<1>(f, testSlave__S_AXI_AWADDR, 0x49);
  goto K40;
L41:
  testSlave__axi_awaddr__prev = testSlave__axi_awaddr;
  dat_dump<1>(f, testSlave__axi_awaddr, 0x4a);
  goto K41;
L42:
  testSlave__S_AXI_AWID__prev = testSlave__S_AXI_AWID;
  dat_dump<1>(f, testSlave__S_AXI_AWID, 0x4b);
  goto K42;
L43:
  testSlave__S_AXI_BID__prev = testSlave__S_AXI_BID;
  dat_dump<1>(f, testSlave__S_AXI_BID, 0x4c);
  goto K43;
L44:
  testSlave__axi_awlen_cntr__prev = testSlave__axi_awlen_cntr;
  dat_dump<1>(f, testSlave__axi_awlen_cntr, 0x4d);
  goto K44;
L45:
  testSlave__S_AXI_AWLEN__prev = testSlave__S_AXI_AWLEN;
  dat_dump<1>(f, testSlave__S_AXI_AWLEN, 0x4e);
  goto K45;
L46:
  testSlave__axi_awlen__prev = testSlave__axi_awlen;
  dat_dump<1>(f, testSlave__axi_awlen, 0x4f);
  goto K46;
L47:
  testSlave__axi_arlen_cntr__prev = testSlave__axi_arlen_cntr;
  dat_dump<1>(f, testSlave__axi_arlen_cntr, 0x50);
  goto K47;
L48:
  testSlave__S_AXI_ARLEN__prev = testSlave__S_AXI_ARLEN;
  dat_dump<1>(f, testSlave__S_AXI_ARLEN, 0x51);
  goto K48;
L49:
  testSlave__axi_arlen__prev = testSlave__axi_arlen;
  dat_dump<1>(f, testSlave__axi_arlen, 0x52);
  goto K49;
L50:
  testSlave__S_AXI_WDATA__prev = testSlave__S_AXI_WDATA;
  dat_dump<1>(f, testSlave__S_AXI_WDATA, 0x53);
  goto K50;
L51:
  testSlave__data_in__prev = testSlave__data_in;
  dat_dump<1>(f, testSlave__data_in, 0x54);
  goto K51;
L52:
  testSlave__bram_15__prev = testSlave__bram_15;
  dat_dump<1>(f, testSlave__bram_15, 0x55);
  goto K52;
L53:
  testSlave__bram_14__prev = testSlave__bram_14;
  dat_dump<1>(f, testSlave__bram_14, 0x56);
  goto K53;
L54:
  testSlave__bram_13__prev = testSlave__bram_13;
  dat_dump<1>(f, testSlave__bram_13, 0x57);
  goto K54;
L55:
  testSlave__bram_12__prev = testSlave__bram_12;
  dat_dump<1>(f, testSlave__bram_12, 0x58);
  goto K55;
L56:
  testSlave__bram_11__prev = testSlave__bram_11;
  dat_dump<1>(f, testSlave__bram_11, 0x59);
  goto K56;
L57:
  testSlave__bram_10__prev = testSlave__bram_10;
  dat_dump<1>(f, testSlave__bram_10, 0x5a);
  goto K57;
L58:
  testSlave__bram_9__prev = testSlave__bram_9;
  dat_dump<1>(f, testSlave__bram_9, 0x5b);
  goto K58;
L59:
  testSlave__bram_8__prev = testSlave__bram_8;
  dat_dump<1>(f, testSlave__bram_8, 0x5c);
  goto K59;
L60:
  testSlave__bram_7__prev = testSlave__bram_7;
  dat_dump<1>(f, testSlave__bram_7, 0x5d);
  goto K60;
L61:
  testSlave__bram_6__prev = testSlave__bram_6;
  dat_dump<1>(f, testSlave__bram_6, 0x5e);
  goto K61;
L62:
  testSlave__bram_5__prev = testSlave__bram_5;
  dat_dump<1>(f, testSlave__bram_5, 0x5f);
  goto K62;
L63:
  testSlave__bram_4__prev = testSlave__bram_4;
  dat_dump<1>(f, testSlave__bram_4, 0x60);
  goto K63;
L64:
  testSlave__bram_3__prev = testSlave__bram_3;
  dat_dump<1>(f, testSlave__bram_3, 0x61);
  goto K64;
L65:
  testSlave__bram_2__prev = testSlave__bram_2;
  dat_dump<1>(f, testSlave__bram_2, 0x62);
  goto K65;
L66:
  testSlave__bram_1__prev = testSlave__bram_1;
  dat_dump<1>(f, testSlave__bram_1, 0x63);
  goto K66;
L67:
  testSlave__bram_0__prev = testSlave__bram_0;
  dat_dump<1>(f, testSlave__bram_0, 0x64);
  goto K67;
L68:
  testSlave__data_out__prev = testSlave__data_out;
  dat_dump<1>(f, testSlave__data_out, 0x65);
  goto K68;
L69:
  testSlave__axi_rdata__prev = testSlave__axi_rdata;
  dat_dump<1>(f, testSlave__axi_rdata, 0x66);
  goto K69;
L70:
  testSlave__S_AXI_RDATA__prev = testSlave__S_AXI_RDATA;
  dat_dump<1>(f, testSlave__S_AXI_RDATA, 0x67);
  goto K70;
Z0:
  clk.values[0] = 0;
  dat_dump<1>(f, clk, 0x21);
  goto C0;
}




void testSlave_t::clock_lo ( dat_t<1> reset, bool assert_fire ) {
  { testSlave__S_AXI_RVALID.values[0] = testSlave__axi_rvalid.values[0];}
  { testSlave__S_AXI_RID.values[0] = testSlave__S_AXI_ARID.values[0];}
  { testSlave__data_in.values[0] = testSlave__S_AXI_WDATA.values[0];}
  val_t T0;
  { T0 = testSlave__axi_awaddr.values[0] >> 2;}
  T0 = T0 & 0xfL;
  val_t T1;
  { T1 = TERNARY(testSlave__axi_awv_awr_flag.values[0], T0, 0x0L);}
  val_t T2;
  { T2 = testSlave__axi_araddr.values[0] >> 2;}
  T2 = T2 & 0xfL;
  val_t T3;
  { T3 = TERNARY_1(testSlave__axi_arv_arr_flag.values[0], T2, T1);}
  { testSlave__mem_address.values[0] = T3;}
  val_t T4;
  T4 = 0x1L << testSlave__mem_address.values[0];
  T4 = T4 & 0xffffL;
  val_t T5;
  T5 = (T4 >> 15) & 1;
  val_t T6;
  { T6 = testSlave__axi_wready.values[0] & testSlave__S_AXI_WVALID.values[0];}
  { testSlave__mem_wren.values[0] = T6;}
  val_t T7;
  { T7 = testSlave__mem_wren.values[0] & T5;}
  val_t T8;
  { T8 = TERNARY_1(T7, testSlave__data_in.values[0], testSlave__bram_15.values[0]);}
  { T9.values[0] = TERNARY(reset.values[0], 0x0L, T8);}
  val_t T10;
  T10 = (T4 >> 14) & 1;
  val_t T11;
  { T11 = testSlave__mem_wren.values[0] & T10;}
  val_t T12;
  { T12 = TERNARY_1(T11, testSlave__data_in.values[0], testSlave__bram_14.values[0]);}
  { T13.values[0] = TERNARY(reset.values[0], 0x0L, T12);}
  val_t T14;
  T14 = (T4 >> 13) & 1;
  val_t T15;
  { T15 = testSlave__mem_wren.values[0] & T14;}
  val_t T16;
  { T16 = TERNARY_1(T15, testSlave__data_in.values[0], testSlave__bram_13.values[0]);}
  { T17.values[0] = TERNARY(reset.values[0], 0x0L, T16);}
  val_t T18;
  T18 = (T4 >> 12) & 1;
  val_t T19;
  { T19 = testSlave__mem_wren.values[0] & T18;}
  val_t T20;
  { T20 = TERNARY_1(T19, testSlave__data_in.values[0], testSlave__bram_12.values[0]);}
  { T21.values[0] = TERNARY(reset.values[0], 0x0L, T20);}
  val_t T22;
  T22 = (T4 >> 11) & 1;
  val_t T23;
  { T23 = testSlave__mem_wren.values[0] & T22;}
  val_t T24;
  { T24 = TERNARY_1(T23, testSlave__data_in.values[0], testSlave__bram_11.values[0]);}
  { T25.values[0] = TERNARY(reset.values[0], 0x0L, T24);}
  val_t T26;
  T26 = (T4 >> 10) & 1;
  val_t T27;
  { T27 = testSlave__mem_wren.values[0] & T26;}
  val_t T28;
  { T28 = TERNARY_1(T27, testSlave__data_in.values[0], testSlave__bram_10.values[0]);}
  { T29.values[0] = TERNARY(reset.values[0], 0x0L, T28);}
  val_t T30;
  T30 = (T4 >> 9) & 1;
  val_t T31;
  { T31 = testSlave__mem_wren.values[0] & T30;}
  val_t T32;
  { T32 = TERNARY_1(T31, testSlave__data_in.values[0], testSlave__bram_9.values[0]);}
  { T33.values[0] = TERNARY(reset.values[0], 0x0L, T32);}
  val_t T34;
  T34 = (T4 >> 8) & 1;
  val_t T35;
  { T35 = testSlave__mem_wren.values[0] & T34;}
  val_t T36;
  { T36 = TERNARY_1(T35, testSlave__data_in.values[0], testSlave__bram_8.values[0]);}
  { T37.values[0] = TERNARY(reset.values[0], 0x0L, T36);}
  val_t T38;
  T38 = (T4 >> 7) & 1;
  val_t T39;
  { T39 = testSlave__mem_wren.values[0] & T38;}
  val_t T40;
  { T40 = TERNARY_1(T39, testSlave__data_in.values[0], testSlave__bram_7.values[0]);}
  { T41.values[0] = TERNARY(reset.values[0], 0x0L, T40);}
  val_t T42;
  T42 = (T4 >> 6) & 1;
  val_t T43;
  { T43 = testSlave__mem_wren.values[0] & T42;}
  val_t T44;
  { T44 = TERNARY_1(T43, testSlave__data_in.values[0], testSlave__bram_6.values[0]);}
  { T45.values[0] = TERNARY(reset.values[0], 0x0L, T44);}
  val_t T46;
  T46 = (T4 >> 5) & 1;
  val_t T47;
  { T47 = testSlave__mem_wren.values[0] & T46;}
  val_t T48;
  { T48 = TERNARY_1(T47, testSlave__data_in.values[0], testSlave__bram_5.values[0]);}
  { T49.values[0] = TERNARY(reset.values[0], 0x0L, T48);}
  val_t T50;
  T50 = (T4 >> 4) & 1;
  val_t T51;
  { T51 = testSlave__mem_wren.values[0] & T50;}
  val_t T52;
  { T52 = TERNARY_1(T51, testSlave__data_in.values[0], testSlave__bram_4.values[0]);}
  { T53.values[0] = TERNARY(reset.values[0], 0x0L, T52);}
  val_t T54;
  T54 = (T4 >> 3) & 1;
  val_t T55;
  { T55 = testSlave__mem_wren.values[0] & T54;}
  val_t T56;
  { T56 = TERNARY_1(T55, testSlave__data_in.values[0], testSlave__bram_3.values[0]);}
  { T57.values[0] = TERNARY(reset.values[0], 0x0L, T56);}
  val_t T58;
  T58 = (T4 >> 2) & 1;
  val_t T59;
  { T59 = testSlave__mem_wren.values[0] & T58;}
  val_t T60;
  { T60 = TERNARY_1(T59, testSlave__data_in.values[0], testSlave__bram_2.values[0]);}
  { T61.values[0] = TERNARY(reset.values[0], 0x0L, T60);}
  val_t T62;
  T62 = (T4 >> 1) & 1;
  val_t T63;
  { T63 = testSlave__mem_wren.values[0] & T62;}
  val_t T64;
  { T64 = TERNARY_1(T63, testSlave__data_in.values[0], testSlave__bram_1.values[0]);}
  { T65.values[0] = TERNARY(reset.values[0], 0x0L, T64);}
  val_t T66;
  { T66 = reset.values[0] ^ 0x1L;}
  val_t T67;
  { T67 = TERNARY(T66, 0x0L, testSlave__axi_arburst.values[0]);}
  val_t T68;
  { T68 = testSlave__axi_arv_arr_flag.values[0] ^ 0x1L;}
  val_t T69;
  { T69 = testSlave__axi_arready.values[0] ^ 0x1L;}
  val_t T70;
  { T70 = T69 & testSlave__S_AXI_ARVALID.values[0];}
  val_t T71;
  { T71 = T70 & T68;}
  val_t T72;
  { T72 = T66 ^ 0x1L;}
  val_t T73;
  { T73 = T72 & T71;}
  { T74.values[0] = TERNARY_1(T73, testSlave__S_AXI_ARBURST.values[0], T67);}
  val_t T75;
  { T75 = TERNARY(T66, 0x0L, testSlave__axi_araddr.values[0]);}
  val_t T76;
  { T76 = TERNARY_1(T73, testSlave__S_AXI_ARADDR.values[0], T75);}
  val_t T77;
  T77 = testSlave__axi_arburst.values[0] == 0x0L;
  val_t T78;
  T78 = testSlave__axi_arlen_cntr.values[0]<=testSlave__axi_arlen.values[0];
  val_t T79;
  { T79 = T78 & testSlave__axi_rvalid.values[0];}
  val_t T80;
  { T80 = T79 & testSlave__S_AXI_RREADY.values[0];}
  val_t T81;
  { T81 = T71 ^ 0x1L;}
  val_t T82;
  { T82 = T81 & T80;}
  val_t T83;
  { T83 = T72 & T82;}
  val_t T84;
  { T84 = T83 & T77;}
  val_t T85;
  { T85 = TERNARY_1(T84, testSlave__axi_araddr.values[0], T76);}
  val_t T86;
  { T86 = T85 | 0x0L << 6;}
  val_t T87;
  { T87 = testSlave__axi_araddr.values[0] >> 2;}
  T87 = T87 & 0xfL;
  val_t T88;
  { T88 = T87+0x1L;}
  T88 = T88 & 0xfL;
  val_t T89;
  { T89 = T88 & 0xfL;}
  val_t T90;
  T90 = T89 << 0x2L;
  T90 = T90 & 0x3fL;
  val_t T91;
  { T91 = T90 | 0x0L << 6;}
  val_t T92;
  { T92 = ~0x3cL;}
  T92 = T92 & 0x7fL;
  val_t T93;
  { T93 = T85 | 0x0L << 6;}
  val_t T94;
  { T94 = T93 & T92;}
  val_t T95;
  { T95 = T94 | T91;}
  val_t T96;
  T96 = testSlave__axi_arburst.values[0] == 0x1L;
  val_t T97;
  { T97 = T77 ^ 0x1L;}
  val_t T98;
  { T98 = T97 & T96;}
  val_t T99;
  { T99 = T83 & T98;}
  val_t T100;
  { T100 = TERNARY_1(T99, T95, T86);}
  val_t T101;
  { T101 = ~0x3L;}
  T101 = T101 & 0x7L;
  val_t T102;
  T102 = (T101 >> 2) & 1;
  val_t T103;
  { T103 = TERNARY(T102, 0xfL, 0x0L);}
  val_t T104;
  { T104 = T101 | T103 << 3;}
  val_t T105;
  { T105 = T100 & T104;}
  val_t T106;
  { T106 = T105 | 0x0L;}
  val_t T107;
  { T107 = TERNARY_1(T99, T106, T100);}
  val_t T108;
  { T108 = testSlave__axi_araddr.values[0] >> 2;}
  T108 = T108 & 0xfL;
  val_t T109;
  { T109 = T108+0x1L;}
  T109 = T109 & 0xfL;
  val_t T110;
  { T110 = T109 | 0x0L << 4;}
  val_t T111;
  { T111 = T77 | T96;}
  val_t T112;
  { T112 = T111 ^ 0x1L;}
  val_t T113;
  { T113 = T83 & T112;}
  val_t T114;
  { T114 = TERNARY_1(T113, T110, T107);}
  { T115.values[0] = T114;}
  T115.values[0] = T115.values[0] & 0x3fL;
  val_t T116;
  { T116 = reset.values[0] ^ 0x1L;}
  val_t T117;
  { T117 = TERNARY(T116, 0x0L, testSlave__axi_awlen_cntr.values[0]);}
  val_t T118;
  { T118 = testSlave__axi_awv_awr_flag.values[0] ^ 0x1L;}
  val_t T119;
  { T119 = testSlave__axi_awready.values[0] ^ 0x1L;}
  val_t T120;
  { T120 = T119 & testSlave__S_AXI_AWVALID.values[0];}
  val_t T121;
  { T121 = T120 & T118;}
  val_t T122;
  { T122 = T116 ^ 0x1L;}
  val_t T123;
  { T123 = T122 & T121;}
  val_t T124;
  { T124 = TERNARY(T123, 0x0L, T117);}
  val_t T125;
  { T125 = testSlave__axi_awlen_cntr.values[0]+0x1L;}
  T125 = T125 & 0xffL;
  val_t T126;
  T126 = testSlave__axi_awlen_cntr.values[0]<=testSlave__axi_awlen.values[0];
  val_t T127;
  { T127 = T126 & testSlave__axi_wready.values[0];}
  val_t T128;
  { T128 = T127 & testSlave__S_AXI_WVALID.values[0];}
  val_t T129;
  { T129 = T121 ^ 0x1L;}
  val_t T130;
  { T130 = T129 & T128;}
  val_t T131;
  { T131 = T122 & T130;}
  val_t T132;
  { T132 = TERNARY_1(T131, T125, T124);}
  { T133.values[0] = TERNARY(T73, 0x0L, T132);}
  val_t T134;
  { T134 = TERNARY(T116, 0x0L, testSlave__axi_awlen.values[0]);}
  { T135.values[0] = TERNARY_1(T123, testSlave__S_AXI_AWLEN.values[0], T134);}
  val_t T136;
  { T136 = TERNARY(T116, 0x0L, testSlave__axi_awburst.values[0]);}
  { T137.values[0] = TERNARY_1(T123, testSlave__S_AXI_AWBURST.values[0], T136);}
  val_t T138;
  { T138 = TERNARY(T116, 0x0L, testSlave__axi_awaddr.values[0]);}
  val_t T139;
  { T139 = TERNARY_1(T123, testSlave__S_AXI_AWADDR.values[0], T138);}
  val_t T140;
  T140 = testSlave__axi_awburst.values[0] == 0x0L;
  val_t T141;
  { T141 = T131 & T140;}
  val_t T142;
  { T142 = TERNARY_1(T141, testSlave__axi_awaddr.values[0], T139);}
  val_t T143;
  { T143 = T142 | 0x0L << 6;}
  val_t T144;
  { T144 = testSlave__axi_awaddr.values[0] >> 2;}
  T144 = T144 & 0xfL;
  val_t T145;
  { T145 = T144+0x1L;}
  T145 = T145 & 0xfL;
  val_t T146;
  { T146 = T145 & 0xfL;}
  val_t T147;
  T147 = T146 << 0x2L;
  T147 = T147 & 0x3fL;
  val_t T148;
  { T148 = T147 | 0x0L << 6;}
  val_t T149;
  { T149 = ~0x3cL;}
  T149 = T149 & 0x7fL;
  val_t T150;
  { T150 = T142 | 0x0L << 6;}
  val_t T151;
  { T151 = T150 & T149;}
  val_t T152;
  { T152 = T151 | T148;}
  val_t T153;
  T153 = testSlave__axi_awburst.values[0] == 0x1L;
  val_t T154;
  { T154 = T140 ^ 0x1L;}
  val_t T155;
  { T155 = T154 & T153;}
  val_t T156;
  { T156 = T131 & T155;}
  val_t T157;
  { T157 = TERNARY_1(T156, T152, T143);}
  val_t T158;
  { T158 = ~0x3L;}
  T158 = T158 & 0x7L;
  val_t T159;
  T159 = (T158 >> 2) & 1;
  val_t T160;
  { T160 = TERNARY(T159, 0xfL, 0x0L);}
  val_t T161;
  { T161 = T158 | T160 << 3;}
  val_t T162;
  { T162 = T157 & T161;}
  val_t T163;
  { T163 = T162 | 0x0L;}
  val_t T164;
  { T164 = TERNARY_1(T156, T163, T157);}
  val_t T165;
  { T165 = testSlave__axi_awaddr.values[0] >> 2;}
  T165 = T165 & 0xfL;
  val_t T166;
  { T166 = T165+0x1L;}
  T166 = T166 & 0xfL;
  val_t T167;
  { T167 = T166 | 0x0L << 4;}
  val_t T168;
  { T168 = T140 | T153;}
  val_t T169;
  { T169 = T168 ^ 0x1L;}
  val_t T170;
  { T170 = T131 & T169;}
  val_t T171;
  { T171 = TERNARY_1(T170, T167, T164);}
  { T172.values[0] = T171;}
  T172.values[0] = T172.values[0] & 0x3fL;
  val_t T173;
  T173 = (T4 >> 0) & 1;
  val_t T174;
  { T174 = testSlave__mem_wren.values[0] & T173;}
  val_t T175;
  { T175 = TERNARY_1(T174, testSlave__data_in.values[0], testSlave__bram_0.values[0]);}
  { T176.values[0] = TERNARY(reset.values[0], 0x0L, T175);}
  val_t T177;
  T177 = (testSlave__mem_address.values[0] >> 0) & 1;
  val_t T178;
  { T178 = TERNARY_1(T177, testSlave__bram_1.values[0], testSlave__bram_0.values[0]);}
  val_t T179;
  T179 = (testSlave__mem_address.values[0] >> 0) & 1;
  val_t T180;
  { T180 = TERNARY_1(T179, testSlave__bram_3.values[0], testSlave__bram_2.values[0]);}
  val_t T181;
  T181 = (testSlave__mem_address.values[0] >> 1) & 1;
  val_t T182;
  { T182 = TERNARY_1(T181, T180, T178);}
  val_t T183;
  T183 = (testSlave__mem_address.values[0] >> 0) & 1;
  val_t T184;
  { T184 = TERNARY_1(T183, testSlave__bram_5.values[0], testSlave__bram_4.values[0]);}
  val_t T185;
  T185 = (testSlave__mem_address.values[0] >> 0) & 1;
  val_t T186;
  { T186 = TERNARY_1(T185, testSlave__bram_7.values[0], testSlave__bram_6.values[0]);}
  val_t T187;
  T187 = (testSlave__mem_address.values[0] >> 1) & 1;
  val_t T188;
  { T188 = TERNARY_1(T187, T186, T184);}
  val_t T189;
  T189 = (testSlave__mem_address.values[0] >> 2) & 1;
  val_t T190;
  { T190 = TERNARY_1(T189, T188, T182);}
  val_t T191;
  T191 = (testSlave__mem_address.values[0] >> 0) & 1;
  val_t T192;
  { T192 = TERNARY_1(T191, testSlave__bram_9.values[0], testSlave__bram_8.values[0]);}
  val_t T193;
  T193 = (testSlave__mem_address.values[0] >> 0) & 1;
  val_t T194;
  { T194 = TERNARY_1(T193, testSlave__bram_11.values[0], testSlave__bram_10.values[0]);}
  val_t T195;
  T195 = (testSlave__mem_address.values[0] >> 1) & 1;
  val_t T196;
  { T196 = TERNARY_1(T195, T194, T192);}
  val_t T197;
  T197 = (testSlave__mem_address.values[0] >> 0) & 1;
  val_t T198;
  { T198 = TERNARY_1(T197, testSlave__bram_13.values[0], testSlave__bram_12.values[0]);}
  val_t T199;
  T199 = (testSlave__mem_address.values[0] >> 0) & 1;
  val_t T200;
  { T200 = TERNARY_1(T199, testSlave__bram_15.values[0], testSlave__bram_14.values[0]);}
  val_t T201;
  T201 = (testSlave__mem_address.values[0] >> 1) & 1;
  val_t T202;
  { T202 = TERNARY_1(T201, T200, T198);}
  val_t T203;
  T203 = (testSlave__mem_address.values[0] >> 2) & 1;
  val_t T204;
  { T204 = TERNARY_1(T203, T202, T196);}
  val_t T205;
  T205 = (testSlave__mem_address.values[0] >> 3) & 1;
  val_t T206;
  { T206 = TERNARY_1(T205, T204, T190);}
  { testSlave__data_out.values[0] = T206;}
  { testSlave__mem_rden.values[0] = testSlave__axi_arv_arr_flag.values[0];}
  { T207.values[0] = TERNARY_1(testSlave__mem_rden.values[0], testSlave__data_out.values[0], testSlave__axi_rdata.values[0]);}
  { testSlave__S_AXI_RDATA.values[0] = testSlave__axi_rdata.values[0];}
  val_t T208;
  { T208 = reset.values[0] ^ 0x1L;}
  val_t T209;
  { T209 = TERNARY(T208, 0x0L, testSlave__axi_rresp.values[0]);}
  val_t T210;
  { T210 = testSlave__axi_rvalid.values[0] ^ 0x1L;}
  val_t T211;
  { T211 = testSlave__axi_arv_arr_flag.values[0] & T210;}
  val_t T212;
  { T212 = T208 ^ 0x1L;}
  val_t T213;
  { T213 = T212 & T211;}
  { T214.values[0] = TERNARY(T213, 0x0L, T209);}
  { testSlave__S_AXI_RRESP.values[0] = testSlave__axi_rresp.values[0];}
  val_t T215;
  { T215 = TERNARY(T66, 0x0L, testSlave__axi_rlast.values[0]);}
  val_t T216;
  { T216 = TERNARY(T73, 0x0L, T215);}
  val_t T217;
  { T217 = TERNARY(T83, 0x0L, T216);}
  val_t T218;
  { T218 = testSlave__axi_rlast.values[0] ^ 0x1L;}
  val_t T219;
  T219 = testSlave__axi_arlen_cntr.values[0] == testSlave__axi_arlen.values[0];
  val_t T220;
  { T220 = T219 & T218;}
  val_t T221;
  { T221 = T220 & testSlave__axi_arv_arr_flag.values[0];}
  val_t T222;
  { T222 = T71 | T80;}
  val_t T223;
  { T223 = T222 ^ 0x1L;}
  val_t T224;
  { T224 = T223 & T221;}
  val_t T225;
  { T225 = T72 & T224;}
  val_t T226;
  { T226 = TERNARY(T225, 0x1L, T217);}
  val_t T227;
  { T227 = T222 | T221;}
  val_t T228;
  { T228 = T227 ^ 0x1L;}
  val_t T229;
  { T229 = T228 & testSlave__S_AXI_RREADY.values[0];}
  val_t T230;
  { T230 = T72 & T229;}
  { T231.values[0] = TERNARY(T230, 0x0L, T226);}
  { testSlave__S_AXI_RLAST.values[0] = testSlave__axi_rlast.values[0];}
  { testSlave__S_AXI_ARREADY.values[0] = testSlave__axi_arready.values[0];}
  { testSlave__S_AXI_WREADY.values[0] = testSlave__axi_wready.values[0];}
  { testSlave__S_AXI_AWREADY.values[0] = testSlave__axi_awready.values[0];}
  { testSlave__S_AXI_BVALID.values[0] = testSlave__axi_bvalid.values[0];}
  { testSlave__S_AXI_BID.values[0] = testSlave__S_AXI_AWID.values[0];}
  val_t T232;
  { T232 = reset.values[0] ^ 0x1L;}
  val_t T233;
  { T233 = TERNARY(T232, 0x0L, testSlave__axi_awready.values[0]);}
  val_t T234;
  { T234 = testSlave__axi_arv_arr_flag.values[0] ^ 0x1L;}
  val_t T235;
  { T235 = testSlave__axi_awv_awr_flag.values[0] ^ 0x1L;}
  val_t T236;
  { T236 = testSlave__axi_awready.values[0] ^ 0x1L;}
  val_t T237;
  { T237 = T236 & testSlave__S_AXI_AWVALID.values[0];}
  val_t T238;
  { T238 = T237 & T235;}
  val_t T239;
  { T239 = T238 & T234;}
  val_t T240;
  { T240 = T232 ^ 0x1L;}
  val_t T241;
  { T241 = T240 & T239;}
  val_t T242;
  { T242 = TERNARY(T241, 0x1L, T233);}
  val_t T243;
  { T243 = testSlave__S_AXI_WLAST.values[0] & testSlave__axi_wready.values[0];}
  val_t T244;
  { T244 = T239 | T243;}
  val_t T245;
  { T245 = T244 ^ 0x1L;}
  val_t T246;
  { T246 = T240 & T245;}
  { T247.values[0] = TERNARY(T246, 0x0L, T242);}
  val_t T248;
  { T248 = TERNARY(T208, 0x0L, testSlave__axi_rvalid.values[0]);}
  val_t T249;
  { T249 = TERNARY(T213, 0x1L, T248);}
  val_t T250;
  { T250 = testSlave__axi_rvalid.values[0] & testSlave__S_AXI_RREADY.values[0];}
  val_t T251;
  { T251 = T211 ^ 0x1L;}
  val_t T252;
  { T252 = T251 & T250;}
  val_t T253;
  { T253 = T212 & T252;}
  { T254.values[0] = TERNARY(T253, 0x0L, T249);}
  val_t T255;
  { T255 = TERNARY(T66, 0x0L, testSlave__axi_arlen_cntr.values[0]);}
  val_t T256;
  { T256 = testSlave__axi_arlen_cntr.values[0]+0x1L;}
  T256 = T256 & 0xffL;
  { T257.values[0] = TERNARY_1(T83, T256, T255);}
  val_t T258;
  { T258 = TERNARY(T66, 0x0L, testSlave__axi_arlen.values[0]);}
  { T259.values[0] = TERNARY_1(T73, testSlave__S_AXI_ARLEN.values[0], T258);}
  val_t T260;
  { T260 = reset.values[0] ^ 0x1L;}
  val_t T261;
  { T261 = TERNARY(T260, 0x0L, testSlave__axi_arready.values[0]);}
  val_t T262;
  { T262 = testSlave__axi_arv_arr_flag.values[0] ^ 0x1L;}
  val_t T263;
  { T263 = testSlave__axi_awv_awr_flag.values[0] ^ 0x1L;}
  val_t T264;
  { T264 = testSlave__axi_arready.values[0] ^ 0x1L;}
  val_t T265;
  { T265 = T264 & testSlave__S_AXI_ARVALID.values[0];}
  val_t T266;
  { T266 = T265 & T263;}
  val_t T267;
  { T267 = T266 & T262;}
  val_t T268;
  { T268 = T260 ^ 0x1L;}
  val_t T269;
  { T269 = T268 & T267;}
  val_t T270;
  { T270 = TERNARY(T269, 0x1L, T261);}
  val_t T271;
  T271 = testSlave__axi_arlen_cntr.values[0] == testSlave__axi_arlen.values[0];
  val_t T272;
  { T272 = testSlave__axi_rvalid.values[0] & testSlave__S_AXI_RREADY.values[0];}
  val_t T273;
  { T273 = T272 & T271;}
  val_t T274;
  { T274 = T267 | T273;}
  val_t T275;
  { T275 = T274 ^ 0x1L;}
  val_t T276;
  { T276 = T268 & T275;}
  { T277.values[0] = TERNARY(T276, 0x0L, T270);}
  val_t T278;
  { T278 = TERNARY(T260, 0x0L, testSlave__axi_arv_arr_flag.values[0]);}
  val_t T279;
  { T279 = TERNARY(T269, 0x1L, T278);}
  val_t T280;
  { T280 = T267 ^ 0x1L;}
  val_t T281;
  { T281 = T280 & T273;}
  val_t T282;
  { T282 = T268 & T281;}
  { T283.values[0] = TERNARY(T282, 0x0L, T279);}
  val_t T284;
  { T284 = TERNARY(T232, 0x0L, testSlave__axi_awv_awr_flag.values[0]);}
  val_t T285;
  { T285 = TERNARY(T241, 0x1L, T284);}
  val_t T286;
  { T286 = T239 ^ 0x1L;}
  val_t T287;
  { T287 = T286 & T243;}
  val_t T288;
  { T288 = T240 & T287;}
  { T289.values[0] = TERNARY(T288, 0x0L, T285);}
  val_t T290;
  { T290 = reset.values[0] ^ 0x1L;}
  val_t T291;
  { T291 = TERNARY(T290, 0x0L, testSlave__axi_wready.values[0]);}
  val_t T292;
  { T292 = testSlave__axi_wready.values[0] ^ 0x1L;}
  val_t T293;
  { T293 = T292 & testSlave__S_AXI_WVALID.values[0];}
  val_t T294;
  { T294 = T293 & testSlave__axi_awv_awr_flag.values[0];}
  val_t T295;
  { T295 = T290 ^ 0x1L;}
  val_t T296;
  { T296 = T295 & T294;}
  val_t T297;
  { T297 = TERNARY(T296, 0x1L, T291);}
  val_t T298;
  { T298 = testSlave__S_AXI_WLAST.values[0] & testSlave__axi_wready.values[0];}
  val_t T299;
  { T299 = T294 ^ 0x1L;}
  val_t T300;
  { T300 = T299 & T298;}
  val_t T301;
  { T301 = T295 & T300;}
  { T302.values[0] = TERNARY(T301, 0x0L, T297);}
  val_t T303;
  { T303 = reset.values[0] ^ 0x1L;}
  val_t T304;
  { T304 = TERNARY(T303, 0x0L, testSlave__axi_bvalid.values[0]);}
  val_t T305;
  { T305 = ~testSlave__axi_bvalid.values[0];}
  T305 = T305 & 0x1L;
  val_t T306;
  { T306 = testSlave__axi_awv_awr_flag.values[0] & testSlave__axi_wready.values[0];}
  val_t T307;
  { T307 = T306 & testSlave__S_AXI_WVALID.values[0];}
  val_t T308;
  { T308 = T307 & T305;}
  val_t T309;
  { T309 = T308 & testSlave__S_AXI_WLAST.values[0];}
  val_t T310;
  { T310 = T303 ^ 0x1L;}
  val_t T311;
  { T311 = T310 & T309;}
  val_t T312;
  { T312 = TERNARY(T311, 0x1L, T304);}
  val_t T313;
  { T313 = testSlave__S_AXI_BREADY.values[0] & testSlave__axi_bvalid.values[0];}
  val_t T314;
  { T314 = T309 ^ 0x1L;}
  val_t T315;
  { T315 = T310 & T314;}
  val_t T316;
  { T316 = T315 & T313;}
  { T317.values[0] = TERNARY(T316, 0x0L, T312);}
  val_t T318;
  { T318 = TERNARY(T303, 0x0L, testSlave__axi_bresp.values[0]);}
  { T319.values[0] = TERNARY(T311, 0x0L, T318);}
  { testSlave__S_AXI_BRESP.values[0] = testSlave__axi_bresp.values[0];}
}


void testSlave_t::clock_hi ( dat_t<1> reset ) {
  testSlave__bram_15__shadow = T9;
  testSlave__bram_14__shadow = T13;
  testSlave__bram_13__shadow = T17;
  testSlave__bram_12__shadow = T21;
  testSlave__bram_11__shadow = T25;
  testSlave__bram_10__shadow = T29;
  testSlave__bram_9__shadow = T33;
  testSlave__bram_8__shadow = T37;
  testSlave__bram_7__shadow = T41;
  testSlave__bram_6__shadow = T45;
  testSlave__bram_5__shadow = T49;
  testSlave__bram_4__shadow = T53;
  testSlave__bram_3__shadow = T57;
  testSlave__bram_2__shadow = T61;
  testSlave__bram_1__shadow = T65;
  testSlave__axi_arburst__shadow = T74;
  testSlave__axi_araddr__shadow = T115;
  testSlave__axi_awlen_cntr__shadow = T133;
  testSlave__axi_awlen__shadow = T135;
  testSlave__axi_awburst__shadow = T137;
  testSlave__axi_awaddr__shadow = T172;
  testSlave__bram_0__shadow = T176;
  testSlave__axi_rdata__shadow = T207;
  testSlave__axi_rresp__shadow = T214;
  testSlave__axi_rlast__shadow = T231;
  testSlave__axi_awready__shadow = T247;
  testSlave__axi_rvalid__shadow = T254;
  testSlave__axi_arlen_cntr__shadow = T257;
  testSlave__axi_arlen__shadow = T259;
  testSlave__axi_arready__shadow = T277;
  testSlave__axi_arv_arr_flag__shadow = T283;
  testSlave__axi_awv_awr_flag__shadow = T289;
  testSlave__axi_wready__shadow = T302;
  testSlave__axi_bvalid__shadow = T317;
  testSlave__axi_bresp__shadow = T319;
  testSlave__bram_15 = T9;
  testSlave__bram_14 = T13;
  testSlave__bram_13 = T17;
  testSlave__bram_12 = T21;
  testSlave__bram_11 = T25;
  testSlave__bram_10 = T29;
  testSlave__bram_9 = T33;
  testSlave__bram_8 = T37;
  testSlave__bram_7 = T41;
  testSlave__bram_6 = T45;
  testSlave__bram_5 = T49;
  testSlave__bram_4 = T53;
  testSlave__bram_3 = T57;
  testSlave__bram_2 = T61;
  testSlave__bram_1 = T65;
  testSlave__axi_arburst = T74;
  testSlave__axi_araddr = T115;
  testSlave__axi_awlen_cntr = T133;
  testSlave__axi_awlen = T135;
  testSlave__axi_awburst = T137;
  testSlave__axi_awaddr = T172;
  testSlave__bram_0 = T176;
  testSlave__axi_rdata = T207;
  testSlave__axi_rresp = T214;
  testSlave__axi_rlast = T231;
  testSlave__axi_awready = T247;
  testSlave__axi_rvalid = T254;
  testSlave__axi_arlen_cntr = T257;
  testSlave__axi_arlen = T259;
  testSlave__axi_arready = T277;
  testSlave__axi_arv_arr_flag = T283;
  testSlave__axi_awv_awr_flag = T289;
  testSlave__axi_wready = T302;
  testSlave__axi_bvalid = T317;
  testSlave__axi_bresp = T319;
}


void testSlave_api_t::init_sim_data (  ) {
  sim_data.inputs.clear();
  sim_data.outputs.clear();
  sim_data.signals.clear();
  testSlave_t* mod = dynamic_cast<testSlave_t*>(module);
  assert(mod);
  sim_data.inputs.push_back(new dat_api<1>(&mod->testSlave__S_AXI_RREADY));
  sim_data.inputs.push_back(new dat_api<1>(&mod->testSlave__S_AXI_ARVALID));
  sim_data.inputs.push_back(new dat_api<6>(&mod->testSlave__S_AXI_ARID));
  sim_data.inputs.push_back(new dat_api<6>(&mod->testSlave__S_AXI_ARADDR));
  sim_data.inputs.push_back(new dat_api<8>(&mod->testSlave__S_AXI_ARLEN));
  sim_data.inputs.push_back(new dat_api<3>(&mod->testSlave__S_AXI_ARSIZE));
  sim_data.inputs.push_back(new dat_api<2>(&mod->testSlave__S_AXI_ARBURST));
  sim_data.inputs.push_back(new dat_api<1>(&mod->testSlave__S_AXI_WVALID));
  sim_data.inputs.push_back(new dat_api<32>(&mod->testSlave__S_AXI_WDATA));
  sim_data.inputs.push_back(new dat_api<4>(&mod->testSlave__S_AXI_WSTRB));
  sim_data.inputs.push_back(new dat_api<1>(&mod->testSlave__S_AXI_WLAST));
  sim_data.inputs.push_back(new dat_api<1>(&mod->testSlave__S_AXI_AWVALID));
  sim_data.inputs.push_back(new dat_api<6>(&mod->testSlave__S_AXI_AWID));
  sim_data.inputs.push_back(new dat_api<6>(&mod->testSlave__S_AXI_AWADDR));
  sim_data.inputs.push_back(new dat_api<8>(&mod->testSlave__S_AXI_AWLEN));
  sim_data.inputs.push_back(new dat_api<3>(&mod->testSlave__S_AXI_AWSIZE));
  sim_data.inputs.push_back(new dat_api<2>(&mod->testSlave__S_AXI_AWBURST));
  sim_data.inputs.push_back(new dat_api<1>(&mod->testSlave__S_AXI_BREADY));
  sim_data.outputs.push_back(new dat_api<1>(&mod->testSlave__S_AXI_RVALID));
  sim_data.outputs.push_back(new dat_api<6>(&mod->testSlave__S_AXI_RID));
  sim_data.outputs.push_back(new dat_api<32>(&mod->testSlave__S_AXI_RDATA));
  sim_data.outputs.push_back(new dat_api<2>(&mod->testSlave__S_AXI_RRESP));
  sim_data.outputs.push_back(new dat_api<1>(&mod->testSlave__S_AXI_RLAST));
  sim_data.outputs.push_back(new dat_api<1>(&mod->testSlave__S_AXI_ARREADY));
  sim_data.outputs.push_back(new dat_api<1>(&mod->testSlave__S_AXI_WREADY));
  sim_data.outputs.push_back(new dat_api<1>(&mod->testSlave__S_AXI_AWREADY));
  sim_data.outputs.push_back(new dat_api<1>(&mod->testSlave__S_AXI_BVALID));
  sim_data.outputs.push_back(new dat_api<6>(&mod->testSlave__S_AXI_BID));
  sim_data.outputs.push_back(new dat_api<2>(&mod->testSlave__S_AXI_BRESP));
  sim_data.signals.push_back(new dat_api<32>(&mod->testSlave__data_in));
  sim_data.signal_map["testSlave.data_in"] = 0;
  sim_data.signals.push_back(new dat_api<4>(&mod->testSlave__mem_address));
  sim_data.signal_map["testSlave.mem_address"] = 1;
  sim_data.signals.push_back(new dat_api<1>(&mod->testSlave__mem_wren));
  sim_data.signal_map["testSlave.mem_wren"] = 2;
  sim_data.signals.push_back(new dat_api<32>(&mod->testSlave__bram_15));
  sim_data.signal_map["testSlave.bram_15"] = 3;
  sim_data.signals.push_back(new dat_api<32>(&mod->testSlave__bram_14));
  sim_data.signal_map["testSlave.bram_14"] = 4;
  sim_data.signals.push_back(new dat_api<32>(&mod->testSlave__bram_13));
  sim_data.signal_map["testSlave.bram_13"] = 5;
  sim_data.signals.push_back(new dat_api<32>(&mod->testSlave__bram_12));
  sim_data.signal_map["testSlave.bram_12"] = 6;
  sim_data.signals.push_back(new dat_api<32>(&mod->testSlave__bram_11));
  sim_data.signal_map["testSlave.bram_11"] = 7;
  sim_data.signals.push_back(new dat_api<32>(&mod->testSlave__bram_10));
  sim_data.signal_map["testSlave.bram_10"] = 8;
  sim_data.signals.push_back(new dat_api<32>(&mod->testSlave__bram_9));
  sim_data.signal_map["testSlave.bram_9"] = 9;
  sim_data.signals.push_back(new dat_api<32>(&mod->testSlave__bram_8));
  sim_data.signal_map["testSlave.bram_8"] = 10;
  sim_data.signals.push_back(new dat_api<32>(&mod->testSlave__bram_7));
  sim_data.signal_map["testSlave.bram_7"] = 11;
  sim_data.signals.push_back(new dat_api<32>(&mod->testSlave__bram_6));
  sim_data.signal_map["testSlave.bram_6"] = 12;
  sim_data.signals.push_back(new dat_api<32>(&mod->testSlave__bram_5));
  sim_data.signal_map["testSlave.bram_5"] = 13;
  sim_data.signals.push_back(new dat_api<32>(&mod->testSlave__bram_4));
  sim_data.signal_map["testSlave.bram_4"] = 14;
  sim_data.signals.push_back(new dat_api<32>(&mod->testSlave__bram_3));
  sim_data.signal_map["testSlave.bram_3"] = 15;
  sim_data.signals.push_back(new dat_api<32>(&mod->testSlave__bram_2));
  sim_data.signal_map["testSlave.bram_2"] = 16;
  sim_data.signals.push_back(new dat_api<32>(&mod->testSlave__bram_1));
  sim_data.signal_map["testSlave.bram_1"] = 17;
  sim_data.signals.push_back(new dat_api<2>(&mod->testSlave__axi_arburst));
  sim_data.signal_map["testSlave.axi_arburst"] = 18;
  sim_data.signals.push_back(new dat_api<6>(&mod->testSlave__axi_araddr));
  sim_data.signal_map["testSlave.axi_araddr"] = 19;
  sim_data.signals.push_back(new dat_api<8>(&mod->testSlave__axi_awlen_cntr));
  sim_data.signal_map["testSlave.axi_awlen_cntr"] = 20;
  sim_data.signals.push_back(new dat_api<8>(&mod->testSlave__axi_awlen));
  sim_data.signal_map["testSlave.axi_awlen"] = 21;
  sim_data.signals.push_back(new dat_api<2>(&mod->testSlave__axi_awburst));
  sim_data.signal_map["testSlave.axi_awburst"] = 22;
  sim_data.signals.push_back(new dat_api<6>(&mod->testSlave__axi_awaddr));
  sim_data.signal_map["testSlave.axi_awaddr"] = 23;
  sim_data.signals.push_back(new dat_api<32>(&mod->testSlave__bram_0));
  sim_data.signal_map["testSlave.bram_0"] = 24;
  sim_data.signals.push_back(new dat_api<32>(&mod->testSlave__data_out));
  sim_data.signal_map["testSlave.data_out"] = 25;
  sim_data.signals.push_back(new dat_api<1>(&mod->testSlave__mem_rden));
  sim_data.signal_map["testSlave.mem_rden"] = 26;
  sim_data.signals.push_back(new dat_api<32>(&mod->testSlave__axi_rdata));
  sim_data.signal_map["testSlave.axi_rdata"] = 27;
  sim_data.signals.push_back(new dat_api<2>(&mod->testSlave__axi_rresp));
  sim_data.signal_map["testSlave.axi_rresp"] = 28;
  sim_data.signals.push_back(new dat_api<1>(&mod->testSlave__axi_rlast));
  sim_data.signal_map["testSlave.axi_rlast"] = 29;
  sim_data.signals.push_back(new dat_api<1>(&mod->testSlave__axi_awready));
  sim_data.signal_map["testSlave.axi_awready"] = 30;
  sim_data.signals.push_back(new dat_api<1>(&mod->testSlave__axi_rvalid));
  sim_data.signal_map["testSlave.axi_rvalid"] = 31;
  sim_data.signals.push_back(new dat_api<8>(&mod->testSlave__axi_arlen_cntr));
  sim_data.signal_map["testSlave.axi_arlen_cntr"] = 32;
  sim_data.signals.push_back(new dat_api<8>(&mod->testSlave__axi_arlen));
  sim_data.signal_map["testSlave.axi_arlen"] = 33;
  sim_data.signals.push_back(new dat_api<1>(&mod->testSlave__axi_arready));
  sim_data.signal_map["testSlave.axi_arready"] = 34;
  sim_data.signals.push_back(new dat_api<1>(&mod->testSlave__axi_arv_arr_flag));
  sim_data.signal_map["testSlave.axi_arv_arr_flag"] = 35;
  sim_data.signals.push_back(new dat_api<1>(&mod->testSlave__axi_awv_awr_flag));
  sim_data.signal_map["testSlave.axi_awv_awr_flag"] = 36;
  sim_data.signals.push_back(new dat_api<1>(&mod->testSlave__axi_wready));
  sim_data.signal_map["testSlave.axi_wready"] = 37;
  sim_data.signals.push_back(new dat_api<1>(&mod->testSlave__axi_bvalid));
  sim_data.signal_map["testSlave.axi_bvalid"] = 38;
  sim_data.signals.push_back(new dat_api<2>(&mod->testSlave__axi_bresp));
  sim_data.signal_map["testSlave.axi_bresp"] = 39;
  sim_data.clk_map["clk"] = new clk_api(&mod->clk);
}
