library std;
use std.textio.all;

library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

entity nxor is
   port(x1,x0: in std_logic; s0: out std_logic);
end entity;

architecture define of nxor is
begin
   s0 <= (x0 and (not x1)) or (x1 and (not x0));
end define;
