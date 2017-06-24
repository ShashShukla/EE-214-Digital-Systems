ghdl -a Testbench.vhd DUT.vhd alu.vhd fullbitadder.vhd nxor.vhd eightbitadder.vhd eightbitsubtractor.vhd leftshift.vhd rightshift.vhd
ghdl -e Testbench
ghdl -r Testbench

PAUSE
