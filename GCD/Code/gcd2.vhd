library std;
use std.textio.all;

library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.EE224_Components.all;
use work.GCDCOMPONENTS.all;

entity gcd2 is 
	port(clk,reset,gcd2_start: in std_ulogic; gcd2_done: out std_ulogic;
		a,b: in std_ulogic_vector(15 downto 0); o: out std_ulogic_vector(15 downto 0));
end entity;

architecture twogcd of gcd2 is

component Divider16 is
   port ( divisor: in std_ulogic_vector(15 downto 0); dividend: in std_ulogic_vector(15 downto 0);
 	        quotient: out std_ulogic_vector(15 downto 0); remainder: out std_ulogic_vector(15 downto 0);
          div_start: in std_ulogic; div_done: out std_ulogic;
          clk: in std_ulogic; reset: in std_ulogic);
end component;

component register16 is
	port (clk,enable : in std_ulogic;  
		  input_vector : in std_ulogic_vector(15 downto 0);
	 	  output_vector : out std_ulogic_vector(15 downto 0));
end component;

component MUX16 is
	port (a,b: in std_ulogic_vector(15 downto 0); 
		e: in std_ulogic; 
		o: out std_ulogic_vector(15 downto 0));
end component;

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

signal s1,s2,ns1,ns2: std_ulogic;
signal l,m,n: std_ulogic; --States of the FSM

signal divisor,dividend: std_ulogic_vector(15 downto 0); --Inputs to the divider
signal quotient,remainder: std_ulogic_vector(15 downto 0); --Outputs of the divider
signal div_start, div_done: std_ulogic;

signal rega, regb: std_ulogic_vector(15 downto 0); --Input to the two registers
signal en: std_ulogic;

signal low,high,check: std_ulogic;
constant zero: std_ulogic_vector := "0000000000000000";

begin 

l <= (not s2) and (not s1);
m <= (not s2) and (s1);
n <= (s2) and (not s1);

ns2 <= ((n and (not div_done)) or (m and (not check))) and (not reset);
ns1 <= ((gcd2_start and l) or (n and div_done)) and (not reset);

muxa: MUX16 port map(a,divisor,l,rega); 
muxb: MUX16 port map(b,remainder,l,regb);

en <= (l and gcd2_start) or (n and div_done);

reg1: register16 port map(clk,en,rega,dividend); --For the dividend
reg2: register16 port map(clk,en,regb,divisor);  --For the divisor

checkdiv: unsigned_comparator generic map (nbits => 16 ) port map(divisor,zero,low,check,high); --Check if the divisor is zero

div_start <= m and (not check);

divide: Divider16 port map(divisor,dividend,quotient,remainder,div_start,div_done,clk,'0');

o <= dividend;
gcd2_done <= m and check;

d2: DFF port map (d => ns2, clk => clk, q => s2);
d1: DFF port map (d => ns1, clk => clk, q => s1); 

end twogcd;