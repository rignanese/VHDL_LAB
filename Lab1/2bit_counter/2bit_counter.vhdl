library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity twobit_counter is 
  port (clk, rst: in std_logic;
        count : out std_logic_vector(1 downto 0)
    );
end twobit_counter;

architecture arch of twobit_counter is
signal u_count: unsigned (1 downto 0):="00";
begin
process(clk,rst)
begin
if rst = '1' then

	
	u_count<="00";
	
elsif clk'event and clk='1' then

	u_count <= u_count+1;
	
	if u_count = "11" then
	u_count <= "00";
	end if;
end if;
end process;
count<=std_logic_vector(u_count);
end arch;
