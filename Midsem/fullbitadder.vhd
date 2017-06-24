library std;
use std.textio.all;

library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

entity fullbitadder is 
	port(x,y,cin: in std_ulogic;
		z,cout: out std_ulogic);
end entity;

architecture Fullbit of fullbitadder is 

component nxor is 
port(x1,x0: in std_ulogic; s0: out std_ulogic);
end component;

signal temp1: std_ulogic;
begin
 
add_xor1: nxor port map(x,y, temp1);
add_xor2: nxor port map(temp1,cin, z);

cout <= (x and y) or (x and cin) or (y and cin);

end Fullbit;

