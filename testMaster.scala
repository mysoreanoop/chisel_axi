package  AXIChisel

import Chisel._
//Already declared elsewhere
//class Taw(idWidth: Int, addrWidth: Int) extends Bundle {
//	val id = UInt(width = idWidth)
//	val addr = UInt(width = addrWidth)
//	val len = UInt(width = 8)
//	val size = UInt(width = 3)
//	val burst = UInt(width = 2)                               
//	//val lock
//	//val cache
//	//val prot
//	//val qos
//	//val region
//	//val user
//
//	override def clone = {new Taw(idWidth, addrWidth).asInstanceOf[this.type]}
//}
//
//class Tw(idWidth: Int, dataWidth: Int) extends Bundle {
//	val data = UInt(width = dataWidth)
//	val strb = UInt(width = dataWidth/8)
//	val last = Bool()
//	//val user
//
//	override def clone = { new Tw(idWidth, dataWidth).asInstanceOf[this.type] }
//}
//
//class Tb(idWidth: Int) extends Bundle{
//	val id = UInt(width = idWidth)
//	val resp = UInt(width = 2)
//	//val user
//	
//	override def clone = { new Tb(idWidth).asInstanceOf[this.type] }
//}
//
//class Tar(idWidth: Int, addrWidth: Int) extends Bundle {
//      val id = UInt(width = idWidth)
//	val addr = UInt(width = addrWidth)
//	val len = UInt(width = 8)
//	val size = UInt(width = 3)
//	val burst = UInt(width = 2)
//	//val lock
//      //val cache
//      //val prot
//      //val qos
//      //val region
//     	//val user
//	
//	override def clone = { new Tar(idWidth, addrWidth).asInstanceOf[this.type] }
//}
//
//class Tr(idWidth: Int, dataWidth: Int) extends Bundle {
//	val id = UInt(width = idWidth)
//	val data = UInt(width = dataWidth)
//	val resp = UInt(width = 2)
//	val last = Bool()
//	//val user
//
//	override def clone = { new Tr(idWidth, dataWidth).asInstanceOf[this.type] }
//}

class TreadBundle(addrWidth: Int, dataWidth: Int) extends Bundle {
	val data = Decoupled(UInt(width = dataWidth))				//Data output
	val addr = UInt(width = addrWidth).asInput				//Addr input
//	val burst_mode = Bool(INPUT)							//3 or 0 meaning 2^3 or 1 total bursts
	val start_single_burst_read = Bool(INPUT)					//start trigger
	val done = Bool(OUTPUT)
}

class TwriteBundle(addrWidth: Int, dataWidth: Int) extends Bundle {
	val data = Decoupled(UInt(width = dataWidth)).flip			//Data input
	val addr = UInt(width = addrWidth).asInput				//addr input
//	val burst_mode = Bool(INPUT)
	val start_single_burst_write = Bool(INPUT)
	val done = Bool(OUTPUT)
}

class axiMaster(idWidth: Int, addrWidth: Int, dataWidth: Int) extends Bundle {
	val r = Decoupled(new Tr(idWidth, dataWidth)).flip
	val ar = Decoupled(new Tar(idWidth, addrWidth))
	val w = Decoupled(new Tw(idWidth, dataWidth))
	val aw = Decoupled(new Taw(idWidth, addrWidth))
	val b = Decoupled(new Tb(idWidth)).flip
	
	val readBundle  = new TreadBundle (addrWidth, dataWidth) 
	val writeBundle = new TwriteBundle(addrWidth, dataWidth) 


	//val INIT_AXI_TXN = Bool(INPUT)
	//val TXN_DONE = Bool(OUTPUT)
	//val ERROR = Bool(OUTPUT)
	
