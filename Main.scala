package AXIChisel

import Chisel._

object Top {
	def main(args: Array[String]): Unit = {
		val swArgs = Array("--backend", "c", "--genHarness", "--vcd",
				"--targetDir", "cppBackend", "--compile",
				"--parallelMakeJobs", "4", "--lineLimitFunctions", "1024",
				"--minimumLinesPerFile", "32768", "--test", "--reportDims", "--debug")
		val hwArgs = Array("--backend", "v", "--genHarness","--vcd","--targetDir", "rtl" )

            val mainargs = args(0) match {
                  case "--sw" => swArgs
                  case "--hw" => hwArgs
                  case _ => Array("Unknown Option")
            }

	      if (mainargs != Array("Unknown Option")) {
	            args(1) match {                                                                 
	
			//args.sliding(2).foreach(arg =>
			//	arg(0) match {
				//case "SimpleReg" => chiselMainTest(swArgs, () => Module(new SimpleReg(4,6,32)))
				//{c => new TesterSimpleReg(c)}
				case "testSlave" => chiselMainTest(mainargs, () => Module(new testSlave(6,32,256)))
				{c => new testerTestSlave(c)}
				case "testLiteSlave" => chiselMainTest(mainargs, () => Module(new testLiteSlave(5,32)))
				{c => new testerTestLiteSlave(c)}
				case "testMaster" => chiselMainTest(mainargs, () => Module(new testMaster(6,32,256)))
				{c => new testerTestMaster(c)}
				case "testMasterWrapper" => chiselMainTest(mainargs, () => Module(new testMasterWrapper))
				{c => new testMasterWrapperTester(c)}
				case "testDecoupled" => chiselMainTest(hwArgs, () => Module(new master))
				{c => new testerMaster(c)}
				case _ => ( printf("Unknown test case !!!"))
			}
		}
	}
}
