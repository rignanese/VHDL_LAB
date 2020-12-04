library ieee;
use ieee.std_logic_1164.all;
 
entity binary_2_7seg is
  port (
    i_Clk        : in  std_logic;
    i_Binary_Num : in  std_logic_vector(3 downto 0);
    o_Segment_A  : out std_logic;
    o_Segment_B  : out std_logic;
    o_Segment_C  : out std_logic;
    o_Segment_D  : out std_logic;
    o_Segment_E  : out std_logic;
    o_Segment_F  : out std_logic;
    o_Segment_G  : out std_logic
    );
end entity binary_2_7seg;
 
architecture RTL of binary_2_7seg is
 
  signal r_Hex_Encoding : std_logic_vector(7 downto 0) := (others => '0');
   
begin
 
  -- Purpose: Creates a case statement for all possible input binary numbers.
  -- Drives r_Hex_Encoding appropriately for each input combination.
  process (i_Clk, i_Binary_Num) is
  begin
    if rising_edge(i_Clk) then
      case i_Binary_Num is
        when "0000" => -- 0
          r_Hex_Encoding <= X"7E"; -- 0111 1110
        when "0001" => -- 1
          r_Hex_Encoding <= X"30"; -- 0011 0000
        when "0010" => -- 2
          r_Hex_Encoding <= X"6D"; -- 0110 1101
        when "0011" => -- 3
          r_Hex_Encoding <= X"79"; -- 0111 1001
        when "0100" => -- 4
          r_Hex_Encoding <= X"33"; -- 0011 0000          
        when "0101" => -- 5
          r_Hex_Encoding <= X"5B"; -- 0101 1011
        when "0110" => -- 6
          r_Hex_Encoding <= X"5F"; -- 0101 1111
        when "0111" => -- 7
          r_Hex_Encoding <= X"70"; -- 0111 0000
        when "1000" => -- 8
          r_Hex_Encoding <= X"7F"; -- 0111 1111
        when "1001" => -- 9
          r_Hex_Encoding <= X"7B"; -- 0111 1011
        when "1010" => -- A
          r_Hex_Encoding <= X"77"; -- 0111 0111
        when "1011" => -- b
          r_Hex_Encoding <= X"1F"; -- 0001 1111
        when "1100" => -- C
          r_Hex_Encoding <= X"4E"; -- 0100 1110
        when "1101" => -- d
          r_Hex_Encoding <= X"3D"; -- 0011 1101
        when "1110" => -- E
          r_Hex_Encoding <= X"4F"; -- 0100 1111
        when "1111" => -- F
          r_Hex_Encoding <= X"47"; -- 0100 0111
        when others => r_Hex_Encoding <= (others => 'X');
      end case;
    end if;
  end process;
 
  -- r_Hex_Encoding(7) is unused
  o_Segment_A <= r_Hex_Encoding(6);
  o_Segment_B <= r_Hex_Encoding(5);
  o_Segment_C <= r_Hex_Encoding(4);
  o_Segment_D <= r_Hex_Encoding(3);
  o_Segment_E <= r_Hex_Encoding(2);
  o_Segment_F <= r_Hex_Encoding(1);
  o_Segment_G <= r_Hex_Encoding(0);
 
end architecture RTL;
