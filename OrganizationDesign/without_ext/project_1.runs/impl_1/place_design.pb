
�
�No debug cores found in the current design.
Before running the implement_debug_core command, either use the Set Up Debug wizard (GUI mode)
or use the create_debug_core and connect_debug_core Tcl commands to insert debug cores into the design.
154*	chipscopeZ16-241h px� 
Q
Command: %s
53*	vivadotcl2 
place_design2default:defaultZ4-113h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7a100t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7a100t2default:defaultZ17-349h px� 
P
Running DRC with %s threads
24*drc2
42default:defaultZ23-27h px� 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px� 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px� 
p
,Running DRC as a precondition to command %s
22*	vivadotcl2 
place_design2default:defaultZ4-22h px� 
P
Running DRC with %s threads
24*drc2
42default:defaultZ23-27h px� 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px� 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px� 
U

Starting %s Task
103*constraints2
Placer2default:defaultZ18-103h px� 
}
BMultithreading enabled for place_design using a maximum of %s CPUs12*	placeflow2
42default:defaultZ30-611h px� 
v

Phase %s%s
101*constraints2
1 2default:default2)
Placer Initialization2default:defaultZ18-101h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:00.032default:default2
00:00:00.022default:default2
1817.7462default:default2
0.0002default:default2
25042default:default2
131202default:defaultZ17-722h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:00.022default:default2
00:00:00.022default:default2
1817.7462default:default2
0.0002default:default2
25042default:default2
131202default:defaultZ17-722h px� 
�

Phase %s%s
101*constraints2
1.1 2default:default2F
2IO Placement/ Clock Placement/ Build Placer Device2default:defaultZ18-101h px� 
�

Phase %s%s
101*constraints2
1.1.1 2default:default22
ParallelPlaceIOClockAndInitTop2default:defaultZ18-101h px� 
v

Phase %s%s
101*constraints2
1.1.1.1 2default:default2#
Pre-Place Cells2default:defaultZ18-101h px� 
H
3Phase 1.1.1.1 Pre-Place Cells | Checksum: 14b35c08
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:00.20 ; elapsed = 00:00:00.20 . Memory (MB): peak = 1817.746 ; gain = 0.000 ; free physical = 2504 ; free virtual = 131202default:defaulth px� 
�

Phase %s%s
101*constraints2
1.1.1.2 2default:default2/
Constructing HAPIClkRuleMgr2default:defaultZ18-101h px� 
T
?Phase 1.1.1.2 Constructing HAPIClkRuleMgr | Checksum: 14b35c08
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:00.77 ; elapsed = 00:00:00.80 . Memory (MB): peak = 1817.746 ; gain = 0.000 ; free physical = 2504 ; free virtual = 131202default:defaulth px� 
�
�A LUT '%s' is driving clock pin of %s registers. This could lead to large hold time violations. First few involved registers are:
%s524*place2-
REGISTER2/count[0]_i_2__02default:default2
282default:default2�
�	dclock_15/dclk_reg {FDRE}
	dclock_15/count_reg[9] {FDRE}
	dclock_15/count_reg[8] {FDRE}
	dclock_15/count_reg[7] {FDRE}
	dclock_15/count_reg[6] {FDRE}
2default:defaultZ30-568h px� 
�
�A LUT '%s' is driving clock pin of %s registers. This could lead to large hold time violations. First few involved registers are:
%s524*place2,
REGFILE1/data_out[0]_i_12default:default2
12default:default26
"	REGISTER2/data_out_reg[0] {FDRE}
2default:defaultZ30-568h px� 
�
�Found overlapping PBlocks. The use of overlapping PBlocks is not recommended as it may lead to legalization errors or unplaced instances.%s708*place2
 2default:defaultZ30-879h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
z

Phase %s%s
101*constraints2
1.1.1.3 2default:default2'
IO and Clk Clean Up2default:defaultZ18-101h px� 
�

