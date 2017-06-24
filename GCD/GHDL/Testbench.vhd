-- Author: Madhav Desai
-- a test-bench for the GCD system.
--library work;
--use work.base_components.all;
library ieee;
use ieee.std_logic_1164.all;
library std;
use std.textio.all;

entity test_bench is
end test_bench;



-- read a file: gcd_inputs.txt and run the gcd algorithm..
-- and compare with the result from file gcd_result.txt
architecture behave of test_bench is

    -- system being tested.
    component gcd is
        port ( din: in std_ulogic_vector(15 downto 0);
     	       dout: out std_ulogic_vector(15 downto 0);
               start: in std_ulogic;
    	       done: out std_ulogic;
    	       erdy: in std_ulogic;
               srdy: out std_ulogic;
               clk: in std_ulogic;
               reset: in std_ulogic);
    end component;

    signal din, dout:  std_ulogic_vector(15 downto 0);
    signal clk, reset, start, done, erdy, srdy, over : std_ulogic := '0';

    file stimulus_file: text open read_mode is "C:/Users/Shashwat/Desktop/GHDL/gcd_inputs.txt";
    file result_file: text open write_mode is "C:/Users/Shashwat/Desktop/GHDL/gcd_result.txt";

	function to_string(x: string) return string is
	    variable ret_val: string(1 to x'length);
	    alias lx : string (1 to x'length) is x;
	begin  
	    ret_val := lx;
	    return(ret_val);
	end to_string;
  
begin

    -- 10 ns clock.
    clk <= ((not clk) and over) after 5 ns;
  
    process
        variable L: line;
        variable next_number: bit_vector(15 downto 0);
        variable counter: integer;
        variable flag: bit;
    begin
    	over <= '1';
    	flag := '0';
        counter := 0;
        reset <= '1';
        start <= '0';
        erdy  <= '0';
        
        while( not endfile(stimulus_file)) loop
            readline(stimulus_file,L);
	        wait until clk = '1';
	        reset <= '0';

	        start <= '1';
	        wait until clk = '1';
	        start <= '0';
            for i in 0 to 15 loop
	            read(L,next_number);
	            din <= to_stdulogicvector(next_number);
	            erdy <= '1';
	            while true loop
	                wait until clk = '1';
	                if(srdy = '1') then
	                    exit;
	                end if;
	            end loop;
	            --assert false report "Sent item " severity note;
            end loop ;

	        wait for 0 ns;
	        erdy <= '0';
	        --assert false report "Sent all items " severity note;

	        read(L,next_number);
	        while true loop
	            wait until clk = '1';
	            if(done = '1') then
	                exit;
	            end if;
	            wait for 1 ns;
	        end loop;

	        --assert false report "Received done " severity note;
	        if(dout = to_stdulogicvector(next_number)) then
	            write(L, to_string("SUCCESS"));
	        else
	            write(L, to_string("FAILURE"));
	            flag := '1';
	        end if;
	        writeline(result_file,L);
        end loop;
-------------------------------------------------------------------------------------------------------------------
        if(flag = '0') then
            assert false report "SUCCESS: got the correct GCDs." severity note;
        else
            assert false report "FAILURE: some incorrect GCDs! " severity ERROR;
        end if;

        over <= '0';
        wait;
    end process;


  --  instantiate the system..
  sys: gcd port map(din => din, dout => dout, erdy => erdy, srdy => srdy, start => start, done => done, clk=> clk, reset => reset);
  
  
end behave;