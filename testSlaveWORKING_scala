package AXIChisel

import Chisel._

class Taw(idWidth: Int, addrWidth: Int) extends Bundle {
	val id = UInt(width = idWidth)
	val addr = UInt(width = addrWidth)
	val len = UInt(width = 8)
	val size = UInt(width = 3)
	val burst = UInt(width = 2)
	//val lock
	//val cache
	//val prot
	//val qos
	//val region
	//val user

	override def clone = {new Taw(idWidth, addrWidth).asInstanceOf[this.type]}
}

class Tw(idWidth: Int, dataWidth: Int) extends Bundle {
	val data = UInt(width = dataWidth)
	val strb = UInt(width = dataWidth/8)
	val last = Bool()
	//val user

	override def clone = { new Tw(idWidth, dataWidth).asInstanceOf[this.type] }
}

class Tb(idWidth: Int) extends Bundle{
	val id = UInt(width = idWidth)
	val resp = UInt(width = 2)
	//val user
	
	override def clone = { new Tb(idWidth).asInstanceOf[this.type] }
}

class Tar(idWidth: Int, addrWidth: Int) extends Bundle {
      val id = UInt(width = idWidth)
	val addr = UInt(width = addrWidth)
	val len = UInt(width = 8)
	val size = UInt(width = 3)
	val burst = UInt(width = 2)
	//val lock
      //val cache
      //val prot
      //val qos
      //val region
     	//val user
	
	override def clone = { new Tar(idWidth, addrWidth).asInstanceOf[this.type] }
}

class Tr(idWidth: Int, dataWidth: Int) extends Bundle {
	val id = UInt(width = idWidth)
	val data = UInt(width = dataWidth)
	val resp = UInt(width = 2)
	val last = Bool()
	//val user

	override def clone = { new Tr(idWidth, dataWidth).asInstanceOf[this.type] }
}

class axiSlave(idWidth: Int, addrWidth: Int, dataWidth: Int) extends Bundle {
	val r = Decoupled(new Tr(idWidth, dataWidth))
	val ar = Decoupled(new Tar(idWidth, addrWidth)).flip
	val w = Decoupled(new Tw(idWidth, dataWidth)).flip
	val aw = Decoupled(new Taw(idWidth, addrWidth)).flip
	val b = Decoupled(new Tb(idWidth))

//	val debug = new Bundle {
//		val stat = UInt(OUTPUT, width = 16)
//		val mem_data_out = UInt(OUTPUT, width = 32)
//		val mem_address = UInt(OUTPUT, width = 16)
//		val data_in = UInt(OUTPUT, width = 32)
//		val data_out = UInt(OUTPUT, width = 32)
//	}

	def renameSignals() {
		r.bits.id.setName("S_AXI_RID")
		r.bits.data.setName("S_AXI_RDATA")
		r.bits.resp.setName("S_AXI_RRESP")
		r.bits.last.setName("S_AXI_RLAST")
		r.valid.setName("S_AXI_RVALID")
		r.ready.setName("S_AXI_RREADY")

		ar.bits.id.setName("S_AXI_ARID")
		ar.bits.addr.setName("S_AXI_ARADDR")
		ar.bits.len.setName("S_AXI_ARLEN")
		ar.bits.size.setName("S_AXI_ARSIZE")
		ar.bits.burst.setName("S_AXI_ARBURST")
		ar.valid.setName("S_AXI_ARVALID")
		ar.ready.setName("S_AXI_ARREADY")

		aw.bits.id.setName("S_AXI_AWID")
		aw.bits.addr.setName("S_AXI_AWADDR")
		aw.bits.len.setName("S_AXI_AWLEN")
		aw.bits.size.setName("S_AXI_AWSIZE")
		aw.bits.burst.setName("S_AXI_AWBURST")
		aw.valid.setName("S_AXI_AWVALID")
		aw.ready.setName("S_AXI_AWREADY")

		w.bits.data.setName("S_AXI_WDATA")
		w.bits.strb.setName("S_AXI_WSTRB")
		w.bits.last.setName("S_AXI_WLAST")
		w.valid.setName("S_AXI_WVALID")
		w.ready.setName("S_AXI_WREADY")

		b.bits.id.setName("S_AXI_BID")
		b.bits.resp.setName("S_AXI_BRESP")
		b.valid.setName("S_AXI_BVALID")
		b.ready.setName("S_AXI_BREADY")
	}

