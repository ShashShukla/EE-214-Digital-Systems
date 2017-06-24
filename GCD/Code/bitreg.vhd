library std;
use std.textio.all;

library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.EE224_Components.all;

entity bitreg is
	port (clk, enable, d : in std_ulogic; o : out std_ulogic);
end entity;

architecture store of bitreg is

	component MUX is
		port (a,b,e : in std_ulogic ; o: out std_ulogic);
	end component MUX;

signal data,t :std_ulogic;

begin
	g1	:MUX port map (d,data,enable,t);
	g2	:DFF port map (d => t, clk => clk, q => data);
	o <= data;
end store;
