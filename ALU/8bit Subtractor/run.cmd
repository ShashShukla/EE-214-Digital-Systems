ghdl -a Testbench.vhd DUT.vhd eightbitsubtractor.vhd fullbitadder.vhd nxor.vhd
ghdl -e Testbench
ghdl -r Testbench

PAUSE
