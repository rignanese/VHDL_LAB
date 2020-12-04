library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity RAM8x32_tb is
end RAM8x32_tb;
 

 
architecture rtl of RAM8x32_tb is

	constant clk_period : time  := 10 ns;	
	
	signal clk:  std_logic:='0';
	signal wen, ren:  std_logic:='0';
	signal data_in:  std_logic_vector (7 downto 0);
	signal adress:  std_logic_vector (4 downto 0);
	signal data_out:  std_logic_vector (7 downto 0);
	
    	
    	
    	
    	
begin
	
	clk<= not clk after clk_period/2;
	UUT : entity work.RAM8x32 port map (
		i_clk => clk,
		i_ren => ren,
		i_wen => wen,
		i_data => data_in,
		i_adress => adress,
		o_data => data_out
		);
	process
	
		begin
			
			wen<='0';
			adress <= "00000";
			data_in <= x"FF";
			wait for clk_period;
			ren<='1';
			wait for clk_period;
			ren<= '0';
			wait for clk_period;
			wen<='1';
			for i in 0 to 31 loop
				adress<=std_logic_vector(to_unsigned(i,5));
				data_in<=std_logic_vector(to_unsigned(i+10,8));
				wait for clk_period;
			end loop;
			wen<='0';
			ren<='1';
			wait for clk_period;
			for i in 31 downto 0 loop
				adress<=std_logic_vector(to_unsigned((i),5));
				wait for clk_period;
			end loop;			
			wait;
			
		end process;
	
end rtl;
