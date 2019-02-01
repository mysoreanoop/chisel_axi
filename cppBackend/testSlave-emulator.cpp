#include "testSlave.h"

int main (int argc, char* argv[]) {
  testSlave_t module;
  testSlave_api_t api(&module);
  module.init();
  api.init_sim_data();
  api.init_channels();
  std::vector<std::string> args(argv+1, argv+argc);
  std::string vcdfile = "cppBackend/testSlave.vcd";
  std::vector<std::string>::const_iterator it;
  for (it = args.begin() ; it != args.end() ; it++) {
    if (it->find("+vcdfile=") == 0) vcdfile = it->c_str()+9;
  }
  FILE *f = fopen(vcdfile.c_str(), "w");
  module.set_dumpfile(f);
  module.clk.cnt = module.clk.len;
  while(!api.exit()) api.tick();
  if (f) fclose(f);
}
