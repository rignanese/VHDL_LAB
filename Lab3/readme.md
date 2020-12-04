# Binary to 7-segment display


[Wikipedia 7-semgent display](https://en.wikipedia.org/wiki/Seven-segment_display)

In this excercise we will create a 7-segment display driver that allows a 4bit binary number to be displayed.

## Implemenation

- Create a new folder and start a new VHDL file declaring the entity to have 2 inputs (clk, binary input (3..0)) and 7 single bit output, one for each segment
- The idea is to encode the binary input number following the exadecimal scheme of the table (abcdefg)
- Even though we have 7 segments, we have to encode 8bit codes. For compactness we can put all these values in a single 8bit vector that has to be declared in the architecture
- We can use the case-when statement incapsulated in a process sensitive to the clock and the binary input
- With the case statement, we can describe all the possible combinations
```
 process (i_Clk, i_Binary_Num) is
  begin
    if rising_edge(i_Clk) then
      case i_Binary_Num is
        when "0000" => -- 0
          r_Hex_Encoding <= X"7E"; -- 0111 1110
        when "0001" => -- 1
          r_Hex_Encoding <= X"30"; -- 0011 0000
        when "0010" => -- 2
        ...
        ...
        when others => r_Hex_Encoding <= (others => 'X');
```
- now we can end the case, the if (clk) and the process
- As concurrent statemennt now, we have to assign the 7 outputs to each element of the r_Hex_Encoding vector
```
o_Segment_A <= r_Hex_Encoding(6);
o_Segment_B <= r_Hex_Encoding(5);
o_Segment_C <= r_Hex_Encoding(4);
...
```
- The r_Hex_Encoding(7) is left unused.


  