Phase %s%s
101*constraints2

1.1.1.3.1 2default:default2/
Constructing HAPIClkRuleMgr2default:defaultZ18-101h px� 
V
APhase 1.1.1.3.1 Constructing HAPIClkRuleMgr | Checksum: 14b35c08
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:07 ; elapsed = 00:00:05 . Memory (MB): peak = 1849.746 ; gain = 32.000 ; free physical = 2479 ; free virtual = 130842default:defaulth px� 
L
7Phase 1.1.1.3 IO and Clk Clean Up | Checksum: 14b35c08
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:07 ; elapsed = 00:00:05 . Memory (MB): peak = 1849.746 ; gain = 32.000 ; free physical = 2479 ; free virtual = 130842default:defaulth px� 
�

Phase %s%s
101*constraints2
1.1.1.4 2default:default2>
*Implementation Feasibility check On IDelay2default:defaultZ18-101h px� 
c
NPhase 1.1.1.4 Implementation Feasibility check On IDelay | Checksum: 14b35c08
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:08 ; elapsed = 00:00:05 . Memory (MB): peak = 1849.746 ; gain = 32.000 ; free physical = 2479 ; free virtual = 130842default:defaulth px� 
z

Phase %s%s
101*constraints2
1.1.1.5 2default:default2'
Commit IO Placement2default:defaultZ18-101h px� 
L
7Phase 1.1.1.5 Commit IO Placement | Checksum: ca402afe
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:08 ; elapsed = 00:00:05 . Memory (MB): peak = 1849.746 ; gain = 32.000 ; free physical = 2479 ; free virtual = 130842default:defaulth px� 
U
@Phase 1.1.1 ParallelPlaceIOClockAndInitTop | Checksum: ca402afe
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:08 ; elapsed = 00:00:05 . Memory (MB): peak = 1849.746 ; gain = 32.000 ; free physical = 2479 ; free virtual = 130842default:defaulth px� 
h
SPhase 1.1 IO Placement/ Clock Placement/ Build Placer Device | Checksum: 182d1ed5e
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:08 ; elapsed = 00:00:05 . Memory (MB): peak = 1849.746 ; gain = 32.000 ; free physical = 2479 ; free virtual = 130842default:defaulth px� 
}

Phase %s%s
101*constraints2
1.2 2default:default2.
Build Placer Netlist Model2default:defaultZ18-101h px� 
v

Phase %s%s
101*constraints2
1.2.1 2default:default2%
Place Init Design2default:defaultZ18-101h px� 
r

Phase %s%s
101*constraints2
1.2.1.1 2default:default2
Make Others2default:defaultZ18-101h px� 
E
0Phase 1.2.1.1 Make Others | Checksum: 1d52539a9
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:08 ; elapsed = 00:00:06 . Memory (MB): peak = 1849.746 ; gain = 32.000 ; free physical = 2471 ; free virtual = 130762default:defaulth px� 
I
4Phase 1.2.1 Place Init Design | Checksum: 19a30110b
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:08 ; elapsed = 00:00:06 . Memory (MB): peak = 1849.746 ; gain = 32.000 ; free physical = 2471 ; free virtual = 130762default:defaulth px� 
P
;Phase 1.2 Build Placer Netlist Model | Checksum: 19a30110b
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:08 ; elapsed = 00:00:06 . Memory (MB): peak = 1849.746 ; gain = 32.000 ; free physical = 2471 ; free virtual = 130762default:defaulth px� 
z

Phase %s%s
101*constraints2
1.3 2default:default2+
Constrain Clocks/Macros2default:defaultZ18-101h px� 
M
8Phase 1.3 Constrain Clocks/Macros | Checksum: 19a30110b
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:08 ; elapsed = 00:00:06 . Memory (MB): peak = 1849.746 ; gain = 32.000 ; free physical = 2471 ; free virtual = 130762default:defaulth px� 
I
4Phase 1 Placer Initialization | Checksum: 19a30110b
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:08 ; elapsed = 00:00:06 . Memory (MB): peak = 1849.746 ; gain = 32.000 ; free physical = 2471 ; free virtual = 130762default:defaulth px� 
q

