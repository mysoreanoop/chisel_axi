package AXIChisel

import Chisel._

class Lw(dataWidth: Int) extends Bundle {
	val data = UInt(width = dataWidth)
	val strb = UInt(width = dataWidth/8)
	override def clone = { new Lw(dataWidth).asInstanceOf[this.type] }
}

class Lr(dataWidth: Int) extends Bundle {
	val data = UInt(width = dataWidth)
	val resp = UInt(width = 2)
	override def clone = { new Lr(dataWidth).asInstanceOf[this.type] }
}

class axiLiteSlave(addrWidth: Int, dataWidth: Int) extends Bundle {
	val r = Decoupled(new Lr(dataWidth))
	val ar = Decoupled(UInt(width = addrWidth)).flip
	val w = Decoupled(new Lw(dataWidth)).flip
	val aw = Decoupled(UInt(width = addrWidth)).flip
	val b = Decoupled(UInt(width = 2))

	def renameSignals() {
		r.bits.data.setName("S_AXI_RDATA")              
		r.bits.resp.setName("S_AXI_RRESP")              
		r.valid.setName("S_AXI_RVALID")
		r.ready.setName("S_AXI_RREADY")

		ar.bits.setName("S_AXI_ARADDR")
		ar.valid.setName("S_AXI_ARVALID")
		ar.ready.setName("S_AXI_ARREADY")

		b.bits.setName("S_AXI_BRESP")
		b.valid.setName("S_AXI_BVALID")                 
		b.ready.setName("S_AXI_BREADY")

		aw.bits.setName("S_AXI_AWADDR")
		aw.valid.setName("S_AXI_AWVALID")
		aw.ready.setName("S_AXI_AWREADY")

		w.bits.data.setName("S_AXI_WDATA")
		w.bits.strb.setName("S_AXI_WSTRB")
		w.ready.setName("S_AXI_WREADY")
		w.valid.setName("S_AXI_WVALID")
	}
	override def clone = { new axiLiteSlave(addrWidth, dataWidth).asInstanceOf[this.type] }
}

class testLiteSlave(addrWidth: Int, dataWidth: Int) extends Module {
	val io = new axiLiteSlave(addrWidth, dataWidth)
	io.renameSignals()

	val axi_awaddr = Reg(init = UInt(0, width = addrWidth))
	val axi_awready = Reg(init = Bool(false))
	val axi_wready = Reg(init = Bool(false))
	val axi_bresp = Reg(init = UInt(0, width = 2))
	val axi_bvalid = Reg(init = Bool(false))
//	val io.ar.bits = Reg(init = UInt(0, width = addrWidth))
//This was done to counter the inability to update registers at triggers other than clk
	val axi_arready = Reg(init = Bool(false))
	val axi_rdata = Reg(init = UInt(0, width = dataWidth))
	val axi_rresp = Reg(init = UInt(0, width = 2))
	val axi_rvalid = Reg(init = Bool(false))

	val ADDR_LSB = dataWidth/32 + 1
	val OPT_MEM_ADDR_BITS = 2

	val reg0 = Reg(init = UInt(0, width = dataWidth))
	val reg1 = Reg(init = UInt(0, width = dataWidth))
	val reg2 = Reg(init = UInt(0, width = dataWidth))
	val reg3 = Reg(init = UInt(0, width = dataWidth))
	val reg4 = Reg(init = UInt(0, width = dataWidth))
	val reg5 = Reg(init = UInt(0, width = dataWidth))
	val reg6 = Reg(init = UInt(0, width = dataWidth))
	val reg7 = Reg(init = UInt(0, width = dataWidth))

	val slv_reg_rden = Bool()
	val slv_reg_wren = Bool()
	val reg_data_out = Reg(UInt(width = dataWidth))
	val aw_en = Reg(init = Bool(true))

	io.aw.ready             := axi_awready
	io.w.ready              := axi_wready
	io.b.bits          	:= axi_bresp
	io.b.valid              := axi_bvalid
	io.ar.ready             := axi_arready
	io.r.bits.data          := axi_rdata
	io.r.bits.resp          := axi_rresp
	io.r.valid              := axi_rvalid

	//AWREADY
	when(!axi_awready && io.aw.valid && io.w.valid && aw_en) {
		axi_awready := Bool(true)
		aw_en := Bool(false)
	} .elsewhen(io.b.ready && axi_bvalid) {
		aw_en := Bool(true)
		axi_awready := Bool(false)
	} .otherwise {
		axi_awready := Bool(false)
	}
		

	//AWADDR
	when(!axi_awready && io.aw.valid && aw_en && io.w.valid) {
		axi_awaddr := io.aw.bits
	}

	//WREADY
	when(!axi_wready && io.w.valid && aw_en && io.aw.valid) {
		axi_wready := Bool(true)
	} .otherwise {
		axi_wready := Bool(false)
	}

