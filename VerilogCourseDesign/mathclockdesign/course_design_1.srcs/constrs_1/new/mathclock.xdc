# Nexys4 Pin Assignments
############################
# On-board Slide Switches  #
############################
# Clk Sclk Reset K0 K1 K2 K3
set_property PACKAGE_PIN E3 [get_ports Clk]
set_property IOSTANDARD LVCMOS33 [get_ports Clk]
set_property PACKAGE_PIN E16 [get_ports Sclk]
set_property IOSTANDARD LVCMOS33 [get_ports Sclk]
set_property PACKAGE_PIN U9 [get_ports K0]
set_property IOSTANDARD LVCMOS33 [get_ports K0]
set_property PACKAGE_PIN U8 [get_ports K1]
set_property IOSTANDARD LVCMOS33 [get_ports K1]
set_property PACKAGE_PIN R7 [get_ports K2]
set_property IOSTANDARD LVCMOS33 [get_ports K2]
set_property PACKAGE_PIN R6 [get_ports K3]
set_property IOSTANDARD LVCMOS33 [get_ports K3]
set_property PACKAGE_PIN R5 [get_ports Reset]
set_property IOSTANDARD LVCMOS33 [get_ports Reset]
set_property PACKAGE_PIN V7 [get_ports Choose]
set_property IOSTANDARD LVCMOS33 [get_ports Choose]


############################
# On-board led             #
############################
# Dout Sout  8bits
set_property PACKAGE_PIN M4 [get_ports Dout[7]]
set_property IOSTANDARD LVCMOS33 [get_ports Dout[7]]
set_property PACKAGE_PIN L3 [get_ports Dout[6]]
set_property IOSTANDARD LVCMOS33 [get_ports Dout[6]]
set_property PACKAGE_PIN N1 [get_ports Dout[5]]
set_property IOSTANDARD LVCMOS33 [get_ports Dout[5]]
set_property PACKAGE_PIN L5 [get_ports Dout[4]]
set_property IOSTANDARD LVCMOS33 [get_ports Dout[4]]
set_property PACKAGE_PIN L4 [get_ports Dout[3]]
set_property IOSTANDARD LVCMOS33 [get_ports Dout[3]]
set_property PACKAGE_PIN K3 [get_ports Dout[2]]
set_property IOSTANDARD LVCMOS33 [get_ports Dout[2]]
set_property PACKAGE_PIN M2 [get_ports Dout[1]]
set_property IOSTANDARD LVCMOS33 [get_ports Dout[1]]
set_property PACKAGE_PIN L6 [get_ports Dout[0]]
set_property IOSTANDARD LVCMOS33 [get_ports Dout[0]]
# Segout 8bits
set_property PACKAGE_PIN N6 [get_ports Segout[0]]
set_property IOSTANDARD LVCMOS33 [get_ports Segout[0]]
set_property PACKAGE_PIN M6 [get_ports Segout[1]]
set_property IOSTANDARD LVCMOS33 [get_ports Segout[1]]
set_property PACKAGE_PIN M3 [get_ports Segout[2]]
set_property IOSTANDARD LVCMOS33 [get_ports Segout[2]]
set_property PACKAGE_PIN N5 [get_ports Segout[3]]
set_property IOSTANDARD LVCMOS33 [get_ports Segout[3]]
set_property PACKAGE_PIN N2 [get_ports Segout[4]]
set_property IOSTANDARD LVCMOS33 [get_ports Segout[4]]
set_property PACKAGE_PIN N4 [get_ports Segout[5]]
set_property IOSTANDARD LVCMOS33 [get_ports Segout[5]]
set_property PACKAGE_PIN L1 [get_ports Segout[6]]
set_property IOSTANDARD LVCMOS33 [get_ports Segout[6]]
set_property PACKAGE_PIN M1 [get_ports Segout[7]]
set_property IOSTANDARD LVCMOS33 [get_ports Segout[7]]
# Ring Light
set_property PACKAGE_PIN P2 [get_ports Ring]
set_property IOSTANDARD LVCMOS33 [get_ports Ring]
set_property PACKAGE_PIN T5 [get_ports Powerled]
set_property IOSTANDARD LVCMOS33 [get_ports Powerled]
set_property PACKAGE_PIN T4 [get_ports Chooseled]
set_property IOSTANDARD LVCMOS33 [get_ports Chooseled]