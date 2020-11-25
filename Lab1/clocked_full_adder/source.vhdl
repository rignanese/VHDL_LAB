library ieee;
use ieee.std_logic_1164.all;

entity full_adder is 
  port (a, b, clk, c_in : in std_logic;
        sum, carry : out std_logic
    );
end full_adder;

architecture arch of full_adder is

begin
process(clk)
begin
if(rising_edge(clk)) then
  sum <= a xor b xor c_in; 
  carry <= (a and b) or (c_in and a) or (c_in and b) ;
end if;
end process;
end arch;
