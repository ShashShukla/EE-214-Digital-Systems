library std;
use std.textio.all;

library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.EE224_Components.all;
use work.GCDCOMPONENTS.all;

entity gcd is 
	port(din: in std_ulogic_vector(15 downto 0);
		dout: out std_ulogic_vector(15 downto 0);
		start: in std_ulogic; done: out std_ulogic;
		erdy: in std_ulogic; srdy: out std_ulogic;
		clk: in std_ulogic; reset: in std_ulogic);
end entity;

architecture gcd16 of gcd is

component gcd2 is 
	port(clk,reset,gcd2_start: in std_ulogic; gcd2_done: out std_ulogic;
		a,b: in std_ulogic_vector(15 downto 0); o: out std_ulogic_vector(15 downto 0));
end component;

component register16 is
	port (clk,enable : in std_ulogic;  
		input_vector : in std_ulogic_vector(15 downto 0);
	 	output_vector : out std_ulogic_vector(15 downto 0));
end component;

component MUX16 is
	port (a,b: in std_ulogic_vector(15 downto 0); 
		e: in std_ulogic ; 
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

signal s2,s1,ns2,ns1: std_ulogic; 
signal sa,sb,sc,sd: std_ulogic; --States of the FSM

signal rega, regb: std_ulogic_vector(15 downto 0); --Input to the registers
signal ena, enb: std_ulogic; --Enable signals for the registers
signal a,b,o: std_ulogic_vector(15 downto 0); --Inputs and outputs for gcd2
signal gcd2_start, gcd2_done: std_ulogic; 
signal count, countInput,countUpdate: std_ulogic_vector(15 downto 0); --Counter
signal low,equal,high: std_ulogic; --Comparator signals

begin

sa <= (not s2) and (not s1);
sb <= (not s2) and (s1);
sc <= (s2) and (not s1);
sd <= (s2) and (s1);

ns2 <= ((sb and erdy) or sc or (sd and gcd2_done and (not equal)) or (sd and (not gcd2_done))) and (not reset);
ns1 <= ((sa and start) or (sb and (not erdy)) or (sc and erdy) or (sd and (not gcd2_done))) and (not reset);

gc: gcd2 port map (clk,reset,gcd2_start,gcd2_done,a,b,o);

ena <= (sb and erdy) or (sd and gcd2_done and (not equal));
enb <= (sc and erdy);

mux1: MUX16 port map(din,o,sb,rega);
mux2: MUX16 port map ("1111111111111100",countUpdate,sb,countInput);

regb <= din;

countUpdate(15 downto 1) <= count(14 downto 0);
countUpdate(0) <= '0';

reg1: register16 port map(clk,ena,rega,a);
reg2: register16 port map(clk,enb,regb,b); 
reg3: register16 port map (clk, ena, countInput, count);

comp: unsigned_comparator generic map (nbits => 16 ) port map (count,"0000000000000000",low,equal,high); 

gcd2_start <= sd;

srdy <= sb or sc;
done <= (sd and gcd2_done and equal);
dout <= o;

d2: DFF port map (d => ns2, clk => clk, q => s2);
d1: DFF port map (d => ns1, clk => clk, q => s1); 

end gcd16;