library std;
use std.textio.all;

library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.EE224_Components.all;

entity FSMBomb is
	port(x: in std_ulogic_vector(6 downto 0);
		z: out std_ulogic);
end entity;

architecture bomb of FSMbomb is 

component AND7 is
	port(x6,x5,x4,x3,x2,x1,x0: in std_ulogic;
		z: out std_ulogic);
end component;

signal invx4, invx3, invx2, invx1, invx0: std_ulogic; 
signal notr: std_ulogic;
signal b,o,m: std_ulogic;
signal notb,noto,notm: std_ulogic;

signal s2,s1,invs2,invs1: std_ulogic;
signal ns2,ns1: std_ulogic;
signal tns2,tns1: std_ulogic;

signal ts1,ts2,ts3,ts4,ts5,ts6,ts7,ts8: std_ulogic;

begin

cinvx4: INVERTER port map(x(4), invx4);
cinvx3: INVERTER port map(x(3), invx3);
cinvx2: INVERTER port map(x(2), invx2);
cinvx1: INVERTER port map(x(1), invx1);
cinvx0: INVERTER port map(x(0), invx0);

cinvs2: INVERTER port map(s2, invs2);
cinvs1: INVERTER port map(s1, invs1);

calcb: AND7 port map('1','1',invx4,invx3,invx2,x(1),invx0,b);
calco: AND7 port map('1','1',invx4,x(3),x(2),x(1),x(0),o);
calcm: AND7 port map('1','1',invx4,x(3),x(2),invx1,x(0),m);

cnotb: INVERTER port map(b, notb);
cnoto: INVERTER port map(o, noto);
cnotm: INVERTER port map(m, notm);

cnotr: INVERTER port map(x(6), notr);

-- ns2 = (01)(o) + (11) + (10)(not b)
calcts1: AND7 port map(invs2,s1,o,'1','1','1','1',ts1);
calcts2: AND7 port map(s2,invs1,notb,'1','1','1','1',ts2);
calcts7: AND2 port map(s2,s1,ts7);

calcts8: OR2 port map(ts1,ts2,ts8);

ctns2: OR2 port map(ts7,ts8,tns2);
cns2: AND2 port map(notr,tns2,ns2);

-- ns1 = (00)(b) + (01) + (11)(notm)
calcts3: AND7 port map(invs2,invs1,b,'1','1','1','1',ts3);
calcts4: AND7 port map(s2,s1,notm,'1','1','1','1',ts4);
calcts5: AND2 port map(invs2,s1,ts5);

calcts6: OR2 port map(ts3,ts4,ts6);

ctns1: OR2 port map(ts5,ts6,tns1);
cns1: AND2 port map(notr,tns1,ns1);

-- z = (10)(b)
cz: AND7 port map(s2,invs1,b,'1','1','1','1',z);

d2: DFF port map (d => ns2, clk => x(5), q => s2);
d1: DFF port map (d => ns1, clk => x(5), q => s1);

end bomb;
