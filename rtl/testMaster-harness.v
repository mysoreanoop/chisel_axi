module test;
  reg[0:0] M_AXI_RVALID = 0;
  reg[5:0] M_AXI_RID = 0;
  reg[31:0] M_AXI_RDATA = 0;
  reg[1:0] M_AXI_RRESP = 0;
  reg[0:0] M_AXI_RLAST = 0;
  reg[0:0] M_AXI_ARREADY = 0;
  reg[0:0] M_AXI_WREADY = 0;
  reg[0:0] M_AXI_AWREADY = 0;
  reg[0:0] M_AXI_BVALID = 0;
  reg[5:0] M_AXI_BID = 0;
  reg[1:0] M_AXI_BRESP = 0;
  reg[0:0] io_INIT_AXI_TXN = 0;
  wire[0:0] M_AXI_RREADY;
  wire[0:0] M_AXI_ARVALID;
  wire[5:0] M_AXI_ARID;
  wire[5:0] M_AXI_ARADDR;
  wire[7:0] M_AXI_ARLEN;
  wire[2:0] M_AXI_ARSIZE;
  wire[1:0] M_AXI_ARBURST;
  wire[0:0] M_AXI_WVALID;
  wire[31:0] M_AXI_WDATA;
  wire[3:0] M_AXI_WSTRB;
  wire[0:0] M_AXI_WLAST;
  wire[0:0] M_AXI_AWVALID;
  wire[5:0] M_AXI_AWID;
  wire[5:0] M_AXI_AWADDR;
  wire[7:0] M_AXI_AWLEN;
  wire[2:0] M_AXI_AWSIZE;
  wire[1:0] M_AXI_AWBURST;
  wire[0:0] M_AXI_BREADY;
  wire[0:0] io_TXN_DONE;
  reg clk = 0;
  reg reset = 1;
  integer clk_len;
  always #clk_len clk = ~clk;
  reg vcdon = 0;
  reg [1023:0] vcdfile = 0;
  reg [1023:0] vpdfile = 0;

  /*** DUT instantiation ***/
  testMaster testMaster(
    .clk(clk),
    .reset(reset),
    .M_AXI_RVALID(M_AXI_RVALID),
    .M_AXI_RID(M_AXI_RID),
    .M_AXI_RDATA(M_AXI_RDATA),
    .M_AXI_RRESP(M_AXI_RRESP),
    .M_AXI_RLAST(M_AXI_RLAST),
    .M_AXI_ARREADY(M_AXI_ARREADY),
    .M_AXI_WREADY(M_AXI_WREADY),
    .M_AXI_AWREADY(M_AXI_AWREADY),
    .M_AXI_BVALID(M_AXI_BVALID),
    .M_AXI_BID(M_AXI_BID),
    .M_AXI_BRESP(M_AXI_BRESP),
    .io_INIT_AXI_TXN(io_INIT_AXI_TXN),
    .M_AXI_RREADY(M_AXI_RREADY),
    .M_AXI_ARVALID(M_AXI_ARVALID),
    .M_AXI_ARID(M_AXI_ARID),
    .M_AXI_ARADDR(M_AXI_ARADDR),
    .M_AXI_ARLEN(M_AXI_ARLEN),
    .M_AXI_ARSIZE(M_AXI_ARSIZE),
    .M_AXI_ARBURST(M_AXI_ARBURST),
    .M_AXI_WVALID(M_AXI_WVALID),
    .M_AXI_WDATA(M_AXI_WDATA),
    .M_AXI_WSTRB(M_AXI_WSTRB),
    .M_AXI_WLAST(M_AXI_WLAST),
    .M_AXI_AWVALID(M_AXI_AWVALID),
    .M_AXI_AWID(M_AXI_AWID),
    .M_AXI_AWADDR(M_AXI_AWADDR),
    .M_AXI_AWLEN(M_AXI_AWLEN),
    .M_AXI_AWSIZE(M_AXI_AWSIZE),
    .M_AXI_AWBURST(M_AXI_AWBURST),
    .M_AXI_BREADY(M_AXI_BREADY),
    .io_TXN_DONE(io_TXN_DONE));

  initial begin
    clk_len = `CLOCK_PERIOD;
    $init_clks(clk_len);
    $init_rsts(reset);
    $init_ins(M_AXI_RVALID, M_AXI_RID, M_AXI_RDATA, M_AXI_RRESP, M_AXI_RLAST, M_AXI_ARREADY, M_AXI_WREADY, M_AXI_AWREADY, M_AXI_BVALID, M_AXI_BID, M_AXI_BRESP, io_INIT_AXI_TXN);
    $init_outs(M_AXI_RREADY, M_AXI_ARVALID, M_AXI_ARID, M_AXI_ARADDR, M_AXI_ARLEN, M_AXI_ARSIZE, M_AXI_ARBURST, M_AXI_WVALID, M_AXI_WDATA, M_AXI_WSTRB, M_AXI_WLAST, M_AXI_AWVALID, M_AXI_AWID, M_AXI_AWADDR, M_AXI_AWLEN, M_AXI_AWSIZE, M_AXI_AWBURST, M_AXI_BREADY, io_TXN_DONE);
    $init_sigs(testMaster);
    /*** VCD & VPD dump ***/
    if ($value$plusargs("vcdfile=%s", vcdfile)) begin
      $dumpfile(vcdfile);
      $dumpvars(0, testMaster);
      $dumpoff;
      vcdon = 0;
    end
    if ($value$plusargs("vpdfile=%s", vpdfile)) begin
      $vcdplusfile(vpdfile);
      $vcdpluson(0);
      $vcdplusautoflushon;
    end
    if ($test$plusargs("vpdmem")) begin
      $vcdplusmemon;
    end
  end

  always @(negedge clk) begin
    $tick();
    if (vcdfile && (reset)) begin
      $dumpoff;
      vcdon = 0;
    end
    else if (vcdfile && !vcdon) begin
      $dumpon;
      vcdon = 1;
    end
  end

endmodule
