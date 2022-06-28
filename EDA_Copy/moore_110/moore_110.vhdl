-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

entity moore_110 is port (
	clk : in std_logic;
    rst : in std_logic;
    din : in std_logic;
    dout : out std_logic
);
end moore_110;


architecture behavior of moore_110 is
	type state is (s00, s10, s20, s01);
    signal current_state : state;
    signal next_state : state;
begin
	synchronize_clock : process(clk)
    begin
    	if rising_edge(clk) then --clk'event = '1' and clk = '1'
        	if rst = '1' then
            	current_state <= s00;
            else
            	current_state <= next_state;
            end if;
        end if;
    end process;
    
    
   state_mover : process(current_state, din)
   begin
   		case current_state is
        	when s00 => 
            	if din = '1' then
                	next_state <= s10;
                else
                	next_state <= s00;
                end if;
            when s10 =>
            	if din = '1' then
                	next_state <= s20;
                else
                	next_state <= s00;
                end if;
            when s20 =>
            	if din = '1' then
                	next_state <= s20;
                else
                	next_state <= s01;
                end if;
            when s01 =>
            	if din = '1' then
                	next_state <= s10;
                else
                	next_state <= s00;
                end if;
            when others => 
            	next_state <= s00;
        end case;
   end process;
   
   state_outputter : process(current_state)
   begin
          case current_state is
        	when s00 => dout <= '0';
            when s10 => dout <= '0';
            when s20 => dout <= '0';
            when s01 => dout <= '1';
            when others => dout <= '0';
        end case;
   end process;
end behavior;