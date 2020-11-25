-- half_adder_tb.vhd

library ieee;
use ieee.std_logic_1164.all;


entity half_adder_tb is
end half_adder_tb;

architecture tb of half_adder_tb is
    signal a, b : std_logic;  -- inputs 
    signal sum, carry : std_logic;  -- outputs
begin
    -- connecting testbench signals with half_adder.vhd
    UUT : entity work.half_adder port map (
	a => a,
	b => b,
	sum => sum,
	carry => carry);
tb1 : process
        constant period: time := 20 ns;
        begin
            a <= '0';
            b <= '0';
            wait for period;
            a <= '0';
            b <= '1';
            wait for period;
            a <= '1';
            b <= '0';
            wait for period;
            a <= '1';
            b <= '1';
            wait for period;
            wait; -- indefinitely suspend process
        end process;
end tb ;
