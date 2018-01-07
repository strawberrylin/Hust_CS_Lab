#!/bin/bash -f
xv_path="/opt/Xilinx/Vivado/2016.2"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xelab -wto 75f0463b5cfb4bbc8f0c7b09e35dd5ea -m64 --debug typical --relax --mt 8 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot liftdesign_tb_behav xil_defaultlib.liftdesign_tb xil_defaultlib.glbl -log elaborate.log
