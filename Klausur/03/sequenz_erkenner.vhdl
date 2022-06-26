library ieee;
use ieee.std_logic_1164.all;

-- MOORE AUTOMAT
entity sequenz_erkenner is
    port (
        clk : in std_logic;
        rst : in std_logic;
        din : in std_logic;
        dout : out std_logic
    );
end sequenz_erkenner;

architecture Behavioral of sequenz_erkenner is
    type state is (st00, st10, st11);
    signal present_state : state;
    signal next_state : state;
begin
    asynchronous_process : process (clk, rst)
    begin
        if(rising_edge(clk)) then
            -- Synchron reset
            if(rst = '1') then
                present_state <= st00;
            else
                present_state <= next_state;
            end if;
        end if;
    end process;

    next_state_and_output_decoder : process(present_state, din)
    begin
        if(present_state = st00) then
            if(din = '1') then
                next_state <= st10;
            else
                next_state <= st00;
            end if;
        elsif(present_state = st10) then
            if(din = '0') then
                next_state <= st11;
            else
                next_state <= st10;          
            end if;
        else
            next_state <= st00;
        end if;
    end process;

    outputter : process(present_state)
    begin
        if(present_state = st00) then
            dout <= '0';
        elsif(present_state = st10) then
            dout <= '0';
        elsif(present_state = st11) then
            dout <= '1';
        end if;
    end process;
end Behavioral;
