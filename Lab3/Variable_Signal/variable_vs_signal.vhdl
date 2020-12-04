library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity variable_vs_signal is
	port (
		
		i_clk   : in std_logic;
		o_var_done : out std_logic;
		o_sig_done : out std_logic
		
    );
end variable_vs_signal;
 
architecture rtl of variable_vs_signal is
 

  signal r_Count    : natural range 0 to 6 := 0;

 
   
begin

	
	VAR_VS_SIG : process (i_clk)
	variable v_Count : natural range 0 to 6 := 0;
		begin
			if rising_edge(i_clk) then
				v_Count := v_Count + 1;           -- Variable
				r_Count <= r_Count + 1;           -- Signal
			end if;	
				-- Signal Checking

			if r_Count = 6 then
				o_Sig_Done <= '1';
				r_Count    <= 0;
			else
				o_Sig_Done <= '0';
			end if;

				-- Variable Checking
			
			if v_Count = 6 then
				o_Var_Done <= '1';
				v_Count := 0;
			else
				o_Var_Done <= '0';
			end if;
 
		end process VAR_VS_SIG;
	

   
end rtl;
