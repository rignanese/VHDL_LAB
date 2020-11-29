library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fourb_counter is 
  port (clk, rst: in std_logic;
        count : out std_logic_vector(3 downto 0)
    );
end fourb_counter;

architecture arch of fourb_counter is
signal u_count: unsigned (3 downto 0):="0000";
begin
process(clk,rst)
begin
if rst = '1' then

	
	u_count<="0000";
	
elsif clk'event and clk='1' then

	u_count <= u_count+1;
	
	if u_count = "1111" then
	u_count <= "0000";
	end if;
end if;
end process;
count<=std_logic_vector(u_count);
end arch;