	//WDATA
	slv_reg_wren := axi_wready && io.w.valid && axi_awready && io.aw.valid
	when(slv_reg_wren) {
		when(axi_awaddr(ADDR_LSB + OPT_MEM_ADDR_BITS, ADDR_LSB) === UInt(0)) { 
			reg0 := io.w.bits.data
		} .elsewhen(axi_awaddr(ADDR_LSB + OPT_MEM_ADDR_BITS, ADDR_LSB) === UInt(1)) { 
			reg1 := io.w.bits.data
		} .elsewhen(axi_awaddr(ADDR_LSB + OPT_MEM_ADDR_BITS, ADDR_LSB) === UInt(2)) { 
			reg2 := io.w.bits.data
		} .elsewhen(axi_awaddr(ADDR_LSB + OPT_MEM_ADDR_BITS, ADDR_LSB) === UInt(3)) { 
			reg3 := io.w.bits.data
		} .elsewhen(axi_awaddr(ADDR_LSB + OPT_MEM_ADDR_BITS, ADDR_LSB) === UInt(4)) { 
			reg4 := io.w.bits.data
		} .elsewhen(axi_awaddr(ADDR_LSB + OPT_MEM_ADDR_BITS, ADDR_LSB) === UInt(5)) { 
			reg5 := io.w.bits.data
		} .elsewhen(axi_awaddr(ADDR_LSB + OPT_MEM_ADDR_BITS, ADDR_LSB) === UInt(6)) { 
			reg6 := io.w.bits.data
		} .elsewhen(axi_awaddr(ADDR_LSB + OPT_MEM_ADDR_BITS, ADDR_LSB) === UInt(7)) { 
			reg7 := io.w.bits.data
		} .otherwise {
			reg0 := reg0
			reg1 := reg1
			reg2 := reg2
			reg3 := reg3
			reg4 := reg4
			reg5 := reg5
			reg6 := reg6
			reg7 := reg7
		}
	}
	
	//BVALID, BRESP		
	when(axi_wready && io.aw.valid && ~axi_bvalid && axi_wready && io.w.valid) {
    		axi_bvalid := Bool(true)
    		axi_bresp := UInt(0)
    	} .otherwise {
    		when(io.b.ready && axi_bvalid) {
    			axi_bvalid := Bool(false)
    		}
    	}	

	//ARREADY, ARADDR
	when(!axi_arready && io.ar.valid) {
    		axi_arready := Bool(true)
//   		io.ar.bits := io.ar.bits
    	} .otherwise {
    		axi_arready := Bool(false)
    	}

	//RVALID, RRESP
	when(axi_arready && io.ar.valid && !axi_rvalid) {
		axi_rvalid := Bool(true)
		axi_rresp  := UInt(0)
	} .elsewhen(axi_rvalid && io.r.ready) {
		axi_rvalid := Bool(false)
	}

	//RDATA
	slv_reg_rden := axi_arready && io.ar.valid && !axi_rvalid
	when(io.ar.bits(ADDR_LSB + OPT_MEM_ADDR_BITS, ADDR_LSB) === UInt(0)) {//TODO transition 
		reg_data_out := reg0
	} .elsewhen(io.ar.bits(ADDR_LSB + OPT_MEM_ADDR_BITS, ADDR_LSB) === UInt(1)) {
		reg_data_out := reg1
	} .elsewhen(io.ar.bits(ADDR_LSB + OPT_MEM_ADDR_BITS, ADDR_LSB) === UInt(2)) {
		reg_data_out := reg2
	} .elsewhen(io.ar.bits(ADDR_LSB + OPT_MEM_ADDR_BITS, ADDR_LSB) === UInt(3)) {
		reg_data_out := reg3
	} .elsewhen(io.ar.bits(ADDR_LSB + OPT_MEM_ADDR_BITS, ADDR_LSB) === UInt(4)) {
		reg_data_out := reg4
	} .elsewhen(io.ar.bits(ADDR_LSB + OPT_MEM_ADDR_BITS, ADDR_LSB) === UInt(5)) {
		reg_data_out := reg5
	} .elsewhen(io.ar.bits(ADDR_LSB + OPT_MEM_ADDR_BITS, ADDR_LSB) === UInt(6)) {
		reg_data_out := reg6
	} .elsewhen(io.ar.bits(ADDR_LSB + OPT_MEM_ADDR_BITS, ADDR_LSB) === UInt(7)) {
		reg_data_out := reg7
	} .otherwise {
		reg_data_out := UInt(0)
	}
	when(slv_reg_rden) {
		axi_rdata := reg_data_out
	}
}


class testerTestLiteSlave(c:testLiteSlave) extends Tester(c) {
	step(1)
}
