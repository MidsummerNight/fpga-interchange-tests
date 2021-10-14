## basys3 breakout board

# Clock
set_property PACKAGE_PIN  W5 [get_ports clk]

set_property IOSTANDARD LVCMOS33 [get_ports clk]

# UART
set_property PACKAGE_PIN A18 [get_ports tx]
set_property PACKAGE_PIN B18 [get_ports rx]

set_property IOSTANDARD LVCMOS33 [get_ports tx]
set_property IOSTANDARD LVCMOS33 [get_ports rx]

# sw[0:15] correspond with SW0-SW15 on the basys3
set_property PACKAGE_PIN V17 [get_ports sw[0]]
set_property PACKAGE_PIN V16 [get_ports sw[1]]
set_property PACKAGE_PIN W16 [get_ports sw[2]]
set_property PACKAGE_PIN W17 [get_ports sw[3]]
set_property PACKAGE_PIN W15 [get_ports sw[4]]
set_property PACKAGE_PIN V15 [get_ports sw[5]]
set_property PACKAGE_PIN W14 [get_ports sw[6]]
set_property PACKAGE_PIN W13 [get_ports sw[7]]
set_property PACKAGE_PIN  V2 [get_ports sw[8]]
set_property PACKAGE_PIN  T3 [get_ports sw[9]]
set_property PACKAGE_PIN  T2 [get_ports sw[10]]
set_property PACKAGE_PIN  R3 [get_ports sw[11]]
set_property PACKAGE_PIN  W2 [get_ports sw[12]]
set_property PACKAGE_PIN  U1 [get_ports sw[13]]
set_property PACKAGE_PIN  T1 [get_ports sw[14]]
set_property PACKAGE_PIN  R2 [get_ports sw[15]]

set_property IOSTANDARD LVCMOS33 [get_ports sw[0]]
set_property IOSTANDARD LVCMOS33 [get_ports sw[1]]
set_property IOSTANDARD LVCMOS33 [get_ports sw[2]]
set_property IOSTANDARD LVCMOS33 [get_ports sw[3]]
set_property IOSTANDARD LVCMOS33 [get_ports sw[4]]
set_property IOSTANDARD LVCMOS33 [get_ports sw[5]]
set_property IOSTANDARD LVCMOS33 [get_ports sw[6]]
set_property IOSTANDARD LVCMOS33 [get_ports sw[7]]
set_property IOSTANDARD LVCMOS33 [get_ports sw[8]]
set_property IOSTANDARD LVCMOS33 [get_ports sw[9]]
set_property IOSTANDARD LVCMOS33 [get_ports sw[10]]
set_property IOSTANDARD LVCMOS33 [get_ports sw[11]]
set_property IOSTANDARD LVCMOS33 [get_ports sw[12]]
set_property IOSTANDARD LVCMOS33 [get_ports sw[13]]
set_property IOSTANDARD LVCMOS33 [get_ports sw[14]]
set_property IOSTANDARD LVCMOS33 [get_ports sw[15]]

# led[0:15] correspond with LD0-LD15 on the basys3
set_property PACKAGE_PIN U16 [get_ports led[0]]
set_property PACKAGE_PIN E19 [get_ports led[1]]
set_property PACKAGE_PIN U19 [get_ports led[2]]
set_property PACKAGE_PIN V19 [get_ports led[3]]
set_property PACKAGE_PIN W18 [get_ports led[4]]
set_property PACKAGE_PIN U15 [get_ports led[5]]
set_property PACKAGE_PIN U14 [get_ports led[6]]
set_property PACKAGE_PIN V14 [get_ports led[7]]
set_property PACKAGE_PIN V13 [get_ports led[8]]
set_property PACKAGE_PIN  V3 [get_ports led[9]]
set_property PACKAGE_PIN  W3 [get_ports led[10]]
set_property PACKAGE_PIN  U3 [get_ports led[11]]
set_property PACKAGE_PIN  P3 [get_ports led[12]]
set_property PACKAGE_PIN  N3 [get_ports led[13]]
set_property PACKAGE_PIN  P1 [get_ports led[14]]
set_property PACKAGE_PIN  L1 [get_ports led[15]]

set_property IOSTANDARD LVCMOS33 [get_ports led[0]]
set_property IOSTANDARD LVCMOS33 [get_ports led[1]]
set_property IOSTANDARD LVCMOS33 [get_ports led[2]]
set_property IOSTANDARD LVCMOS33 [get_ports led[3]]
set_property IOSTANDARD LVCMOS33 [get_ports led[4]]
set_property IOSTANDARD LVCMOS33 [get_ports led[5]]
set_property IOSTANDARD LVCMOS33 [get_ports led[6]]
set_property IOSTANDARD LVCMOS33 [get_ports led[7]]
set_property IOSTANDARD LVCMOS33 [get_ports led[8]]
set_property IOSTANDARD LVCMOS33 [get_ports led[9]]
set_property IOSTANDARD LVCMOS33 [get_ports led[10]]
set_property IOSTANDARD LVCMOS33 [get_ports led[11]]
set_property IOSTANDARD LVCMOS33 [get_ports led[12]]
set_property IOSTANDARD LVCMOS33 [get_ports led[13]]
set_property IOSTANDARD LVCMOS33 [get_ports led[14]]
set_property IOSTANDARD LVCMOS33 [get_ports led[15]]