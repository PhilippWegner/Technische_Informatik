library IEEE;
use IEEE.std_logic_1164.all;

entity adu_tb is
end adu_tb;

architecture test of adu_tb is
    component adu
        port (
            ein: in std_logic_vector(6 downto 0);
            aus: out std_logic_vector(2 downto 0)
        );
    end component;

    signal  ein : std_logic_vector(6 downto 0); 
    signal  aus : std_logic_vector(2 downto 0);

begin
    prioritaetsdekoder: adu port map(
        ein => ein,
        aus => aus
    );
    process begin
        ein <= "0000000";
        wait for 1 ns;
        ein <= "0000001";
        wait for 1 ns;
        ein <= "0000011";
        wait for 1 ns;
        ein <= "0000111";
        wait for 1 ns;
        ein <= "0001111";
        wait for 1 ns;
        ein <= "0011111";
        wait for 1 ns;
        ein <= "0111111";
        wait for 1 ns;
        ein <= "1111111";
        wait for 1 ns;


        assert false report "Reached end of test";
        wait;
    end process;
end test;