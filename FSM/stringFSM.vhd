library std;
use std.textio.all;

library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.EE224_Components.all;

entity stringFSM is 
	port(x: in std_ulogic_vector(6 downto 0);
		z: out std_ulogic);
end entity;

architecture str of stringFSM is

component FSMbomb is 
	port(x: in std_ulogic_vector(6 downto 0);
		z: out std_ulogic);
end component;

component FSMgun is 
	port(x: in std_ulogic_vector(6 downto 0);
		z: out std_ulogic);
end component;

component FSMknife is 
	port(x: in std_ulogic_vector(6 downto 0);
		z: out std_ulogic);
end component;

component FSMterror is 
	port(x: in std_ulogic_vector(6 downto 0);
		z: out std_ulogic);
end component;

signal bomb,gun,knife,terror: std_ulogic;
signal add1,add2: std_ulogic;

begin 

strbomb: FSMbomb port map(x,bomb);
strgun: FSMgun port map(x,gun);
strknife: FSMknife port map(x,knife);
strterror: FSMterror port map(x,terror);

cor1: OR2 port map(bomb,gun,add1);
cor2: OR2 port map(knife,terror,add2);

cz: OR2 port map(add1,add2,z);

end str;

