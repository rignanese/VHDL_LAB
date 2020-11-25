Library IEEE;
USE IEEE.Std_logic_1164.all;

entity RisingEdge_DFlipFlop_tb is 
end RisingEdge_DFlipFlop_tb;

architecture TB of RisingEdge_DFlipFlop_tb is  
constant c_CLK_PERIOD : time := 10 ns;
signal input:std_logic;
signal output:std_logic;
signal clock:std_logic :='0';

component RisingEdge_DFlipFlop is
   port(
      Q : out std_logic;    
      Clk :in std_logic;   
      D :in  std_logic    
   );
 end component RisingEdge_DFlipFlop;
  
begin  
UUT: RisingEdge_DFlipFlop port map
(
Q=>output,
Clk=>clock,
D=>input
);
clock <= not clock after c_CLK_PERIOD/2;
 input <= '0', '1' after 20 ns, '0' after 40 ns;
end TB; 