library std;
use std.textio.all;

library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

entity counter is
	port(x: in std_ulogic_vector(3 downto 0); y: in std_ulogic;
		z: out std_ulogic_vector(3 downto 0));
end entity;

architecture Count of counter is

component fullbitadder is 
	port(x,y,cin: in std_ulogic;
	z,cout: out std_ulogic);
end component;

signal carry: std_ulogic_vector(3 downto 0);

begin

adder1: fullbitadder port map(x(0), y, '0', z(0), carry(0));
adder2: fullbitadder port map(x(1), '0', carry(0), z(1), carry(1));
adder3: fullbitadder port map(x(2), '0', carry(1), z(2), carry(2));
adder4: fullbitadder port map(x(3), '0', carry(2), z(3), carry(3));

end Count;
