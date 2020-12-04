library ieee;
use ieee.std_logic_1164.all;

entity FSM_tb is
end FSM_tb;

architecture behav of FSM_tb is
constant clk_period : time  := 10 ns;
signal clk : std_logic:='1';
signal reset : std_logic;
signal in_port : std_logic;
signal out_port : std_logic;	



begin
	clk<= not clk after clk_period/2;
	UUT : entity work.FSM port map (
		clk => clk,
		in_port => in_port,
		reset => reset,
		out_port => out_port
		);
		
	process
	begin
	in_port<='0';
	reset <= '1';
	wait for clk_period;
	reset <= '0';
	wait for clk_period/2;
	in_port<='1';
	wait for clk_period;
	in_port<='0';
	wait for clk_period;
	in_port<='1';
	wait for clk_period;
	in_port<='1';
	wait for clk_period;
	in_port<='0';
	wait for clk_period;
	in_port<='1';
	wait for clk_period;
	in_port<='1';
	wait for clk_period;
	in_port<='1';
	wait for clk_period;
	in_port<='1';
	wait for clk_period;
	in_port<='0';
	wait for clk_period;
	in_port<='1';
	wait for clk_period;
	in_port<='1';
	wait for clk_period;
	in_port<='1';
	wait for clk_period;
	in_port<='1';
	wait for clk_period;
	in_port<='1';
	wait;	
	end process;
end behav;

