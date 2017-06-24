library std;
use std.textio.all;

library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.EE224_Components.all;

package GCDCOMPONENTS is
  
--
-- data-register
--    (as discussed in class)
--  
-- to instantiated an 8-bit register use
--   di: dregister generic map (nbits => 8) 
--      port map (din => .., dout => .. , clk => .., enable => ..);
--

component dregister is
  generic (
    nbits : integer);                    -- no. of bits
  port (
    din  : in  std_ulogic_vector(nbits-1 downto 0);
    dout : out std_ulogic_vector(nbits-1 downto 0);
    clk: in std_ulogic;
    enable: in  std_ulogic);
end component;

--
-- combinational unsigned addition
--  (2's complement numbers)
-- A
component unsigned_adder is
  generic ( nbits : integer);
  port ( A : in  std_ulogic_vector(nbits-1 downto 0);
    B : in  std_ulogic_vector(nbits-1 downto 0);
    result   : out std_ulogic_vector(nbits-1 downto 0));
end component;

--
-- combinational unsigned subtractor
--  (2's complement numbers)
-- 
component unsigned_subtractor is
  generic ( nbits : integer);
  port ( A : in  std_ulogic_vector(nbits-1 downto 0);
    B : in std_ulogic_vector(nbits-1 downto 0);
    result   : out std_ulogic_vector(nbits-1 downto 0));
end component;

--
-- combinational comparator
--
component unsigned_comparator is
  generic (
    nbits : integer);
  port (
    a      : in  std_ulogic_vector(nbits-1 downto 0);
    b      : in  std_ulogic_vector(nbits-1 downto 0);
    a_lt_b : out std_ulogic;
    a_eq_b : out std_ulogic;
    a_gt_b : out std_ulogic);
end component;


--
-- synchronous memory.
--
component synch_mem is
   generic (data_width: integer:= 8; addr_width: integer := 8);
   port(din: in std_ulogic_vector(data_width-1 downto 0);
        dout: out std_ulogic_vector(data_width-1 downto 0);
        en: in std_ulogic;
        wrbar: in std_ulogic;
        addrin: in std_ulogic_vector(addr_width-1 downto 0);
        clk: in std_ulogic);
end component;

--
-- Make div_start = 1 to start the division.  When
-- the division is completed, div_done will become 1.
--
component Divider16 is
   port ( divisor: in std_ulogic_vector(15 downto 0);
	  dividend: in std_ulogic_vector(15 downto 0);
 	  quotient: out std_ulogic_vector(15 downto 0);
 	  remainder: out std_ulogic_vector(15 downto 0);
          div_start: in std_ulogic;
	  div_done: out std_ulogic;
          clk: in std_ulogic;
          reset: in std_ulogic);
end component;

end package;

