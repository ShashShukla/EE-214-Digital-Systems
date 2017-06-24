ghdl -a EE224.vhd
ghdl -a Testbench.vhd DUT.vhd AND7.vhd stringFSM.vhd FSMBomb.vhd FSMGun.vhd FSMKnife.vhd FSMTerror.vhd 
ghdl -e Testbench
ghdl -r Testbench

PAUSE