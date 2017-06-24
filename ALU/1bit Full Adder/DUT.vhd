-- A DUT entity is used to wrap your design.
--  This example shows how you can do this for the
--  two-bit adder.
library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

entity DUT is
   port(input_vector: in std_logic_vector(2 downto 0); ---Note: for alu testing (17 downto 0) for others (15 downto 0)
       	output_vector: out std_logic_vector(1 downto 0));
end entity;

architecture DutWrap of DUT is

	component fullbitadder is
	port(x,y,cin: in std_logic;
		z,cout: out std_logic);
	end component;  
	--- Add component of eightbitadder 
	--- Add component of eightbitsubtractor 
	--- Add component of leftshift
	--- Add component of rightshift
	

begin

   add_fullbit: fullbitadder
   port map (
   		x => input_vector(2),
   		y => input_vector(1),
   		cin => input_vector(0),
   		z => output_vector(1),
   		cout => output_vector(0));
   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
--a: eightbitadder port map(x => input_vector(15 downto 8), y =>input_vector(7 downto 0) , z=> output_vector);
--b: leftshift	        port map(x => input_vector(15 downto 8), y =>input_vector(7 downto 0) , z=> output_vector); 
--c: rightshift          port map(x => input_vector(15 downto 8), y =>input_vector(7 downto 0) , z=> output_vector); 
--d: eightbitsubtractor  port map(x => input_vector(15 downto 8), y =>input_vector(7 downto 0) , z=> output_vector); --- Note: z = x- y
--dut: alu port map( X => input_vector(15 downto 8), Y => input_vector(7 downto 0) , x0 => input_vector(16) , x1 => input_vector(17), Z => output_vector);
end DutWrap;