	override def clone = { new axiSlave(idWidth, addrWidth, dataWidth).asInstanceOf[this.type] }

}

class testSlave(idWidth: Int, addrWidth: Int, dataWidth: Int) extends Module {
	
	val io = new axiSlave(idWidth, addrWidth, dataWidth)
	io.renameSignals()

//	val debug_reg = Reg(UInt(width = 16))

	val axi_awaddr = Reg(/*init = */UInt( width = addrWidth))
	val axi_awready = Reg(/*init = */Bool())

	val axi_wready = Reg(/*init = */Bool())

	val axi_bresp = Reg(/*init = */UInt( width = 2))
	val axi_bvalid = Reg(/*init = */Bool())

	val axi_araddr = Reg(/*init = */UInt( width = addrWidth))
	val axi_arready = Reg(/*init = */Bool())

	val axi_rdata = Reg(/*init = */UInt( width = dataWidth))
	val axi_rresp = Reg(/*init = */UInt( width = 2))
	val axi_rlast = Reg(/*init = */Bool())
	val axi_rvalid = Reg(/*init = */Bool())
	

	val axi_awv_awr_flag = Reg(/*init = */Bool())
	val axi_arv_arr_flag = Reg(/*init = */Bool())

	val axi_awlen_cntr = Reg(/*init = */UInt( width = 8))
	val axi_arlen_cntr = Reg(/*init = */UInt( width = 8))

	val axi_arburst = Reg(/*init = */UInt( width = 2))
	val axi_awburst = Reg(/*init = */UInt( width = 2))

	val axi_arlen = Reg(/*init = */UInt( width = 8))
	val axi_awlen = Reg(/*init = */UInt( width = 8))


	val ADDR_LSB = dataWidth/32 + 1
	val OPT_MEM_ADDR_BITS = 3 	//is 5 for 256 Bytes; 3 for 64 Bytes
	val USER_NUM_MEM = 1

	val mem_address = UInt(width = OPT_MEM_ADDR_BITS + 1) 
	val mem_data_out = Reg(UInt(width = dataWidth))


	io.aw.ready			:= axi_awready
	
	io.w.ready			:= axi_wready

	io.b.bits.resp		:= axi_bresp
	io.b.valid			:= axi_bvalid
	io.b.bits.id 		:= io.aw.bits.id
	
	io.ar.ready			:= axi_arready
	
	io.r.bits.data		:= axi_rdata
	io.r.bits.resp		:= axi_rresp
	io.r.bits.last		:= axi_rlast
	io.r.valid			:= axi_rvalid
	io.r.bits.id 		:= io.ar.bits.id

	//AWREADY
	when(!reset) {
		axi_awready := Bool(false)
		axi_awv_awr_flag := Bool(false)
	} .otherwise {
		when(!axi_awready && io.aw.valid && !axi_awv_awr_flag && !axi_arv_arr_flag) {
			axi_awready := Bool(true)
			axi_awv_awr_flag := Bool(true)
		} .elsewhen(io.w.bits.last && axi_wready) {
			axi_awv_awr_flag := Bool(false)
		} .otherwise {
			axi_awready := Bool(false)
		}
	}

	//AWADDR 
	when(!reset) {
		axi_awaddr := UInt(0)
		axi_awlen_cntr := UInt(0)
		axi_awburst := UInt(0)
		axi_awlen := UInt(0)
	} .otherwise {
		when(!axi_awready && io.aw.valid && !axi_awv_awr_flag) {
			axi_awaddr := io.aw.bits.addr(addrWidth-1, 0)
			axi_awburst := io.aw.bits.burst
			axi_awlen := io.aw.bits.len
			axi_awlen_cntr := UInt(0)
		} .elsewhen((axi_awlen_cntr <= axi_awlen) && axi_wready && io.w.valid) {
			axi_awlen_cntr := axi_awlen_cntr + UInt(1)
			when(axi_awburst === UInt(0)) {
				axi_awaddr := axi_awaddr
			} .elsewhen(axi_awburst === UInt(1)) {
				//Wrapping burst not supported
				axi_awaddr(addrWidth-1, ADDR_LSB) := axi_awaddr(addrWidth-1, ADDR_LSB) + UInt(1)
				axi_awaddr(ADDR_LSB-1, 0) := UInt(0, ADDR_LSB)
			} .otherwise {
				axi_awaddr := axi_awaddr(addrWidth-1, ADDR_LSB) + UInt(1)
			}
		}
	}
	
