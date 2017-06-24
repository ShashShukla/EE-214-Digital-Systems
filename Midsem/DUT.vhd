library ieee;
use ieee.std_logic_1164.all;

entity DUT is
 port(input_vector: in std_ulogic_vector(15 downto 0);    
	output_vector: out std_ulogic_vector(3 downto 0));
end entity;


architecture WRAP of DUT is
  
component LeftMostOne 
port (b15,b14,b13,b12,b11,b10,b9,b8,b7,b6,b5,b4,b3,b2,b1,b0: in std_ulogic;
    s3,s2,s1,s0: out std_ulogic);
end component;

signal i: std_ulogic_vector(15 downto 0);
signal o: std_ulogic_vector(3 downto 0);

begin

i <= input_vector;

left: LeftMostOne port map(i(15),i(14),i(13),i(12),i(11),i(10),i(9),i(8),i(7),i(6),i(5),i(4),i(3),i(2),i(1),i(0),o(3),o(2),o(1),o(0));

output_vector <= o;
end WRAP;
