#!/bin/bash -f
xv_path="/home/strawberrylin/Xilinx/2016.2/Vivado/2016.2"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xelab -wto e59393d9257648d392bf01558e023667 -m64 --debug typical --relax --mt 8 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot MIPS_CPU_tb_behav xil_defaultlib.MIPS_CPU_tb xil_defaultlib.glbl -log elaborate.log
