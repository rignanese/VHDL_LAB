-- clocked_half_adder_tb.vhd

library ieee;
use ieee.std_logic_1164.all;


entity clocked_half_adder_tb is
end clocked_half_adder_tb;

architecture tb of clocked_half_adder_tb is
    signal a, b : std_logic;  -- inputs 
    signal clk: std_logic :='0';
    signal sum, carry : std_logic;  -- outputs
begin
    -- connecting testbench signals with half_adder.vhd
    UUT : entity work.half_adder port map (
	clk =>clk,
	a => a,
	b => b,
	sum => sum,
	carry => carry);
	clk<=not clk after 5 ns;
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
