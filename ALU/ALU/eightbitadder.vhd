library std;
use std.textio.all;

library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

entity eightbitadder is
	port(x,y: in std_logic_vector(7 downto 0);
		z: out std_logic_vector(7 downto 0));
end entity;

architecture Eightbitadd of eightbitadder is

component fullbitadder is 
	port(x,y,cin: in std_logic;
	z,cout: out std_logic);
end component;

signal carry: std_logic_vector(7 downto 0);

begin

adder1: fullbitadder port map(x(0), y(0), '0', z(0), carry(0));
adder2: fullbitadder port map(x(1), y(1), carry(0), z(1), carry(1));
adder3: fullbitadder port map(x(2), y(2), carry(1), z(2), carry(2));
adder4: fullbitadder port map(x(3), y(3), carry(2), z(3), carry(3));
adder5: fullbitadder port map(x(4), y(4), carry(3), z(4), carry(4));
adder6: fullbitadder port map(x(5), y(5), carry(4), z(5), carry(5));
adder7: fullbitadder port map(x(6), y(6), carry(5), z(6), carry(6));
adder8: fullbitadder port map(x(7), y(7), carry(6), z(7), carry(7));

end Eightbitadd;
