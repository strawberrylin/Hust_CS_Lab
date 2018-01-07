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
ExecStep $xv_path/bin/xsim liftdesign_tb_behav -key {Behavioral:sim_1:Functional:liftdesign_tb} -tclbatch liftdesign_tb.tcl -log simulate.log
