library std;
use std.textio.all;

library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.EE224_Components.all;

entity register16 is
	port (clk,enable : in std_ulogic;  
		input_vector : in std_ulogic_vector(15 downto 0); output_vector : out std_ulogic_vector(15 downto 0));
end entity;

architecture behave of register16 is

component bitreg is
port (clk, enable, d : in std_ulogic; o : out std_ulogic);
end component;

begin

g1	:bitreg port map (clk,enable,input_vector(0),output_vector(0));
g2	:bitreg port map (clk,enable,input_vector(1),output_vector(1));
g3	:bitreg port map (clk,enable,input_vector(2),output_vector(2));
g4	:bitreg port map (clk,enable,input_vector(3),output_vector(3));
g5	:bitreg port map (clk,enable,input_vector(4),output_vector(4));
g6	:bitreg port map (clk,enable,input_vector(5),output_vector(5));
g7	:bitreg port map (clk,enable,input_vector(6),output_vector(6));
g8	:bitreg port map (clk,enable,input_vector(7),output_vector(7));
g9	:bitreg port map (clk,enable,input_vector(8),output_vector(8));
g10	:bitreg port map (clk,enable,input_vector(9),output_vector(9));
g11	:bitreg port map (clk,enable,input_vector(10),output_vector(10));
g12	:bitreg port map (clk,enable,input_vector(11),output_vector(11));
g13	:bitreg port map (clk,enable,input_vector(12),output_vector(12));
g14	:bitreg port map (clk,enable,input_vector(13),output_vector(13));
g15	:bitreg port map (clk,enable,input_vector(14),output_vector(14));
g16	:bitreg port map (clk,enable,input_vector(15),output_vector(15));

end behave;
