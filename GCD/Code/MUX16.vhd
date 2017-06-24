library std;
use std.textio.all;

library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.EE224_Components.all;

entity MUX16 is
	port (a,b: in std_ulogic_vector(15 downto 0); e: in std_ulogic ; o: out std_ulogic_vector(15 downto 0));
end entity;

architecture behave of MUX16 is

component MUX is
	port (a,b,e : in std_ulogic ; o: out std_ulogic);
end component MUX;

begin

g15 : MUX port map (a(15),b(15),e,o(15));
g14 : MUX port map (a(14),b(14),e,o(14));
g13 : MUX port map (a(13),b(13),e,o(13));
g12 : MUX port map (a(12),b(12),e,o(12));
g11 : MUX port map (a(11),b(11),e,o(11));
g10 : MUX port map (a(10),b(10),e,o(10));
g9  : MUX port map (a(9),b(9),e,o(9));
g8  : MUX port map (a(8),b(8),e,o(8));
g7  : MUX port map (a(7),b(7),e,o(7));
g6  : MUX port map (a(6),b(6),e,o(6));
g5  : MUX port map (a(5),b(5),e,o(5));
g4  : MUX port map (a(4),b(4),e,o(4));
g3  : MUX port map (a(3),b(3),e,o(3));
g2  : MUX port map (a(2),b(2),e,o(2));
g1  : MUX port map (a(1),b(1),e,o(1));
g0  : MUX port map (a(0),b(0),e,o(0));

end behave;