	def renameSignals() {
		r.bits.id.setName("M_AXI_RID")
		r.bits.data.setName("M_AXI_RDATA")
		r.bits.resp.setName("M_AXI_RRESP")
		r.bits.last.setName("M_AXI_RLAST")
		r.valid.setName("M_AXI_RVALID")
		r.ready.setName("M_AXI_RREADY")

		ar.bits.id.setName("M_AXI_ARID")
		ar.bits.addr.setName("M_AXI_ARADDR")
		ar.bits.len.setName("M_AXI_ARLEN")
		ar.bits.size.setName("M_AXI_ARSIZE")
		ar.bits.burst.setName("M_AXI_ARBURST")
		ar.valid.setName("M_AXI_ARVALID")
		ar.ready.setName("M_AXI_ARREADY")

		aw.bits.id.setName("M_AXI_AWID")
		aw.bits.addr.setName("M_AXI_AWADDR")
		aw.bits.len.setName("M_AXI_AWLEN")
		aw.bits.size.setName("M_AXI_AWSIZE")
		aw.bits.burst.setName("M_AXI_AWBURST")
		aw.valid.setName("M_AXI_AWVALID")
		aw.ready.setName("M_AXI_AWREADY")

		w.bits.data.setName("M_AXI_WDATA")
		w.bits.strb.setName("M_AXI_WSTRB")
		w.bits.last.setName("M_AXI_WLAST")
		w.valid.setName("M_AXI_WVALID")
		w.ready.setName("M_AXI_WREADY")

		b.bits.id.setName("M_AXI_BID")
		b.bits.resp.setName("M_AXI_BRESP")
		b.valid.setName("M_AXI_BVALID")
		b.ready.setName("M_AXI_BREADY")
	}

	override def clone = { new axiMaster(idWidth, addrWidth, dataWidth).asInstanceOf[this.type] }
}

class testMaster(idWidth: Int, addrWidth: Int, dataWidth: Int) extends Module {

	val io = new axiMaster(idWidth, addrWidth, dataWidth)
	io.renameSignals()


	val C_M_AXI_BURST_LEN = 16 //no. of rw txn in one burst monitored by write_index
	val C_M_TARGET_SLAVE_BASE_ADDR = 0x40000000 //Start addr of shared mem 
	val C_TRANSACTIONS_NUM = log2Up(C_M_AXI_BURST_LEN - 1) //for write index width
	//val C_MASTER_LENGTH = 7//12 
						//total such bursts
						//monitored by write_burst_cocunter
//	val C_NO_BURSTS_REQ_R = if(io.readBundle.burst_mode == Bool(true)) 3 else 0//C_MASTER_LENGTH - log2Up((C_M_AXI_BURST_LEN * dataWidth/8) - 1)
//	val C_NO_BURSTS_REQ_W = if(io.writeBundle.burst_mode == Bool(true)) 3 else 0//C_MASTER_LENGTH - log2Up((C_M_AXI_BURST_LEN * dataWidth/8) - 1)

//	val STATE = Enum(UInt(), 'IDLE :: 'INIT_WRITE :: 'INIT_READ :: 'INIT_COMPARE :: Nil)
//	val mst_exec_state = Reg(UInt(width = 2))

	val axi_awaddr = Reg(init = UInt(0, width = addrWidth))
      val axi_awvalid = Reg(init = Bool(false))
	val axi_wdata = Reg(init = UInt(0, width = dataWidth))
      val axi_wvalid = Reg(init = Bool(false))
      val axi_wlast = Reg(init = Bool(false))
      val axi_bready = Reg(init = Bool(false))
      val axi_araddr = Reg(init = UInt(0, width = addrWidth))
      val axi_arvalid = Reg(init = Bool(false))
      val axi_rready = Reg(init = Bool(false))


