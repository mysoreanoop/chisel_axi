module test;
  reg[0:0] S_AXI_RREADY = 0;
  reg[0:0] S_AXI_ARVALID = 0;
  reg[5:0] S_AXI_ARID = 0;
  reg[5:0] S_AXI_ARADDR = 0;
  reg[7:0] S_AXI_ARLEN = 0;
  reg[2:0] S_AXI_ARSIZE = 0;
  reg[1:0] S_AXI_ARBURST = 0;
  reg[0:0] S_AXI_WVALID = 0;
  reg[31:0] S_AXI_WDATA = 0;
  reg[3:0] S_AXI_WSTRB = 0;
  reg[0:0] S_AXI_WLAST = 0;
  reg[0:0] S_AXI_AWVALID = 0;
  reg[5:0] S_AXI_AWID = 0;
  reg[5:0] S_AXI_AWADDR = 0;
  reg[7:0] S_AXI_AWLEN = 0;
  reg[2:0] S_AXI_AWSIZE = 0;
  reg[1:0] S_AXI_AWBURST = 0;
  reg[0:0] S_AXI_BREADY = 0;
  wire[0:0] S_AXI_RVALID;
  wire[5:0] S_AXI_RID;
  wire[31:0] S_AXI_RDATA;
  wire[1:0] S_AXI_RRESP;
  wire[0:0] S_AXI_RLAST;
  wire[0:0] S_AXI_ARREADY;
  wire[0:0] S_AXI_WREADY;
  wire[0:0] S_AXI_AWREADY;
  wire[0:0] S_AXI_BVALID;
  wire[5:0] S_AXI_BID;
  wire[1:0] S_AXI_BRESP;
  reg clk = 0;
  reg reset = 1;
  integer clk_len;
  always #clk_len clk = ~clk;
  reg vcdon = 0;
  reg [1023:0] vcdfile = 0;
  reg [1023:0] vpdfile = 0;

  /*** DUT instantiation ***/
  testSlave testSlave(
    .clk(clk),
    .reset(reset),
    .S_AXI_RREADY(S_AXI_RREADY),
    .S_AXI_ARVALID(S_AXI_ARVALID),
    .S_AXI_ARID(S_AXI_ARID),
    .S_AXI_ARADDR(S_AXI_ARADDR),
    .S_AXI_ARLEN(S_AXI_ARLEN),
    .S_AXI_ARSIZE(S_AXI_ARSIZE),
    .S_AXI_ARBURST(S_AXI_ARBURST),
    .S_AXI_WVALID(S_AXI_WVALID),
    .S_AXI_WDATA(S_AXI_WDATA),
    .S_AXI_WSTRB(S_AXI_WSTRB),
    .S_AXI_WLAST(S_AXI_WLAST),
    .S_AXI_AWVALID(S_AXI_AWVALID),
    .S_AXI_AWID(S_AXI_AWID),
    .S_AXI_AWADDR(S_AXI_AWADDR),
    .S_AXI_AWLEN(S_AXI_AWLEN),
    .S_AXI_AWSIZE(S_AXI_AWSIZE),
    .S_AXI_AWBURST(S_AXI_AWBURST),
    .S_AXI_BREADY(S_AXI_BREADY),
    .S_AXI_RVALID(S_AXI_RVALID),
    .S_AXI_RID(S_AXI_RID),
    .S_AXI_RDATA(S_AXI_RDATA),
    .S_AXI_RRESP(S_AXI_RRESP),
    .S_AXI_RLAST(S_AXI_RLAST),
    .S_AXI_ARREADY(S_AXI_ARREADY),
    .S_AXI_WREADY(S_AXI_WREADY),
    .S_AXI_AWREADY(S_AXI_AWREADY),
    .S_AXI_BVALID(S_AXI_BVALID),
    .S_AXI_BID(S_AXI_BID),
    .S_AXI_BRESP(S_AXI_BRESP));

  initial begin
    clk_len = `CLOCK_PERIOD;
    $init_clks(clk_len);
    $init_rsts(reset);
    $init_ins(S_AXI_RREADY, S_AXI_ARVALID, S_AXI_ARID, S_AXI_ARADDR, S_AXI_ARLEN, S_AXI_ARSIZE, S_AXI_ARBURST, S_AXI_WVALID, S_AXI_WDATA, S_AXI_WSTRB, S_AXI_WLAST, S_AXI_AWVALID, S_AXI_AWID, S_AXI_AWADDR, S_AXI_AWLEN, S_AXI_AWSIZE, S_AXI_AWBURST, S_AXI_BREADY);
    $init_outs(S_AXI_RVALID, S_AXI_RID, S_AXI_RDATA, S_AXI_RRESP, S_AXI_RLAST, S_AXI_ARREADY, S_AXI_WREADY, S_AXI_AWREADY, S_AXI_BVALID, S_AXI_BID, S_AXI_BRESP);
    $init_sigs(testSlave);
    /*** VCD & VPD dump ***/
    if ($value$plusargs("vcdfile=%s", vcdfile)) begin
      $dumpfile(vcdfile);
      $dumpvars(0, testSlave);
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
