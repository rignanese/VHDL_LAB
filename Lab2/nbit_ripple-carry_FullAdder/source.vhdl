library ieee;
use ieee.std_logic_1164.all;

entity ripple_carry_adder is
  generic (
    WIDTH : natural := 10
    );
  port (
    in_A  : in std_logic_vector(WIDTH downto 0);
    in_B  : in std_logic_vector(WIDTH downto 0);
    --
    result   : out std_logic_vector(WIDTH+1 downto 0)
    );
end ripple_carry_adder;
 
 
architecture rtl of ripple_carry_adder is

 
  signal C : std_logic_vector(WIDTH+1 downto 0);
  signal SUM   : std_logic_vector(WIDTH downto 0);
 
   
begin
 
  C(0) <= '0';                    -- no carry input on first full adder
   
  SET_WIDTH : for ii in 0 to WIDTH generate
    i_FULL_ADDER_INST : entity work.FA 
      port map (
        a  => in_A(ii),
        b  => in_B(ii),
        c_in => C(ii),
        sum   => SUM(ii),
        carry => C(ii+1)
        );
  end generate SET_WIDTH;
 
  result <= C(WIDTH) & SUM;  -- VHDL Concatenation
   
end rtl;
