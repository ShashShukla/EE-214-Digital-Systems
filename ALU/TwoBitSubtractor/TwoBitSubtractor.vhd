entity TwoBitSubtractor is
   port(x1,x0,y1,y0: in bit;
        s1,s0: out bit);
end entity;
architecture Formulas of TwoBitSubtractor is
begin
   s0 <= (y0 xor x0);
   s1 <= (x0 and (not y0)) xor y1 xor x1;
end Formulas;