	//WREADY
	when(!reset) {
		axi_wready := Bool(false)
	} .otherwise {
		when(!axi_wready && io.w.valid && axi_awv_awr_flag) {
			axi_wready := Bool(true)
		} .elsewhen (io.w.bits.last && axi_wready) {
			axi_wready := Bool(false)
		}
	}

    //BRESP
	when(!reset) {
		axi_bvalid := Bool(false)
		axi_bresp := UInt(0,2)
	} .otherwise {
    	when(axi_awv_awr_flag && axi_wready && io.w.valid && ~axi_bvalid && io.w.bits.last) {
    		axi_bvalid := Bool(true)
    		axi_bresp := UInt(0)
    	} .otherwise {
    		when(io.b.ready && axi_bvalid) {
    			axi_bvalid := Bool(false)
    		}
    	}
	}

    //ARREADY
	when(!reset) {
		axi_arready := Bool(false)
		axi_arv_arr_flag := Bool(false)
	} .otherwise {
    	when(!axi_arready && io.ar.valid && !axi_awv_awr_flag && !axi_arv_arr_flag) {
    		axi_arready := Bool(true)
    		axi_arv_arr_flag := Bool(true)
    	} .elsewhen(axi_rvalid && io.r.ready && (axi_arlen_cntr === axi_arlen)) {
    		axi_arv_arr_flag := Bool(false)
    	} .otherwise {
    		axi_arready := Bool(false)
    	}
	}

    //ARADDR
	when(!reset) {
		axi_araddr := UInt(0)
		axi_arlen_cntr := UInt(0)
		axi_arburst := UInt(0)
		axi_arlen := UInt(0)
		axi_rlast := Bool(false)
	} .otherwise {
    	when(!axi_arready && io.ar.valid && !axi_arv_arr_flag) {
    		axi_araddr := io.ar.bits.addr(addrWidth-1, 0)
    		axi_arburst := io.ar.bits.burst
    		axi_arlen := io.ar.bits.len
    		axi_arlen_cntr := UInt(0)
    		axi_rlast := Bool(false)
    	} .elsewhen((axi_arlen_cntr <= axi_arlen) && axi_rvalid && io.r.ready) {
    		axi_arlen_cntr := axi_arlen_cntr + UInt(1)
    		axi_rlast := Bool(false)
    		when(axi_arburst === UInt(0)) {
    			axi_araddr := axi_araddr
    		} .elsewhen(axi_arburst === UInt(1)) {
    			//Wrapping burst not supported
    			axi_araddr(addrWidth-1, ADDR_LSB) := axi_araddr(addrWidth-1, ADDR_LSB) + UInt(1)
    			axi_araddr(ADDR_LSB-1, 0) := UInt(0, ADDR_LSB)
    		} .otherwise {//TODO check if this makes sense
    			axi_araddr := axi_araddr(addrWidth-1, ADDR_LSB) + UInt(1)
    		}
    	} .elsewhen((axi_arlen_cntr === axi_arlen) && !axi_rlast && axi_arv_arr_flag) {
    		axi_rlast := Bool(true)
    	} .elsewhen(io.r.ready) {
    		axi_rlast := Bool(false)
    	}
	}

    //ARVALID
	when(!reset) {
		axi_rvalid := Bool(false)
		axi_rresp := UInt(0)
	} .otherwise {
    		when(axi_arv_arr_flag && !axi_rvalid) {
    			axi_rvalid := Bool(true)
    			axi_rresp  := UInt(0)
    		} .elsewhen(axi_rvalid && io.r.ready) {
    			axi_rvalid := Bool(false)
    		}
	}

	//example
	mem_address := Mux(axi_arv_arr_flag, axi_araddr(ADDR_LSB+OPT_MEM_ADDR_BITS, ADDR_LSB), Mux(axi_awv_awr_flag, axi_awaddr(ADDR_LSB+OPT_MEM_ADDR_BITS, ADDR_LSB), UInt(0)))
	
	//BRAM
	//begin generate
	val mem_rden = Bool()
	val mem_wren = Bool()
	
