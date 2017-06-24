library std;
use std.textio.all;

library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.EE224_Components.all;

entity AND7 is
	port(x6,x5,x4,x3,x2,x1,x0: in std_ulogic;
		z: out std_ulogic);
end entity;

architecture and7 of AND7 is

component AND2 is
	port (a, b: in std_ulogic; c : out std_ulogic);
end component;

signal and1,tand2,and3,and4,and5: std_ulogic;

begin

cand1: AND2 port map(x6, x5, and1);
cand2: AND2 port map(and1, x4, tand2);
cand3: AND2 port map(tand2, x3, and3);
cand4: AND2 port map(and3, x2, and4);
cand5: AND2 port map(and4, x1, and5);
cand6: AND2 port map(and5, x0, z);

end and7;

