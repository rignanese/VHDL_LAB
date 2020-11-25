-- full_adder_tb.vhd

library ieee;
use ieee.std_logic_1164.all;


entity full_adder_tb is
end full_adder_tb;

architecture tb of full_adder_tb is
    signal a, b, c_in : std_logic;  -- inputs 
    signal sum, carry : std_logic;  -- outputs
begin
    -- connecting testbench signals with half_adder.vhd
    UUT : entity work.full_adder port map (
    	c_in=>c_in,
	a => a,
	b => b,
	sum => sum,
	carry => carry);
tb1 : process
        constant period: time := 10 ns;
        begin
            a <= '0';
            b <= '0';
            c_in <= '0';
            wait for period;
            a <= '1';
            b <= '0';
            c_in <= '0';
            wait for period;
            a <= '0';
            b <= '1';
            c_in <= '0';
            wait for period;
            a <= '1';
            b <= '1';
            c_in <= '0';
            wait for period;
            a <= '0';
            b <= '0';
            c_in <= '1';
            wait for period;
            a <= '1';
            b <= '0';
            c_in <= '1';
            wait for period;  
            a <= '1';
            b <= '1';
            c_in <= '1';
            wait for period;            
            wait; -- indefinitely suspend process
        end process;
end tb ;
