library std;
use std.textio.all;

library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.EE224_Components.all;

entity MUX is
	port (a,b,e : in std_ulogic ; o: out std_ulogic);
end entity MUX;

architecture behave of MUX is
signal s1,s2 : std_ulogic ;

begin

s1 <= a and e; 
s2 <= b and (not e);
o <= s1 or s2;

end behave;
