library ieee;
use ieee.std_logic_1164.all;

entity DUT is
 port(input_vector: in std_ulogic_vector(6 downto 0);    
	output_vector: out std_ulogic_vector(0 downto 0));
end entity;


architecture WRAP of DUT is
  component stringFSM is
    port(x: in std_ulogic_vector(6 downto 0);
      z: out std_ulogic);
  end component;

  signal r,w,clk: std_ulogic;
  signal x: std_ulogic_vector(6 downto 0);

begin
   
  x <= input_vector;
  output_vector(0) <= w;

  fsm: stringFSM
		port map (x => x, z => w);

end WRAP;
