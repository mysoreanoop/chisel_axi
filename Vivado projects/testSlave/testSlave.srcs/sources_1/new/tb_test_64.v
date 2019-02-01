`timescale 1ns / 1ps


module tb_test_64;
reg clk;
reg reset;
reg  S_AXI_RREADY;
wire S_AXI_RVALID;
wire[5:0] S_AXI_RID;
wire[31:0] S_AXI_RDATA;
wire[1:0] S_AXI_RRESP;
wire S_AXI_RLAST;
wire S_AXI_ARREADY;
reg  S_AXI_ARVALID;
reg [5:0] S_AXI_ARID;
reg [5:0] S_AXI_ARADDR;
reg [7:0] S_AXI_ARLEN;
reg [2:0] S_AXI_ARSIZE;
reg [1:0] S_AXI_ARBURST;
wire S_AXI_WREADY;
reg  S_AXI_WVALID;
reg [31:0] S_AXI_WDATA;
reg [3:0] S_AXI_WSTRB;
reg  S_AXI_WLAST;
wire S_AXI_AWREADY;
reg  S_AXI_AWVALID;
reg [5:0] S_AXI_AWID;
reg [5:0] S_AXI_AWADDR;
reg [7:0] S_AXI_AWLEN;
reg [2:0] S_AXI_AWSIZE;
reg [1:0] S_AXI_AWBURST;
reg  S_AXI_BREADY;
wire S_AXI_BVALID;
wire[5:0] S_AXI_BID;
wire[1:0] S_AXI_BRESP;

reg [31:0] count;


test_64_v1_0_S64_AXI inst1(
    .S_AXI_ACLK(clk),   
    .S_AXI_ARESETN(reset),
    .S_AXI_RREADY(S_AXI_RREADY),                                                                                                                 
    .S_AXI_RVALID(S_AXI_RVALID),
    .S_AXI_RID(S_AXI_RID),
    .S_AXI_RDATA(S_AXI_RDATA),
    .S_AXI_RRESP(S_AXI_RRESP),
    .S_AXI_RLAST(S_AXI_RLAST),
    .S_AXI_ARREADY(S_AXI_ARREADY),
    .S_AXI_ARVALID(S_AXI_ARVALID),
    .S_AXI_ARID(S_AXI_ARID),
    .S_AXI_ARADDR(S_AXI_ARADDR),
    .S_AXI_ARLEN(S_AXI_ARLEN),
    .S_AXI_ARSIZE(S_AXI_ARSIZE),
    .S_AXI_ARBURST(S_AXI_ARBURST),
    .S_AXI_WREADY(S_AXI_WREADY),
    .S_AXI_WVALID(S_AXI_WVALID),
    .S_AXI_WDATA(S_AXI_WDATA),
    .S_AXI_WLAST(S_AXI_WLAST),
    .S_AXI_AWREADY(S_AXI_AWREADY),
    .S_AXI_AWVALID(S_AXI_AWVALID),
    .S_AXI_AWID(S_AXI_AWID),
    .S_AXI_AWADDR(S_AXI_AWADDR),
    .S_AXI_AWLEN(S_AXI_AWLEN),
    .S_AXI_AWSIZE(S_AXI_AWSIZE),
    .S_AXI_AWBURST(S_AXI_AWBURST),
    .S_AXI_BREADY(S_AXI_BREADY),
    .S_AXI_BVALID(S_AXI_BVALID),
    .S_AXI_BID(S_AXI_BID),
    .S_AXI_BRESP(S_AXI_BRESP));

initial begin
    clk = 1'b0;
    reset = 1'b0;
    repeat(4) #10 clk = ~clk;
    reset = 1'b1;
    
//    S_AXI_AWVALID = 1'b0;
//    S_AXI_WVALID = 1'b0;
//    S_AXI_ARVALID = 1'b0;
//    S_AXI_RREADY = 1'b0;
//    S_AXI_BREADY = 1'b0;
    
////    S_AXI_AWID = 6'b0;
////    S_AXI_ARID = 6'b1;
    
//    S_AXI_AWADDR = 6'b0;
//    S_AXI_WDATA = 32'b0111;
//    S_AXI_WSTRB = 4'b1111;
//    S_AXI_AWBURST = 2'b1;
//    S_AXI_AWLEN = 8'b1;
//    S_AXI_AWSIZE = 8'b1;
    
    forever #10 clk = ~clk; // generate a clock   
end


always@(posedge clk or negedge reset) begin
    if(!reset) begin
        count = 0;
        //write control signals
        S_AXI_AWVALID = 1'b0;
        S_AXI_WVALID = 1'b0;
        S_AXI_ARVALID = 1'b0;
        S_AXI_RREADY = 1'b0;
        S_AXI_BREADY = 1'b0;
        S_AXI_ARBURST = 2'b0;
        S_AXI_ARLEN = 8'b1000;
        S_AXI_ARSIZE = 8'b100;
        S_AXI_WLAST = 1'b0;

        //read control signals
    end    
    else begin
        count = count + 1;
        if(count == 4'd10) begin
            S_AXI_AWADDR = 6'b0;
            S_AXI_WDATA = 32'b0111;
            S_AXI_WSTRB = 4'b1111;
            S_AXI_AWVALID = 1'b1;
            S_AXI_WVALID = 1'b1;
            S_AXI_BREADY = 1'b1;
            S_AXI_WLAST = 1'b1;
        end
        else begin
            if(S_AXI_AWREADY  == 1'b1) begin
                S_AXI_AWVALID = 1'b0;
            end
            if(S_AXI_WREADY ==1'b1) begin
                S_AXI_WVALID = 1'b0;
                S_AXI_WLAST = 1'b0;
            end
        end
        //read
//        if(count == 5'd30) begin
//            S_AXI_ARADDR = 6'b0;
//            S_AXI_RREADY = 1'b1;
//            S_AXI_ARVALID = 1'b1;
//        end
//        if(S_AXI_RVALID == 1'b1) begin
//            S_AXI_ARVALID = 1'b0;
//        end
   end
end 
                   





//initial begin
//    #100
//    S_AXI_AWVALID = 1'b1;
//    S_AXI_WVALID = 1'b1;
//    S_AXI_BREADY = 1'b1;
//    S_AXI_WLAST = 1'b1;
    
//    if(S_AXI_AWREADY == 1'b0) 
        
//    #60
    
    
//    S_AXI_WLAST = 1'b0;
//    S_AXI_AWVALID = 1'b0;
//    S_AXI_WVALID = 1'b0;
//end
//initial begin
//    #500
//    S_AXI_ARADDR = 6'b0;
//    S_AXI_ARBURST = 2'b0;
//    S_AXI_ARLEN = 8'b1000;
//    S_AXI_ARSIZE = 8'b100;
//    #100
//    S_AXI_ARVALID = 1'b1;
//    S_AXI_RREADY = 1'b1;
//    #60
//    S_AXI_ARVALID = 1'b0;
//end
endmodule
