# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir /home/strawberrylin/gitrepository/VerilogCourseDesign/mathclockdesign/course_design_1.cache/wt [current_project]
set_property parent.project_path /home/strawberrylin/gitrepository/VerilogCourseDesign/mathclockdesign/course_design_1.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_verilog -library xil_defaultlib {
  /home/strawberrylin/gitrepository/VerilogCourseDesign/mathclockdesign/course_design_1.srcs/sources_1/new/modle_six.v
  /home/strawberrylin/gitrepository/VerilogCourseDesign/mathclockdesign/course_design_1.srcs/sources_1/new/modle_ten.v
  /home/strawberrylin/gitrepository/VerilogCourseDesign/mathclockdesign/course_design_1.srcs/sources_1/new/seven_segment.v
  /home/strawberrylin/gitrepository/VerilogCourseDesign/mathclockdesign/course_design_1.srcs/sources_1/new/dclock_1000HZ.v
  /home/strawberrylin/gitrepository/VerilogCourseDesign/mathclockdesign/course_design_1.srcs/sources_1/new/modle_24.v
  /home/strawberrylin/gitrepository/VerilogCourseDesign/mathclockdesign/course_design_1.srcs/sources_1/new/modle_60.v
  /home/strawberrylin/gitrepository/VerilogCourseDesign/mathclockdesign/course_design_1.srcs/sources_1/new/dclock2.v
  /home/strawberrylin/gitrepository/VerilogCourseDesign/mathclockdesign/course_design_1.srcs/sources_1/new/dclock.v
  /home/strawberrylin/gitrepository/VerilogCourseDesign/mathclockdesign/course_design_1.srcs/sources_1/new/ring_module.v
  /home/strawberrylin/gitrepository/VerilogCourseDesign/mathclockdesign/course_design_1.srcs/sources_1/new/choose_seg.v
  /home/strawberrylin/gitrepository/VerilogCourseDesign/mathclockdesign/course_design_1.srcs/sources_1/new/adjust_module.v
  /home/strawberrylin/gitrepository/VerilogCourseDesign/mathclockdesign/course_design_1.srcs/sources_1/new/clock_module.v
  /home/strawberrylin/gitrepository/VerilogCourseDesign/mathclockdesign/course_design_1.srcs/sources_1/new/mathclock.v
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc /home/strawberrylin/gitrepository/VerilogCourseDesign/mathclockdesign/course_design_1.srcs/constrs_1/new/mathclock.xdc
set_property used_in_implementation false [get_files /home/strawberrylin/gitrepository/VerilogCourseDesign/mathclockdesign/course_design_1.srcs/constrs_1/new/mathclock.xdc]


synth_design -top mathclock -part xc7a100tcsg324-1


write_checkpoint -force -noxdef mathclock.dcp

catch { report_utilization -file mathclock_utilization_synth.rpt -pb mathclock_utilization_synth.pb }