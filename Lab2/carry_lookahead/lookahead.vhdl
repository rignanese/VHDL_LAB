library ieee;
use ieee.std_logic_1164.all;

entity lookahead_4bit_FA is 
  port (
  	a, b : in std_logic_vector (3 downto 0);
  	c_in : in std_logic;
        s : out std_logic_vector (4 downto 0)
    );
end lookahead_4bit_FA;

architecture arch of lookahead_4bit_FA is


signal G:std_logic_vector (3 downto 0);
signal P:std_logic_vector (3 downto 0);
signal c:std_logic_vector (4 downto 0);
signal sum:std_logic_vector (3 downto 0);



begin
	
	Full_adder1 : entity work.FA port map (
    		a => a(0),
    		b => b(0),
    		c_in => c(0),
		sum => sum(0),
		carry => open
		);
	Full_adder2 : entity work.FA port map (
    		a => a(1),
    		b => b(1),
    		c_in => c(1),
		sum => sum(1),
		carry => open
		);
	Full_adder3 : entity work.FA port map (
    		a => a(2),
    		b => b(2),
    		c_in => c(2),
		sum => sum(2),
		carry => open
		);
	Full_adder4 : entity work.FA port map (
    		a => a(3),
    		b => b(3),
    		c_in => c(3),
		sum => sum(3),
		carry => open
		);
	--Generate Vector: Gi=Ai*Bi
	
	G(0)<=a(0) and b(0);
	G(1)<=a(1) and b(1);
	G(2)<=a(3) and b(2);
	G(3)<=a(3) and b(3);
	
	--Propagate Vector: Gi=Ai+Bi
	
	P(0)<=a(0) or b(0);
	P(1)<=a(1) or b(1);
	P(2)<=a(3) or b(2);
	P(3)<=a(3) or b(3);
	
	--Carry logic
	
	c(0)<=c_in;
	c(1)<=G(0) or (P(0) and c(0));
	c(2)<=G(1) or (P(1) and c(1));
	c(3)<=G(2) or (P(2) and c(2));
	c(4)<=G(3) or (P(3) and c(3));
	
	
	s<=c(4) & sum;
end arch;
