
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--In this version of TB the design
--uses 2 for-loop cycle to generate
--the A and B input of the sum



entity ripple_adder_tb is
end ripple_adder_tb;

--In the declaration we put all the
--signals we need: the input output  
--of the DUT, and a time definition
architecture tb of ripple_adder_tb is
    signal a, b :std_logic_vector(3 downto 0);--input
    signal c_in : std_logic:='0';  --input
    signal result : std_logic_vector(4 downto 0);  -- output
    constant period: time := 1 ns; --time constant
   
begin
        -- connecting testbench signals with half_adder.vhd
	UUT : entity work.ripple_4bit_FA port map (
		c_in=>c_in,
		a => a,
		b => b,
		s => result
		);
process
--two concatenated for-loops generate all the addend combinations 
	begin
	for ia in 0 to 15 loop
		a<=std_logic_vector(to_unsigned(ia,4));
		for ib in 0 to 15 loop	
			b<=std_logic_vector(to_unsigned(ib,4));
			wait for period;
		end loop;
	end loop;
end process;
             
          
end tb ;
