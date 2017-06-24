-- author: Madhav Desai
-- register with synchronous enable 
library std;
use std.textio.all;

library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.EE224_Components.all;
use work.GCDCOMPONENTS.all;

entity dregister is
  generic (
    nbits : integer);                    -- no. of bits
  port (
    din  : in  std_ulogic_vector(nbits-1 downto 0);
    dout : out std_ulogic_vector(nbits-1 downto 0);
    enable: in std_ulogic;
    clk     : in  std_ulogic);
end dregister;

architecture behave of dregister is

begin  -- behave
process(clk)
begin 
  if(clk'event and clk = '1') then
    if enable = '1' then
      dout <= din;
    end if;
  end if;
end process;
end behave;