Phase %s%s
101*constraints2
2 2default:default2$
Global Placement2default:defaultZ18-101h px� 
D
/Phase 2 Global Placement | Checksum: 1acb2d757
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:34 ; elapsed = 00:00:22 . Memory (MB): peak = 1914.859 ; gain = 97.113 ; free physical = 2411 ; free virtual = 130162default:defaulth px� 
q

Phase %s%s
101*constraints2
3 2default:default2$
Detail Placement2default:defaultZ18-101h px� 
}

Phase %s%s
101*constraints2
3.1 2default:default2.
Commit Multi Column Macros2default:defaultZ18-101h px� 
P
;Phase 3.1 Commit Multi Column Macros | Checksum: 1acb2d757
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:35 ; elapsed = 00:00:23 . Memory (MB): peak = 1914.859 ; gain = 97.113 ; free physical = 2411 ; free virtual = 130162default:defaulth px� 


Phase %s%s
101*constraints2
3.2 2default:default20
Commit Most Macros & LUTRAMs2default:defaultZ18-101h px� 
R
=Phase 3.2 Commit Most Macros & LUTRAMs | Checksum: 233ff8ff3
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:35 ; elapsed = 00:00:23 . Memory (MB): peak = 1914.859 ; gain = 97.113 ; free physical = 2411 ; free virtual = 130162default:defaulth px� 
y

Phase %s%s
101*constraints2
3.3 2default:default2*
Area Swap Optimization2default:defaultZ18-101h px� 
L
7Phase 3.3 Area Swap Optimization | Checksum: 22bb5f4f5
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:36 ; elapsed = 00:00:23 . Memory (MB): peak = 1914.859 ; gain = 97.113 ; free physical = 2411 ; free virtual = 130172default:defaulth px� 


Phase %s%s
101*constraints2
3.4 2default:default20
Small Shape Detail Placement2default:defaultZ18-101h px� 
R
=Phase 3.4 Small Shape Detail Placement | Checksum: 146df91d9
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:51 ; elapsed = 00:00:37 . Memory (MB): peak = 1942.109 ; gain = 124.363 ; free physical = 2361 ; free virtual = 129662default:defaulth px� 
u

Phase %s%s
101*constraints2
3.5 2default:default2&
Re-assign LUT pins2default:defaultZ18-101h px� 
H
3Phase 3.5 Re-assign LUT pins | Checksum: 146df91d9
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:52 ; elapsed = 00:00:38 . Memory (MB): peak = 1942.109 ; gain = 124.363 ; free physical = 2361 ; free virtual = 129662default:defaulth px� 
�

Phase %s%s
101*constraints2
3.6 2default:default22
Pipeline Register Optimization2default:defaultZ18-101h px� 
T
?Phase 3.6 Pipeline Register Optimization | Checksum: 146df91d9
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:53 ; elapsed = 00:00:38 . Memory (MB): peak = 1942.109 ; gain = 124.363 ; free physical = 2361 ; free virtual = 129662default:defaulth px� 
D
/Phase 3 Detail Placement | Checksum: 146df91d9
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:53 ; elapsed = 00:00:38 . Memory (MB): peak = 1942.109 ; gain = 124.363 ; free physical = 2361 ; free virtual = 129662default:defaulth px� 
�

