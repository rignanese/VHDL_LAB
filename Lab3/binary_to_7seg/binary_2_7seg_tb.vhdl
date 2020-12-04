library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity binary_2_7seg_tb is
end binary_2_7seg_tb;
 

 
architecture rtl of binary_2_7seg_tb is

	constant clk_period : time  := 10 ns;	
	signal clk: std_logic:='1';
	signal binary_input:  std_logic_vector (3 downto 0);
	signal segment_A, segment_B, segment_C, segment_D, segment_E, segment_F, segment_G : std_logic;
	  	
    	
	begin
	
	clk<= not clk after clk_period/2;
	UUT : entity work.binary_2_7seg port map (
		i_Clk => clk,
		i_Binary_Num => binary_input,
		o_Segment_A => segment_A,
		o_Segment_B => segment_B,
		o_Segment_C => segment_C,
		o_Segment_D => segment_D,
		o_Segment_E => segment_E,
		o_Segment_F => segment_F,
		o_Segment_G => segment_G
		);
	process
	
		begin			
			for i in 0 to 15 loop
				binary_input<=std_logic_vector(to_unsigned(i,4));
				wait for clk_period;
			end loop;
			wait;		
		end process;
	
end rtl;
