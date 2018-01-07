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
ExecStep $xv_path/bin/xsim MIPS_CPU_tb_behav -key {Behavioral:sim_1:Functional:MIPS_CPU_tb} -tclbatch MIPS_CPU_tb.tcl -view /home/strawberrylin/Xilinx/VerilogProject/project_1/MIPS_CPU_tb_behav.wcfg -log simulate.log
