
library ieee;
use ieee.std_logic_1164.all;


entity ripple_adder_tb is
end ripple_adder_tb;

architecture tb of ripple_adder_tb is
    signal a, b, count_1, count_2 :std_logic_vector(1 downto 0);
    signal c_in, clk_1, clk_2, rst : std_logic:='0';  -- inputs 
    signal result : std_logic_vector(2 downto 0);  -- output
    constant period: time := 10 ns;
   
begin
        -- connecting testbench signals with half_adder.vhd
	UUT : entity work.ripple_2bit_FA port map (
		c_in=>c_in,
		a => a,
		b => b,
		s => result
		);
	stim1: entity work.twobit_counter port map (
		clk=>clk_1,
		rst=>rst,
		count=>count_1
		);
	stim2: entity work.twobit_counter port map (
		clk=>clk_2,
		rst=>rst,
		count=>count_2
		);
	rst<='1', '0' after 1 ns;
process
	begin
	clk_1 <= '1';
	wait for period/2;
	clk_1 <='0';
	wait for period/2;
end process;
process
	begin
	wait until a(1)='1';
	clk_2 <= '0';
	wait for period*2;
	clk_2 <='1';
	wait for period*2;
end process;
	
  	 a <= count_1;
         b <= count_2;                
          
end tb ;