	val write_index = Reg(init = UInt(0, width = C_TRANSACTIONS_NUM + 1))
	val read_index = Reg(init = UInt(0, width = C_TRANSACTIONS_NUM + 1))
	val burst_size_bytes = UInt(width = 32)
//	val write_burst_counter = Reg(init = UInt(0, width = C_NO_BURSTS_REQ_W + 1))
//	val read_burst_counter = Reg(init = UInt(0, width = C_NO_BURSTS_REQ_R + 1))
	


//  	val start_single_burst_write = Reg(Bool())
//	val start_single_burst_read = Reg(Bool())
//    val writes_done = Reg(init = Bool(false))
//    val reads_done = Reg(init = Bool(false))
	val error_reg = Reg(init = Bool(false))
//    val compare_done = Reg(Bool())
//    val read_mismatch = Reg(Bool())
//	val burst_write_active = Reg(init = Bool(false))
//	val burst_read_active = Reg(init = Bool(false))
//	val expected_rdata = Reg(UInt(width = dataWidth))
	val write_resp_error = Bool()
	val read_resp_error = Bool()
	val wnext = Bool()
	val rnext = Bool()
//      val init_txn_ff = Reg(Bool())
//      val init_txn_ff2 = Reg(Bool())
//      val init_txn_edge = Reg(Bool())
//      val init_txn_pulse = Bool()

	io.aw.bits.id := UInt(0)
	io.aw.bits.addr := axi_awaddr + UInt(C_M_TARGET_SLAVE_BASE_ADDR)
	io.aw.bits.len := UInt(C_M_AXI_BURST_LEN - 1)
	io.aw.bits.size := UInt(log2Up(dataWidth/8 - 1))
	io.aw.bits.burst := UInt(1)
	io.aw.valid := axi_awvalid


	io.w.bits.data := axi_wdata
	io.w.bits.strb := UInt(0xF,4)
	io.w.bits.last := axi_wlast
	io.w.valid := axi_wvalid
	io.b.ready := axi_bready


	io.ar.bits.id := UInt(0)
	io.ar.bits.addr := axi_araddr + UInt(C_M_TARGET_SLAVE_BASE_ADDR)
	io.ar.bits.len := UInt(C_M_AXI_BURST_LEN - 1)
	io.ar.bits.size := UInt(log2Up(dataWidth/8 - 1))
	io.ar.bits.burst := UInt(1)
	io.ar.valid := axi_arvalid
	io.r.ready := axi_rready

//	io.TXN_DONE := compare_done
	burst_size_bytes	:= UInt(C_M_AXI_BURST_LEN * dataWidth/8)
//	init_txn_pulse := (!init_txn_ff2) && init_txn_ff

//	when(!reset) {
//		init_txn_ff := Bool(false)
//		init_txn_ff2 := Bool(false)
//	} .otherwise {
//		init_txn_ff := io.INIT_AXI_TXN
//		init_txn_ff2 := init_txn_ff
//	}

	//write address channel
	//write address valid 
	when(!axi_awvalid && io.writeBundle.start_single_burst_write) {
		axi_awvalid := Bool(true)
	} .elsewhen(io.aw.ready && axi_awvalid) {
		axi_awvalid := Bool(false)
	} .otherwise {
		axi_awvalid :=axi_awvalid
	}
	//write address
	when(!axi_awvalid && io.writeBundle.start_single_burst_write) {
		axi_awaddr := io.writeBundle.addr
	} .elsewhen(io.aw.ready && axi_awvalid) {
		axi_awaddr := axi_awaddr + burst_size_bytes;
	} .otherwise {
		axi_awaddr := axi_awaddr
	}

	//write data channel
	wnext := io.w.ready && axi_wvalid
	//write valid
	when(!axi_wvalid && io.writeBundle.start_single_burst_write) {
		axi_wvalid := Bool(true)
	} .elsewhen(wnext && axi_wlast) {
		axi_wvalid := Bool(false)
	} .otherwise {
		axi_wvalid := axi_wvalid
	}
	//wlast 
	when((((write_index === (UInt(C_M_AXI_BURST_LEN) - UInt(2))) && (UInt(C_M_AXI_BURST_LEN) >=UInt(2))) && wnext) || (UInt(C_M_AXI_BURST_LEN) === UInt(1) )) {
		axi_wlast := Bool(true)
	} .elsewhen(wnext) {
		axi_wlast := Bool(false)
	} .elsewhen(axi_wlast && UInt(C_M_AXI_BURST_LEN) === UInt(1)) {
		axi_wlast := Bool(false)
	} .otherwise {
		axi_wlast := axi_wlast
	}

