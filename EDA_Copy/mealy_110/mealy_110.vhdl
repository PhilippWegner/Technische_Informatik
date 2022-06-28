-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

entity mealy_110 is port (
	clk : in std_logic;
    rst : in std_logic;
    din : in std_logic;
    dout : out std_logic
);
end mealy_110;


architecture behavior of mealy_110 is
	type state is (s0, s1, s2);
    signal current_state : state;
    signal next_state : state;
begin
	synchronize_clock : process(clk)
    begin
    	if falling_edge(clk) then --clk'event = '1' and clk = '1'
        	if rst = '1' then
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
                else
                	next_state <= s0;
                end if;
            when s1 => 
            	if din = '1' then
                	next_state <= s2;
                else
                	next_state <= s1;
                end if;
            when s2 => 
            	if din = '0' then
                	next_state <= s0;
                else
                	next_state <= s2;
                end if;
            when others => 
                next_state <= s0;
        end case;
   end process;
   
   state_outputter : process(current_state, din)
   begin
          case current_state is
              when s0 => 
                  if din = '1' then
                      dout <= '0';
                  else
                      dout <= '0';
                  end if;
              when s1 => 
                  if din = '0' then
                      dout <= '0';
                  else
                      dout <= '0';
                  end if;
              when s2 => 
                  if din = '0' then
                      dout <= '1';
                  else
                      dout <= '0';
                  end if;
              when others => 
                  dout <= '0';
          end case;    	
   end process;
end behavior;