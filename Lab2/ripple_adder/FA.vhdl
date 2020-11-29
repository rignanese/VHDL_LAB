library ieee;
use ieee.std_logic_1164.all;

entity FA is 
  port (a, b, c_in : in std_logic;
        sum, carry : out std_logic
    );
end FA;

architecture arch of FA is

begin
  sum <= a xor b xor c_in; 
  carry <= (a and b) or (c_in and a) or (c_in and b) ;
end arch;
