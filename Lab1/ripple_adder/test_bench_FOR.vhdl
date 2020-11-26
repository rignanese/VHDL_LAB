
--


library ieee;
use ieee.std_logic_1164.all;

--In this version of TB the design
--uses 2 4bit counters as generators
--of the A and B input of the sum


entity ripple_adder_tb is
end ripple_adder_tb;



--In the declaration we put all the
--signals we need: the input output  
--of the DUT and the in-out of the
--2 counters
architecture tb of ripple_adder_tb is
	--DUT signals
	signal a, b  : std_logic_vector(3 downto 0); --input
	signal result : std_logic_vector(4 downto 0);  -- output
	signal c_in : std_logic:='0'; --c_in is set to 0
	
	--Counters signals
	signal clk_1, clk_2, rst : std_logic:='0'; --two different 
	--speed clocks and a reset set to 0	
	signal count_1, count_2 :std_logic_vector(3 downto 0);--the
	--two count output
	
	signal clk_fake: std_logic:='0';--syncro signal
	constant period: time := 2 ns;--clock generator time constant
	
   
begin
        -- connecting testbench signals with half_adder.vhd
	UUT : entity work.ripple_4bit_FA port map (
		c_in=>c_in,
		a => a,
		b => b,
		s => result
		);
	-- connecting testbench stimuli to fourb_counter.vhd
	stim1: entity work.fourb_counter port map (
		clk=>clk_1,
		rst=>rst,
		count=>count_1
		);
	stim2: entity work.fourb_counter port map (
		clk=>clk_2,
		rst=>rst,
		count=>count_2
		);
	-- assert the reset port of the counters for the first ns
	rst<='1', '0' after 1 ns;
	
--Two processes to generate the two input clocks of the counters
--The fast on is in sync with period. 
process
	begin
	clk_1 <= '1';
	wait for period/2;
	clk_1 <='0';
	wait for period/2;
	if NOW > 300 ns then
        wait;
        end if;
end process;
--The slow one is in sync with period*8. 
process
	
	begin
	clk_fake<='1';
	wait for period*8;
	clk_fake <='0';
	wait for period*8;
	if NOW > 300 ns then
        wait;
        end if;
        
end process;
--To have all the possible combinations, the two clocks
--must be sinc with a delay of 16 periods (2^4bit) 
--the transport command introduce an initial delay
--allowing the sincronization. Try different values to
--evaluate the effect 
clk_2<=transport clk_fake after period*16;

--Here the outputs of the counters is connected with the DUT ports
b <= count_1;
a <= count_2;                
          
end tb ;
