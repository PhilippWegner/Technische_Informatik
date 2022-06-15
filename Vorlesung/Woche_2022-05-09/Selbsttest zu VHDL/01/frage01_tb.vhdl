library IEEE;
use IEEE.std_logic_1164.all;

entity frage01_tb is
end frage01_tb;

architecture test of frage01_tb is
    component frage01
        port (
            sr_in : in std_logic_vector(3 downto 0);
            sr_out : out std_logic_vector(3 downto 0)
        );
    end component;

    signal sr_in, sr_out : std_logic_vector(3 downto 0);

begin
    prioritaetsdekoder: frage01 port map(
        sr_in => sr_in,
        sr_out => sr_out
    );
    process begin
        sr_in <= "1110";
        wait for 100 ns;
        assert false report "Reached end of test";
        wait;
    end process;
end test;