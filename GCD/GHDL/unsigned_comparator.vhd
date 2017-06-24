-- author: Madhav Desai
-- unsigned comparator with three outputs.
library std;
use std.textio.all;

library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.EE224_Components.all;

entity unsigned_comparator is
  generic (
    nbits : integer);
  port (
    a      : in  std_ulogic_vector(nbits-1 downto 0);
    b      : in  std_ulogic_vector(nbits-1 downto 0);
    a_lt_b : out std_ulogic;
    a_eq_b : out std_ulogic;
    a_gt_b : out std_ulogic);
end unsigned_comparator;

architecture behave  of unsigned_comparator is
begin  -- behave 
  process(a,b)
    variable i,l,e,g,x,y : std_ulogic;
    begin
      l := '0';
      e := '1';
      g := '0';
      for i  in nbits-1 downto 0 loop
         x := a(i) and (not( b(i)) );
         y := not(a(i) xor b(i));
         if( x = '1' and e = '1') then
           g := '1';
           e := '0';
         elsif (y = '0' and e = '1') then
           l := '1';
           e := '0';
         end if;
      end loop;  -- i
      a_lt_b <= l;
      a_gt_b <= g;
      a_eq_b <= e;
   end process;
end behave ;
