######################################################################
#
# File name : tb_test_64_compile.do
# Created on: Mon Jan 28 15:52:09 IST 2019
#
# Auto generated by Vivado for 'behavioral' simulation
#
######################################################################
vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -64 -incr -work xil_defaultlib  \
"../../../../../../final_test/ip_repo/test_64_1.0/hdl/test_64_v1_0_S64_AXI.v" \
"../../../../testSlave.srcs/sources_1/new/tb_slave.v" \
"../../../../testSlave.srcs/sources_1/new/tb_test_64.v" \
"../../../../../../../chisel_AXI/axi-in-chisel/rtl/testSlave.v" \


# compile glbl module
vlog -work xil_defaultlib "glbl.v"