Phase %s%s
101*constraints2
4 2default:default2<
(Post Placement Optimization and Clean-Up2default:defaultZ18-101h px� 
{

Phase %s%s
101*constraints2
4.1 2default:default2,
Post Commit Optimization2default:defaultZ18-101h px� 
N
9Phase 4.1 Post Commit Optimization | Checksum: 146df91d9
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:54 ; elapsed = 00:00:39 . Memory (MB): peak = 1942.109 ; gain = 124.363 ; free physical = 2361 ; free virtual = 129662default:defaulth px� 
�

Phase %s%s
101*constraints2
4.2 2default:default25
!Sweep Clock Roots: Post-Placement2default:defaultZ18-101h px� 
W
BPhase 4.2 Sweep Clock Roots: Post-Placement | Checksum: 146df91d9
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:54 ; elapsed = 00:00:39 . Memory (MB): peak = 1942.109 ; gain = 124.363 ; free physical = 2361 ; free virtual = 129662default:defaulth px� 
y

Phase %s%s
101*constraints2
4.3 2default:default2*
Post Placement Cleanup2default:defaultZ18-101h px� 
L
7Phase 4.3 Post Placement Cleanup | Checksum: 146df91d9
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:55 ; elapsed = 00:00:39 . Memory (MB): peak = 1942.109 ; gain = 124.363 ; free physical = 2361 ; free virtual = 129662default:defaulth px� 
s

Phase %s%s
101*constraints2
4.4 2default:default2$
Placer Reporting2default:defaultZ18-101h px� 
F
1Phase 4.4 Placer Reporting | Checksum: 146df91d9
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:55 ; elapsed = 00:00:39 . Memory (MB): peak = 1942.109 ; gain = 124.363 ; free physical = 2361 ; free virtual = 129662default:defaulth px� 
z

Phase %s%s
101*constraints2
4.5 2default:default2+
Final Placement Cleanup2default:defaultZ18-101h px� 
L
7Phase 4.5 Final Placement Cleanup | Checksum: b907f7db
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:55 ; elapsed = 00:00:40 . Memory (MB): peak = 1942.109 ; gain = 124.363 ; free physical = 2361 ; free virtual = 129662default:defaulth px� 
[
FPhase 4 Post Placement Optimization and Clean-Up | Checksum: b907f7db
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:55 ; elapsed = 00:00:40 . Memory (MB): peak = 1942.109 ; gain = 124.363 ; free physical = 2361 ; free virtual = 129662default:defaulth px� 
=
(Ending Placer Task | Checksum: 8d0001b7
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:55 ; elapsed = 00:00:40 . Memory (MB): peak = 1942.109 ; gain = 124.363 ; free physical = 2361 ; free virtual = 129662default:defaulth px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
342default:default2
42default:default2
02default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
place_design2default:defaultZ4-42h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2"
place_design: 2default:default2
00:00:592default:default2
00:00:422default:default2
1942.1092default:default2
124.3632default:default2
23612default:default2
129662default:defaultZ17-722h px� 
D
Writing placer database...
1603*designutilsZ20-1893h px� 
=
Writing XDEF routing.
211*designutilsZ20-211h px� 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px� 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2)
Write XDEF Complete: 2default:default2
00:00:082default:default2
00:00:032default:default2
1942.1092default:default2
0.0002default:default2
23092default:default2
129672default:defaultZ17-722h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2&
write_checkpoint: 2default:default2
00:00:112default:default2
00:00:052default:default2
1942.1092default:default2
0.0002default:default2
23542default:default2
129662default:defaultZ17-722h px� 
�
�report_io: Time (s): cpu = 00:00:00.10 ; elapsed = 00:00:00.14 . Memory (MB): peak = 1942.109 ; gain = 0.000 ; free physical = 2352 ; free virtual = 12964
*commonh px� 
�
�report_utilization: Time (s): cpu = 00:00:00.40 ; elapsed = 00:00:00.43 . Memory (MB): peak = 1942.109 ; gain = 0.000 ; free physical = 2352 ; free virtual = 12964
*commonh px� 
�
�report_control_sets: Time (s): cpu = 00:00:00.17 ; elapsed = 00:00:00.21 . Memory (MB): peak = 1942.109 ; gain = 0.000 ; free physical = 2352 ; free virtual = 12964
*commonh px� 


End Record