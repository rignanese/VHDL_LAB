library ieee;
use ieee.std_logic_1164.all;

entity ripple_2bit_FA is 
  port (
  	a, b : in std_logic_vector (1 downto 0);
  	c_in : in std_logic;
        s : out std_logic_vector (2 downto 0)
    );
end ripple_2bit_FA;

architecture arch of ripple_2bit_FA is

signal c:std_logic_vector (2 downto 0);
signal sum:std_logic_vector (1 downto 0);



begin
c(0)<=c_in;
Full_adder1 : entity work.FA port map (
    	a => a(0),
    	b => b(0),
    	c_in => c(0),
	sum => sum(0),
	carry => c(1)
	);
Full_adder2 : entity work.FA port map (
    	a => a(1),
    	b => b(1),
    	c_in => c(1),
	sum => sum(1),
	carry => c(2)
	);

s<=c(2) & sum;
end arch;
