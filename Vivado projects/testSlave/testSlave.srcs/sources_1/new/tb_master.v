`timescale 1ns / 1ps

module tb_master;
reg clk;
reg reset;
wire M_AXI_RREADY;
reg  M_AXI_RVALID;
reg [5:0] M_AXI_RID;
reg [31:0] M_AXI_RDATA;
reg [1:0] M_AXI_RRESP;
reg  M_AXI_RLAST;
reg  M_AXI_ARREADY;
wire M_AXI_ARVALID;
wire[5:0] M_AXI_ARID;
wire[5:0] M_AXI_ARADDR;
wire[7:0] M_AXI_ARLEN;
wire[2:0] M_AXI_ARSIZE;
wire[1:0] M_AXI_ARBURST;
reg  M_AXI_WREADY;
wire M_AXI_WVALID;
wire[31:0] M_AXI_WDATA;
wire[3:0] M_AXI_WSTRB;
wire M_AXI_WLAST;
reg  M_AXI_AWREADY;
wire M_AXI_AWVALID;
wire[5:0] M_AXI_AWID;
wire[5:0] M_AXI_AWADDR;
wire[7:0] M_AXI_AWLEN;
wire[2:0] M_AXI_AWSIZE;
wire[1:0] M_AXI_AWBURST;
wire M_AXI_BREADY;
reg  M_AXI_BVALID;
reg [5:0] M_AXI_BID;
reg [1:0] M_AXI_BRESP;
reg  io_INIT_AXI_TXN;
wire io_TXN_DONE;
wire io_ERROR;

testMaster instMaster(
    .clk(clk),   
    .reset(reset),
    .M_AXI_RREADY(M_AXI_RREADY),                                                                                                                 
    .M_AXI_RVALID(M_AXI_RVALID),
    .M_AXI_RID(M_AXI_RID),
    .M_AXI_RDATA(M_AXI_RDATA),
    .M_AXI_RRESP(M_AXI_RRESP),
    .M_AXI_RLAST(M_AXI_RLAST),
    .M_AXI_ARREADY(M_AXI_ARREADY),
    .M_AXI_ARVALID(M_AXI_ARVALID),
    .M_AXI_ARID(M_AXI_ARID),
    .M_AXI_ARADDR(M_AXI_ARADDR),
    .M_AXI_ARLEN(M_AXI_ARLEN),
    .M_AXI_ARSIZE(M_AXI_ARSIZE),
    .M_AXI_ARBURST(M_AXI_ARBURST),
    .M_AXI_WREADY(M_AXI_WREADY),
    .M_AXI_WVALID(M_AXI_WVALID),
    .M_AXI_WSTRB(M_AXI_WSTRB),
    .M_AXI_WDATA(M_AXI_WDATA),
    .M_AXI_WLAST(M_AXI_WLAST),
    .M_AXI_AWREADY(M_AXI_AWREADY),
    .M_AXI_AWVALID(M_AXI_AWVALID),
    .M_AXI_AWID(M_AXI_AWID),
    .M_AXI_AWADDR(M_AXI_AWADDR),
    .M_AXI_AWLEN(M_AXI_AWLEN),
    .M_AXI_AWSIZE(M_AXI_AWSIZE),
    .M_AXI_AWBURST(M_AXI_AWBURST),
    .M_AXI_BREADY(M_AXI_BREADY),
    .M_AXI_BVALID(M_AXI_BVALID),
    .M_AXI_BID(M_AXI_BID),
    .M_AXI_BRESP(M_AXI_BRESP),
    .io_INIT_AXI_TXN(io_INIT_AXI_TXN),
    .io_TXN_DONE(io_TXN_DONE));
 
reg [31:0] count; 
    
initial begin
    clk = 1'b0;
    reset = 1'b0;
    repeat(4) #10 clk = ~clk;
    reset = 1'b1;
M_AXI_WREADY = 1'b1;
M_AXI_AWREADY = 1'b1;
    forever #10 clk = ~clk; // generate a clock   
end
     
     
     
always@(posedge clk or negedge reset) begin
    if(!reset) begin
        count <= 1'b0;
        io_INIT_AXI_TXN <= 1'b0;
    end    
    else begin
        count = count + 1;
        if((count == 4'd10)) begin
            io_INIT_AXI_TXN <= 1'b1;
        end
        else if(count > 4'd14) begin
            io_INIT_AXI_TXN <= 1'b0;
        end
//        if(io_TXN_DONE == 1'b1) begin
//        end
    end   
end   
endmodule
