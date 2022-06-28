library ieee;
use ieee.std_logic_1164.all;

entity mealy_101 is port (
	clk : in std_logic;
    reset : in std_logic;
    din : in std_logic;
    dout : out std_logic
);
end mealy_101;

architecture behavior of mealy_101 is
	type state is (s0, s1, s2);
    signal current_state : state;
    signal next_state : state;
begin
	synchronize_clock : process(clk)
    begin
    	if rising_edge(clk) then
        	if reset = '1' then
            	current_state <= s0;
            else
            	current_state <= next_state;
            end if;
        end if;
    end process;
   
   state_mover : process(current_state, din)
   begin
   		case current_state is
        	when s0 => 
            	if din = '1' then
                	next_state <= s1;
                    dout <= '0';
                else
                	next_state <= s0;
                    dout <= '0';
                end if;
            when s1 => 
            	if din = '0' then
                	next_state <= s2;
                    dout <= '0';
                else
                	next_state <= s1;
                    dout <= '0';
                end if;
            when s2 => 
            	if din = '1' then
                	next_state <= s0;
                    dout <= '1';
                else
                	next_state <= s0;
                    dout <= '0';
                end if;
            when others => 
                next_state <= s0;
        end case;
   end process;
end behavior;