	//burst lenght counter
	when(io.writeBundle.start_single_burst_write) {
		write_index := UInt(0)
	} .elsewhen(wnext && (write_index != UInt(C_M_AXI_BURST_LEN - 1))) {
		write_index := write_index + UInt(1)
	} .otherwise {
		write_index := write_index
	}

	//write data 
	val writeDataQueue = Module(new Chisel.Queue(UInt(width = dataWidth), C_M_AXI_BURST_LEN))
	writeDataQueue.io.enq.bits   := io.writeBundle.data.bits 	
	writeDataQueue.io.enq.valid  := io.writeBundle.data.valid
	io.writeBundle.data.ready    := writeDataQueue.io.enq.ready
	
	writeDataQueue.io.deq.ready  := Bool(false)
	when(io.writeBundle.start_single_burst_write) {
		writeDataQueue.io.deq.ready := Bool(true)
		when(writeDataQueue.io.deq.valid) {
			axi_wdata := writeDataQueue.io.deq.bits
		}
	} .elsewhen(wnext) {
            writeDataQueue.io.deq.ready := Bool(true)
		when(writeDataQueue.io.deq.valid) {
                  axi_wdata := writeDataQueue.io.deq.bits
            }
		//axi_wdata := axi_wdata + UInt(1)
	} .otherwise {
		axi_wdata := axi_wdata
	}


	//write response channel
	//write response ready
	when(io.b.valid && !axi_bready) {
		axi_bready := Bool(true)
	} .elsewhen(axi_bready) {
		axi_bready := Bool(false)
	} .otherwise {
		axi_bready := axi_bready
	}
	write_resp_error := axi_bready && io.b.valid && Bool(io.b.bits.resp(1))
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	
	val readDataQueue = Module(new Chisel.Queue(UInt(width = dataWidth), C_M_AXI_BURST_LEN))
	io.readBundle.data.bits   := readDataQueue.io.deq.bits
	io.readBundle.data.valid  := readDataQueue.io.deq.valid
	readDataQueue.io.deq.ready := io.readBundle.data.ready

	when(readDataQueue.io.enq.ready) {
		readDataQueue.io.enq.bits  := io.r.bits.data
		readDataQueue.io.enq.valid := io.r.valid && axi_rready
	} .otherwise {
		readDataQueue.io.enq.bits  := UInt(0)
		readDataQueue.io.enq.valid := Bool(false)
	}

	//read address channel
	when(!axi_arvalid && io.readBundle.start_single_burst_read) {
		axi_arvalid := Bool(true)
	} .elsewhen(io.ar.ready && axi_arvalid) {
		axi_arvalid := Bool(false)
	} .otherwise {
		axi_arvalid := axi_arvalid
	}
	
	//read address
      when(!axi_arvalid && io.readBundle.start_single_burst_read) {
            axi_araddr := io.readBundle.addr
	} .elsewhen(io.ar.ready && axi_arvalid) {
		axi_araddr := axi_araddr + burst_size_bytes
	} .otherwise {
		axi_araddr := axi_araddr
	}

	//read data
	rnext := io.r.valid && axi_rready
	when(io.readBundle.start_single_burst_read) {
		read_index := UInt(0)
	} .elsewhen(rnext && (read_index =/= UInt(C_M_AXI_BURST_LEN -1))) {
		read_index := read_index + UInt(1)
	} .otherwise {
		read_index := read_index
	}

	//read response
	when(io.r.valid) {
		when(io.r.bits.last && axi_rready) {
			axi_rready := Bool(false)
		} .otherwise {
			axi_rready := Bool(true)
		}
	}
	
//	//error reg
//	when(write_resp_error|| read_resp_error) {
//		error_reg := Bool(true)
//	} .otherwise {
//		error_reg := error_reg
//	}
	
