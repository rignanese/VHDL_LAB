library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity RAM8x32 is
port (
		
		i_clk   : in std_logic;
		i_wen   : in std_logic;
		i_ren   : in std_logic;
		i_data : in std_logic_vector (7 downto 0); --8bit
		i_adress : in std_logic_vector (4 downto 0); --32 adresses
		o_data : out std_logic_vector (7 downto 0) --8bit
		
    );
end RAM8x32;
 

 
architecture rtl of RAM8x32 is

	TYPE mem IS ARRAY(0 TO 31) OF std_logic_vector(7 DOWNTO 0);
	SIGNAL ram_block : mem:= (others => (others =>'0'));
    
begin
	mem_write: process (i_clk)
	
		begin
			if i_clk'event and i_clk ='1' then
				if (i_wen ='1') then
					ram_block(to_integer(unsigned(i_adress)))<=i_data;
				end if;
			end if;
			
		end process;
		
		mem_read: process (i_clk)
	
		begin
			if i_clk'event and i_clk ='1' then
				if (i_ren ='1') then
					o_data<=ram_block(to_integer(unsigned(i_adress)));
				end if;
			end if;
			
		end process;
		
	
end rtl;
