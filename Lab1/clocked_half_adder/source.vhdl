library ieee;
use ieee.std_logic_1164.all;

entity half_adder is 
  port (a, b, clk : in std_logic;
        sum, carry : out std_logic
    );
end half_adder;

architecture arch of half_adder is
begin
process(clk)
begin
if(rising_edge(clk)) then
  sum <= a xor b;
  carry <= a and b;
end if;
end process;
end arch;