	//example design throttling
	//write burst counter
//	when(io.aw.ready && axi_awvalid) {
//		when(write_burst_counter(C_NO_BURSTS_REQ_W) ===UInt(0)) {
//			write_burst_counter := write_burst_counter + UInt(1)
//		}
//	} .otherwise {
//		write_burst_counter := write_burst_counter 
//	}
//	
//	//read_burst_counter
//	when(io.ar.ready && axi_arvalid) {
//		when(read_burst_counter(C_NO_BURSTS_REQ_R) === UInt(0)) {
//			read_burst_counter := read_burst_counter + UInt(1)
//		}
//	} .otherwise {
//		read_burst_counter := read_burst_counter
//	}
//
	//state machine
//	when(!reset) {
//		io.start_single_burst_write := Bool(false)
//		io.start_single_burst_read := Bool(false)
//		mst_exec_state := STATE('IDLE)
//		compare_done := Bool(false)
//		io.ERROR := Bool(false)
//	} .otherwise {
//		when(mst_exec_state === STATE('IDLE)) {
//			when(init_txn_pulse === Bool(true)) {
//				mst_exec_state := STATE('INIT_WRITE)
//				io.ERROR := Bool(false)
//				compare_done := Bool(false)
//			} .otherwise {
//				mst_exec_state := STATE('IDLE)
//			}
//		} .elsewhen(mst_exec_state === STATE('INIT_WRITE)) {
//			when(writes_done) {
//				mst_exec_state := STATE('INIT_READ)
//			} .otherwise {
//				mst_exec_state := STATE('INIT_WRITE)
//				when(!axi_awvalid && !io.start_single_burst_write && !burst_write_active) {
//					io.start_single_burst_write := Bool(true)
//				} .otherwise {
//					io.start_single_burst_write := Bool(false)
//				}
//			}
//		} .elsewhen(mst_exec_state === STATE('INIT_READ)) {
//			when(reads_done) {
//				mst_exec_state := STATE('INIT_COMPARE)
//			} .otherwise {
//				mst_exec_state := STATE('INIT_READ)
//				when(!axi_arvalid && !burst_read_active && !io.start_single_burst_read) {
//					io.start_single_burst_read := Bool(true)
//				} .otherwise {
//					io.start_single_burst_read := Bool(false)
//				}
//			}
//		} .elsewhen(mst_exec_state === STATE('INIT_COMPARE)) {
//			io.ERROR := error_reg
//			mst_exec_state := STATE('IDLE)
//			compare_done := Bool(true)
//		} .otherwise {
//			mst_exec_state := STATE('IDLE)
//		}
//	}
	
//	//burst write active
//	when(io.writeBundle.start_single_burst_write) {
//		burst_write_active := Bool(true)
//	} .elsewhen(io.b.valid && axi_bready) {
//		burst_write_active := Bool(false)
//	}
//
//	//writes_done
//	when(io.b.valid && (write_burst_counter(C_NO_BURSTS_REQ_W)) && axi_bready) {
//		writes_done := Bool(true)
//	} .otherwise {
//		writes_done := writes_done
//	}
//
//	//burst_read_active
//	when(io.readBundle.start_single_burst_read) {
//		burst_read_active := Bool(true)
//	} .elsewhen(io.r.valid && axi_rready && io.r.bits.last) {
//		burst_read_active := Bool(false)
//	}
//
//	//reads_done
//	when(io.r.valid && axi_rready && (read_index === UInt(C_M_AXI_BURST_LEN - 1)) && (read_burst_counter(C_NO_BURSTS_REQ_R))) {
//		reads_done := Bool(true)
//	} .otherwise {
//		reads_done := reads_done
//	}

	io.readBundle.done := io.r.bits.last
	io.writeBundle.done := axi_wlast
}

class testerTestMaster(c:testMaster) extends Tester(c) {
	step(2)
	poke(c.io.readBundle.addr, 0x33)
	poke(c.io.readBundle.start_single_burst_read, 1)
	step(1)
	poke(c.io.readBundle.start_single_burst_read, 0)
	step(3)
	poke(c.io.ar.ready, 1)
	step(1)
	poke(c.io.ar.ready, 0)
	step(100)

}