	mem_wren := axi_wready && io.w.valid
	mem_rden := axi_arv_arr_flag

//	for(mem_byte_index <- 0 until dataWidth/8) {
//		val data_in = UInt(width = 8)
//		val data_out = UInt(width = 8)
//		val byte_ram = Reg(Vec.fill(16) {UInt(width = 8)})
//		
//		data_in := io.w.bits.data((mem_byte_index*8+7), mem_byte_index*8)
//		data_out := byte_ram(mem_address)
//
//		when(mem_wren && io.w.bits.strb(mem_byte_index)) {
//			byte_ram(mem_address) := data_in
//		}
//
//		when(mem_rden) {
//			mem_data_out(mem_byte_index*8+7, mem_byte_index*8) := data_out
//		}
//	}
	//end generate
	val bram = Reg(Vec.fill(16) {UInt(width = 32)})
	val data_in = UInt(width = 32)
	val data_out = UInt(width = 32)

	for(i <- 0 until 16) {
		when(!reset) {
			bram(i) := UInt(1)<<i
		}
	}

	data_in := io.w.bits.data
	data_out := bram(mem_address)

//	val strobe = Reg(init = UInt(0, width = 32))
//	strobe := Cat(Fill(8,io.w.bits.strb(3)), Fill(8,io.w.bits.strb(2)), Fill(8,io.w.bits.strb(1)), Fill(8,io.w.bits.strb(0)))
//
//	when(mem_wren) {
//		bram(mem_address) := bram(mem_address) | (data_in & strobe)
////		debug_reg(15) := UInt(1)
//	}

	when(mem_wren) {// && io.w.bits.strb(0)) {
		bram(mem_address) := data_in
		//io.debug.stat(12) := UInt(1)
	}
//	.elsewhen(mem_wren && io.w.bits.strb(1)) {
//		bram(mem_address)(15,8) := data_in(15,8)
//		//io.debug.stat(13) := UInt(1)
//	} .elsewhen(mem_wren && io.w.bits.strb(2)) {
//		bram(mem_address)(23,16) := data_in(23,16)
//		//io.debug.stat(14) := UInt(1)
//	} .elsewhen(mem_wren && io.w.bits.strb(3)) {
//		bram(mem_address)(31,24) := data_in(31,24)
//		//io.debug.stat(15) := UInt(1)
//	}
//	
	when(mem_rden) {//TODO check this out
		mem_data_out := data_out
		axi_rdata := data_out
	}

	
	//Output reg or mem read data
//	when(axi_rvalid) {
//		axi_rdata := mem_data_out
//	} .otherwise {
//		axi_rdata := UInt(0)
//	}
}

class testerTestSlave(c:testSlave) extends Tester(c) {
	step(1)
//	poke(c.io.b.ready, 0)
//	poke(c.io.aw.valid, 0)
//	poke(c.io.w.valid, 0)
//	poke(c.io.w.bits.strb, 0xF)
//	
//	step(1)
//	poke(c.io.aw.valid, 1)
//	poke(c.io.aw.bits.addr, 0x0)
//	step(1)
//	while(peek(c.io.aw.ready) == 0) {
//		step(1)
//	}
//	step(1)
//	poke(c.io.aw.valid, 0)
//
//	step(1)
//	poke(c.io.w.valid, 1)
//	poke(c.io.w.bits.data, 0x22)
//	poke(c.io.w.bits.last, 1)
//	poke(c.io.b.ready, 1)
//	step(1)
//	while(peek(c.io.w.ready) == 0) {
//		step(1)
//	}
//	step(1)
//	poke(c.io.w.valid, 0)
//	poke(c.io.w.bits.last, 0)
//	
//
//	step(10)
/////////////////////////////////////
//	step(1)
//	poke(c.io.aw.valid, 1)
//	poke(c.io.aw.bits.addr, 0x4)
//	step(1)
//	while(peek(c.io.aw.ready) == 0) {
//		step(1)
//	}
//	step(1)
//	poke(c.io.aw.valid, 0)
//
//	step(1)
//	poke(c.io.w.valid, 1)
//	poke(c.io.w.bits.data, 0x33)
//	poke(c.io.w.bits.last, 1)
//	poke(c.io.b.ready, 1)
//	step(1)
//	while(peek(c.io.w.ready) == 0) {
//		step(1)
//	}
//	step(1)
//	poke(c.io.w.valid, 0)
//	poke(c.io.w.bits.last, 0)
//	
//
//	step(10)
//	
//	poke(c.io.ar.valid, 0)
//	poke(c.io.r.ready, 0)
//	poke(c.io.ar.bits.addr, 0x0)
//	step(1)
//	poke(c.io.r.ready, 1)
//	poke(c.io.ar.valid, 1)
//	step(3)
//	poke(c.io.ar.valid, 0)
//	
//	step(100)
}

