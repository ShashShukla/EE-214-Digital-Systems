library std;
use std.textio.all;

library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.EE224_Components.all;

entity FSMTerror is
	port(x: in std_ulogic_vector(6 downto 0);
		z: out std_ulogic);
end entity;

architecture terror of FSMterror is 

component AND7 is
	port(x6,x5,x4,x3,x2,x1,x0: in std_ulogic;
		z: out std_ulogic);
end component;

signal invx4, invx3, invx2, invx1, invx0: std_ulogic; 
signal notrr: std_ulogic;
signal t,e,r,o: std_ulogic;
signal nott,notee,notr,noto: std_ulogic;

signal s3,s2,s1,invs3,invs2,invs1: std_ulogic;
signal ns3,ns2,ns1: std_ulogic;
signal tns3,tns2,tns1: std_ulogic;

signal ts1,ts2,ts3,ts4,ts5,ts6,ts7,ts8,ts9,ts10,ts11,ts12: std_ulogic;

begin

cinvx4: INVERTER port map(x(4), invx4);
cinvx3: INVERTER port map(x(3), invx3);
cinvx2: INVERTER port map(x(2), invx2);
cinvx1: INVERTER port map(x(1), invx1);
cinvx0: INVERTER port map(x(0), invx0);

cinvs3: INVERTER port map(s3, invs3);
cinvs2: INVERTER port map(s2, invs2);
cinvs1: INVERTER port map(s1, invs1);

calct: AND7 port map('1','1',x(4),invx3,x(2),invx1,invx0,t);
calce: AND7 port map('1','1',invx4,invx3,x(2),invx1,x(0),e);
calcr: AND7 port map('1','1',x(4),invx3,invx2,x(1),invx0,r);
calco: AND7 port map('1','1',invx4,x(3),x(2),x(1),x(0),o);

cnott: INVERTER port map(t, nott);
cnote: INVERTER port map(e, notee);
cnotr: INVERTER port map(r, notr);
cnoto: INVERTER port map(o, noto);

cnotrr: INVERTER port map(x(6), notrr);

-- ns3 = (010)(r) + (110) + (100)(not r)
calcts1: AND7 port map(invs3,s2,invs1,r,'1','1','1',ts1);
calcts2: AND7 port map(s3,s2,invs1,'1','1','1','1',ts2);
calcts3: AND7 port map(s3,invs2,invs1,notr,'1','1','1',ts3);

calcts4: OR2 port map(ts1,ts2,ts4);

ctns3: OR2 port map(ts3,ts4,tns3);
cns3: AND2 port map(notrr,tns3,ns3);

-- ns2 = (001)(e) + (011) + (010) + (110)(not o)
calcts5: AND7 port map(invs3,invs2,s1,e,'1','1','1',ts5);
calcts6: AND7 port map(invs3,s2,'1','1','1','1','1',ts6);
calcts7: AND7 port map(s3,s2,invs1,noto,'1','1','1',ts7);

calcts8: OR2 port map(ts5,ts6,ts8);

ctns2: OR2 port map(ts7,ts8,tns2);
cns2: AND2 port map(notrr,tns2,ns2);

-- ns1 = (000)(t) + (001) + (011)(not r)
calcts9: AND7 port map(invs3,invs2,invs1,t,'1','1','1',ts9);
calcts10: AND7 port map(invs3,invs2,s1,'1','1','1','1',ts10);
calcts11: AND7 port map(invs3,s2,s1,notr,'1','1','1',ts11);

calcts12: OR2 port map(ts9,ts10,ts12);

ctns1: OR2 port map(ts11,ts12,tns1);
cns1: AND2 port map(notrr,tns1,ns1);

-- z = (100)(r)
cz: AND7 port map(s3,invs2,invs1,r,'1','1','1',z);


d3: DFF port map (d => ns3, clk => x(5), q => s3);
d2: DFF port map (d => ns2, clk => x(5), q => s2);
d1: DFF port map (d => ns1, clk => x(5), q => s1);

end terror;
