library std;
use std.textio.all;

library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

entity leftshift is
	port(x,y: in std_logic_vector(7 downto 0);
		z: out std_logic_vector(7 downto 0));
end entity;

architecture Leftshift of leftshift is

signal sig0, sig1, sig2, sig3, sig4, sig5, sig6, sig7: std_logic;

begin

sig0 <= (not y(7)) and (not y(6)) and (not y(5)) and (not y(4)) and (not y(3)) and (not y(2)) and (not y(1)) and (not y(0));
sig1 <= (not y(7)) and (not y(6)) and (not y(5)) and (not y(4)) and (not y(3)) and (not y(2)) and (not y(1)) and y(0);
sig2 <= (not y(7)) and (not y(6)) and (not y(5)) and (not y(4)) and (not y(3)) and (not y(2)) and y(1) and (not y(0));
sig3 <= (not y(7)) and (not y(6)) and (not y(5)) and (not y(4)) and (not y(3)) and (not y(2)) and y(1) and y(0);
sig4 <= (not y(7)) and (not y(6)) and (not y(5)) and (not y(4)) and (not y(3)) and y(2) and (not y(1)) and (not y(0));
sig5 <= (not y(7)) and (not y(6)) and (not y(5)) and (not y(4)) and (not y(3)) and y(2) and (not y(1)) and y(0);
sig6 <= (not y(7)) and (not y(6)) and (not y(5)) and (not y(4)) and (not y(3)) and y(2) and y(1) and (not y(0));
sig7 <= (not y(7)) and (not y(6)) and (not y(5)) and (not y(4)) and (not y(3)) and y(2) and y(1) and y(0); 

z(0) <= sig0 and x(0);
z(1) <= (sig0 and x(1)) or (sig1 and x(0));
z(2) <= (sig0 and x(2)) or (sig1 and x(1)) or (sig2 and x(0));
z(3) <= (sig0 and x(3)) or (sig1 and x(2)) or (sig2 and x(1)) or (sig3 and x(0));
z(4) <= (sig0 and x(4)) or (sig1 and x(3)) or (sig2 and x(2)) or (sig3 and x(1)) or (sig4 and x(0));
z(5) <= (sig0 and x(5)) or (sig1 and x(4)) or (sig2 and x(3)) or (sig3 and x(2)) or (sig4 and x(1)) or (sig5 and x(0));
z(6) <= (sig0 and x(6)) or (sig1 and x(5)) or (sig2 and x(4)) or (sig3 and x(3)) or (sig4 and x(2)) or (sig5 and x(1)) or (sig6 and x(0));
z(7) <= (sig0 and x(7)) or (sig1 and x(6)) or (sig2 and x(5)) or (sig3 and x(4)) or (sig4 and x(3)) or (sig5 and x(2)) or (sig6 and x(1)) or (sig7 and x(0));

end Leftshift;