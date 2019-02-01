package AXIChisel

import Chisel._

object Top {
	def main(args: Array[String]): Unit = {
		val swArgs = Array("--backend", 
			"c", 
			"--genHarness", 
			"--vcd",
			"--targetDir", 
			"cppBackend", 
			"--compile",
			"--parallelMakeJobs", "4", 
			"--lineLimitFunctions", "1024",
			"--minimumLinesPerFile", "32768", 
			"--test", 
			"--reportDims", 
			"--debug")
		val hwArgs = Array("--backend", 
			"v", 
			"--genHarness",
			"--vcd",
			"--targetDir", "rtl" )

		args.sliding(1).foreach(arg =>
			arg(0) match {
				case "testSlave" => chiselMainTest(hwArgs, () => Module(new testSlave(6,6,32)))
				{c => new testerTestSlave(c)}
				case "testMaster" => chiselMainTest(hwArgs, () => Module(new testMaster(6,6,32)))
				{c => new testerTestMaster(c)}
				case _ => ( printf("Unknown test case !!!"))
			}
		)
	}
}
