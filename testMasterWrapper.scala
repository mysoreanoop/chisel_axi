package AXIChisel
import Chisel._

class testMasterWrapper extends Module {
	val io = new Bundle {
		val readBundle = new TreadBundle(32,32)
		val writeBundle = new TwriteBundle(32,32)
	}

	val master = Module(new testMaster(6,32,32))
	val slave  = Module(new testSlave (6,32,32))

	master.io.readBundle <> io.readBundle
	master.io.writeBundle <> io.writeBundle
	master.io.r <> slave.io.r
	master.io.ar <> slave.io.ar
	master.io.b <> slave.io.b
	master.io.w <> slave.io.w
	master.io.aw <> slave.io.aw
}

class testMasterWrapperTester(c:testMasterWrapper) extends Tester(c) {
//WRITE PROCEDURE
step(2)
var counter = 0
while(counter < 16) {
	while(peek(c.io.writeBundle.data.ready) == 1){
		poke(c.io.writeBundle.data.valid,1)
		poke(c.io.writeBundle.data.bits, counter)
		counter = counter +1
		step(1)
		poke(c.io.writeBundle.data.valid, 0)
	}
	step(1)
}
step(2)
poke(c.io.writeBundle.addr, 0)
poke(c.io.writeBundle.start_single_burst_write, 1)
step(1)
poke(c.io.writeBundle.start_single_burst_write, 0)
step(50)
//READ PROCEDURE
step(2)                                                         
poke(c.io.readBundle.addr, 0x0) 
poke(c.io.readBundle.start_single_burst_read, 1)
step(1)
poke(c.io.readBundle.start_single_burst_read, 0)
step(3)
//poke(c.master.ar.ready, 1)
//step(1)
//poke(c.master.ar.ready, 0)

step(100)

}
