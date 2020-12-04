library ieee;
use ieee.std_logic_1164.all;
entity FSM is
	port(
		clk      : in std_logic;
		in_port   : in std_logic;
		reset    : in std_logic;
		out_port   : out std_logic);		
end FSM;

architecture MOORE of FSM is
--STATE_TYPE custom enum type
--define the 4 states of the FSM
type STATE_TYPE is (S0, S1, S2, S3);
--2 states of state type
signal current_state, next_state: STATE_TYPE;

begin
sequential:process (clk, reset)
	begin
		if reset = '1' then
			current_state <= s0;
		elsif (clk'EVENT and clk = '1') then
			current_state <= next_state;
		end if;
	end process;
combinatory :process (current_state, in_port)	
	begin
		case current_state is
			when S0=>
			if in_port = '1' then
			next_state <= S1;
			else
			next_state <= S0;
			end if;
			when S1=>
			if in_port = '1' then
			next_state <= S2;
			else
			next_state <= S0;
			end if;
			when S2=>
			if in_port = '1' then
			next_state <= S3;
			else
			next_state <= S0;
			end if;
			when S3=>
			if in_port = '1' then
			next_state <= S3;
			else
			next_state <= S0;
			end if;
         end case;
      
   end process;
   
OUT_LOGIC: process (current_state)
   BEGIN
      CASE current_state IS
         WHEN s0 =>
            out_port <= '0';
         WHEN s1 =>
            out_port <= '0';
         WHEN s2 =>
            out_port <= '0';
         WHEN s3 =>
            out_port <= '1';
      END CASE;
      
   END PROCESS;
end moore;
   

