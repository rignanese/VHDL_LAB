library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity test_bench is
end test_bench;

architecture tb of test_bench is
    signal rst, clk : std_logic :='0';  -- inputs 
    signal count : std_logic_vector(1 downto 0);  -- output
    constant period: time := 10 ns;
begin
    -- connecting testbench signals with half_adder.vhd
    UUT : entity work.twobit_counter port map (
    	clk=>clk,
	rst => rst,
	count => count);
	
	clk <= not clk after period/2;
	rst<='1', '0' after 20 ns;

end tb ;
