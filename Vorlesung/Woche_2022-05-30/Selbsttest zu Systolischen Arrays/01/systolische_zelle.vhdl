library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity systolische_zelle is
port(
    clock: in std_logic;
    reset: in std_logic;
    input_top: in signed(7 downto 0);
    input_left: in signed(7 downto 0);
    output_right: out signed(7 downto 0);
    output_bottom: out signed(7 downto 0);
    cell_out: out signed(15 downto 0)
    );
end systolische_zelle;

architecture pipelined of systolische_zelle is
    signal store: signed(15 downto 0);
    -- signal store: signed(15 downto 0) := "0000000000000000";
begin
P1: process(clock,reset)
begin
    if(reset='0') then -- now implementing asynchronous reset
        if (rising_edge(clock)) then   
            store <= store + input_left * input_top;
            output_right <= input_left;
	        output_bottom <= input_top;
        end if;
    else
	    output_right <= "00000000";
	    output_bottom <= "00000000";
	    cell_out <= "0000000000000000";
        store <= "0000000000000000";
    end if;
    cell_out <= store;
end process P1;
end pipelined;