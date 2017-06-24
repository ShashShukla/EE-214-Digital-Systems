library std;
use std.textio.all;

library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

entity LeftMostOne is
	port (b15,b14,b13,b12,b11,b10,b9,b8,b7,b6,b5,b4,b3,b2,b1,b0: in std_ulogic;
			s3,s2,s1,s0: out std_ulogic);
end entity;

architecture LeftMost of LeftMostOne is 

component counter is 
	port(x: in std_ulogic_vector(3 downto 0); y: in std_ulogic;
		z: out std_ulogic_vector(3 downto 0));
end component;

signal t16,t15,t14,t13,t12,t11,t10,t9,t8,t7,t6,t5,t4,t3,t2,t1,t0: std_ulogic_vector(3 downto 0);

begin 

t0(3) <= '0';
t0(2) <= '0';
t0(1) <= '0';
t0(0) <= '0'; 

count1: counter port map(t0, b0, t1);
count2: counter port map(t1, b1, t2);
count3: counter port map(t2, b2, t3);
count4: counter port map(t3, b3, t4);
count5: counter port map(t4, b4, t5);
count6: counter port map(t5, b5, t6);
count7: counter port map(t6, b6, t7);
count8: counter port map(t7, b7, t8);
count9: counter port map(t8, b8, t9);
count10: counter port map(t9, b9, t10);
count11: counter port map(t10, b10, t11);
count12: counter port map(t11, b11, t12);
count13: counter port map(t12, b12, t13);
count14: counter port map(t13, b13, t14);
count15: counter port map(t14, b14, t15);
count16: counter port map(t15, b15, t16);

s3 <= t16(3);
s2 <= t16(2);
s1 <= t16(1);
s0 <= t16(0);

end LeftMost;