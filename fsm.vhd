library ieee;
use ieee.std_logic_1164.all;
entity fsm is
	port
	(	
		clk : in std_logic;
		data_in : in std_logic;
		reset : in std_logic;
		student_id : out std_logic_vector (3 downto 0);
		current_state: out std_logic_vector (3 DOWNTO 0)
	);
end entity;

architecture fsm of fsm is
	-- Build an enumerated type with 9 states for
	--the state machine ( 9 states for parsing 9 digits of
	--student id)
	type state_type is (s0, s1, s2, s3, s4, s5, s6,
s7, s8);

	--Register to hold the current state
	signal yfsm : state_type;
begin
	process (clk, reset)
	begin
		if reset = '1' then
		yfsm <= s0;
		
	elsif (clk'EVENT AND clk = '1') then
--Determine the next state synchronously, based on the current state and the input
		case yfsm is
			when s0=>
				case data_in is
					when '0' => yfsm <= s0;
					when '1' => yfsm <= s1;
					when others => yfsm <= s0;
				end case;
				
			when s1=>
				case data_in is
					when '0' => yfsm <= s1;
					when '1' => yfsm <= s2;
					when others => yfsm <= s1;
				end case;
			
			when s2=>
				case data_in is
					when '0' => yfsm <= s2;
					when '1' => yfsm <= s3;
					when others => yfsm <= s2;
				end case;
			
			when s3=>
				case data_in is
					when '0' => yfsm <= s3;
					when '1' => yfsm <= s4;
					when others => yfsm <= s3;
				end case;
				
			when s4=>
				case data_in is
					when '0' => yfsm <= s4;
					when '1' => yfsm <= s5;
					when others => yfsm <= s4;
				end case;
				
			when s5=>
				case data_in is
					when '0' => yfsm <= s5;
					when '1' => yfsm <= s6;
					when others => yfsm <= s5;
				end case;
			
			when s6=>
				case data_in is
					when '0' => yfsm <= s6;
					when '1' => yfsm <= s7;
					when others => yfsm <= s6;
				end case;
			
			when s7=>
				case data_in is
					when '0' => yfsm <= s7;
					when '1' => yfsm <= s8;
					when others => yfsm <= s7;
				end case;
			
			when s8=>
				case data_in is
					when '0' => yfsm <= s8;
					when '1' => yfsm <= s0;
					when others => yfsm <= s8;
				end case;
		end case;
	end if;
end process;

--Implement the Moore or Mealy logic here
process (yfsm, data_in) -- data in if read only
begin
	case yfsm is
		when s0=>
		student_id <=  "0101"; --"0101"
		current_state <= "0000";
	
		when s1 =>
		student_id <= "0000"; --"0000"
		current_state <= "0001";
		
		when s2=>
		student_id <= "0001"; --"0001"
		current_state <= "0010";
		
		when s3=>
		student_id <= "0001"; --"0000"
		current_state <= "0011";
		
		when s4=>
		student_id <= "0000"; --"1001"
		current_state <= "0100";
		
		when s5=>
		student_id <= "0000"; --"0010"
		current_state <= "0101";
		
		when s6=>
		student_id <= "0001"; --"0111"
		current_state <= "0110";
		
		when s7=> 
		student_id <= "0010"; --"0000"
		current_state <= "0111";
		
		when s8=>
		student_id <= "0011"; --"0010"
		current_state <= "1000";

	end case;
end process;
end fsm;