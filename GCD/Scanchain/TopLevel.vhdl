library ieee;
use ieee.std_logic_1164.all;

--TCLK	Input	PIN_23	1	3.3-V LVTTL (default)		16mA (default)		
--TDI	Input	PIN_5	1	3.3-V LVTTL (default)		16mA (default)		
--TDO	Output	PIN_3	1	3.3-V LVTTL (default)		16mA (default)		
--TMS	Input	PIN_7	1	3.3-V LVTTL (default)		16mA (default)		
--TRST	Input	PIN_21	1	3.3-V LVTTL (default)		16mA (default)		
								

entity TopLevel is
  port (
    TDI : in std_ulogic;  -- Test Data In
    TDO : out std_ulogic;  -- Test Data Out
    TMS : in std_ulogic;  -- TAP controller signal
    TCLK : in std_ulogic;  -- Test clock
    TRST : in std_ulogic  -- Test reset
  );
end TopLevel; 

architecture Struct of TopLevel is
   -- declare DUT component
    component gcd is
        port( 
            din: in std_ulogic_vector(15 downto 0);
            dout: out std_ulogic_vector(15 downto 0);
            start: in std_ulogic;
            done: out std_ulogic;
            erdy: in std_ulogic;
            srdy: out std_ulogic;
            clk: in std_ulogic;
            reset: in std_ulogic);
    end component;
	
   -- declare Scan-chain component.
   component Scan_Chain is
  	generic (
    	in_pins : integer; -- Number of input pins
    	out_pins : integer -- Number of output pins
  	);
  	port (
    	TDI : in std_ulogic;  -- Test Data In
    	TDO : out std_ulogic;  -- Test Data Out
    	TMS : in std_ulogic;  -- TAP controller signal
    	TCLK : in std_ulogic;  -- Test clock
    	TRST : in std_ulogic;  -- Test reset
    	dut_in : out std_ulogic_vector(in_pins-1 downto 0);  -- Input for the DUT
    	dut_out : in std_ulogic_vector(out_pins-1 downto 0)  -- Output from the DUT
  	);
   end component;
   -- declare I/O signals to DUT component
	signal start,done,erdy,srdy: std_ulogic; 
	signal clk,reset: std_ulogic;
	signal din,dout: std_ulogic_vector(15 downto 0);
   -- declare signals to Scan-chain component.
   signal scan_chain_parallel_in : std_ulogic_vector(19 downto 0);
   signal scan_chain_parallel_out: std_ulogic_vector(17 downto 0);
begin
   scan_instance: Scan_Chain
       generic map(in_pins => 20, out_pins => 18)
       port map (TDI => TDI,
                  TDO => TDO,
                  TMS => TMS,
                  TCLK => TCLK,
                  TRST => TRST,
                  dut_in => scan_chain_parallel_in,
                  dut_out => scan_chain_parallel_out);

  dut: gcd
     port map(din=>din, dout=>dout, start=>start, done=>done, erdy=>erdy, srdy=>srdy, clk=>clk, reset=>reset);

   -- connections between DUT and Scan_Chain
	start <= scan_chain_parallel_in(19);
	erdy <= scan_chain_parallel_in(18);
	reset <= scan_chain_parallel_in(17);
	clk <= scan_chain_parallel_in(16);
	din <= scan_chain_parallel_in(15 downto 0);

	scan_chain_parallel_out(17) <= done;
  scan_chain_parallel_out(16) <= srdy;
  scan_chain_parallel_out(15 downto 0) <= dout;
end Struct;
