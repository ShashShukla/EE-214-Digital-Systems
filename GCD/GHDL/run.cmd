ghdl -a EE224.vhd
ghdl -a GCDCOMPONENTS.vhd	
ghdl -a bitreg.vhd divider.vhd gcd.vhd gcd2.vhd MUX.vhd MUX16.vhd dregister.vhd register16.vhd unsigned_comparator.vhd unsigned_subtractor.vhd 
ghdl -a Testbench.vhd
ghdl -e test_bench
ghdl -r test_bench

PAUSE