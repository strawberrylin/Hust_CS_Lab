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
echo "xvlog -m64 --relax -prj MIPS_CPU_tb_vlog.prj"
ExecStep $xv_path/bin/xvlog -m64 --relax -prj MIPS_CPU_tb_vlog.prj 2>&1 | tee compile.log
