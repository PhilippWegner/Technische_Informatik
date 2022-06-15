library IEEE;
use IEEE.std_logic_1164.all;


entity ampelschaltung is
    port (
        clk : in std_logic;
        r_neg : in std_logic;

        haupt_gruen : out std_logic;
        haupt_gelb : out std_logic;
        haupt_rot : out std_logic;

        neben_gruen : out std_logic;
        neben_gelb : out std_logic;
        neben_rot : out std_logic
    );
end ampelschaltung;

architecture behave of ampelschaltung is
    signal counter: integer;
begin
    zyklus: process(r_neg, clk)
    begin
        if r_neg = '0' then
            counter <= 0;
        elsif rising_edge(clk) then
            counter <= counter + 1;
            if counter = 33 then
                counter <= 0;
            end if;
        end if;
    end process zyklus;

    schaltung: process(counter)
    begin
        -- Gruenphase Hauptstrecke 14 Sekunden
        if(counter <= 14) then
            haupt_gruen <= '1';
            haupt_gelb <= '0';
            haupt_rot <= '0';

            neben_gruen <= '0';
            neben_gelb <= '0';
            neben_rot <= '1';
            -- done
        elsif(counter <= 16) then
            haupt_gruen <= '0';
            haupt_gelb <= '1';
            haupt_rot <= '0';

            neben_gruen <= '0';
            neben_gelb <= '0';
            neben_rot <= '1';
            -- done
        elsif(counter <= 18) then
            haupt_gruen <= '0';
            haupt_gelb <= '0';
            haupt_rot <= '1';

            neben_gruen <= '0';
            neben_gelb <= '0';
            neben_rot <= '1';
            -- done
        elsif(counter <= 20) then
            haupt_gruen <= '0';
            haupt_gelb <= '0';
            haupt_rot <= '1';

            neben_gruen <= '0';
            neben_gelb <= '1';
            neben_rot <= '1';
            -- done
        elsif(counter <= 26) then
            haupt_gruen <= '0';
            haupt_gelb <= '0';
            haupt_rot <= '1';

            neben_gruen <= '1';
            neben_gelb <= '0';
            neben_rot <= '0';
            -- done
        elsif(counter <= 28) then
            haupt_gruen <= '0';
            haupt_gelb <= '0';
            haupt_rot <= '1';

            neben_gruen <= '0';
            neben_gelb <= '1';
            neben_rot <= '0';
            -- done
        elsif(counter <= 30) then
            haupt_gruen <= '0';
            haupt_gelb <= '0';
            haupt_rot <= '1';
            
            neben_gruen <= '0';
            neben_gelb <= '0';
            neben_rot <= '1';
            -- done
        elsif(counter <= 32) then
            haupt_gruen <= '0';
            haupt_gelb <= '1';
            haupt_rot <= '1';
            
            neben_gruen <= '0';
            neben_gelb <= '0';
            neben_rot <= '1';
            -- done
        end if;
    end process schaltung;
end behave;