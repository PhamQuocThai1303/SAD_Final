LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY Regn IS
    PORT (
        RAM_ADDR : IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- Address to write/read RAM
        RAM_DATA_IN : IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- Data to write into RAM
        en_wr : IN STD_LOGIC; -- Write enable
        en_re : IN STD_LOGIC; -- 
        RAM_CLOCK : IN STD_LOGIC; -- Clock input for RAM
        RAM_DATA_OUT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) -- Data output of RAM
    );
END Regn;

ARCHITECTURE rtl OF Regn IS
    -- Define the new type for the 128x8 RAM
    TYPE RAM_ARRAY IS ARRAY (0 TO 15) OF STD_LOGIC_VECTOR(7 DOWNTO 0);

    -- Initial values in the RAM
    SIGNAL RAM : RAM_ARRAY := (
        x"00", x"00", x"00", x"00", x"00", x"00", x"00", x"00", x"00", x"00", x"00", x"00", x"00", x"00", x"00", x"00"
    );

BEGIN
    PROCESS (RAM_CLOCK)
    BEGIN
        IF rising_edge(RAM_CLOCK) THEN
            IF en_wr = '1' THEN
                -- When write enable = 1, write input data into RAM at the provided address
                RAM(to_integer(unsigned(RAM_ADDR))) <= RAM_DATA_IN;
            END IF;
        END IF;
    END PROCESS;

    PROCESS (RAM_CLOCK)
    BEGIN
        IF rising_edge(RAM_CLOCK) THEN
            IF en_re = '1' THEN
                RAM_DATA_OUT <= RAM(to_integer(unsigned(RAM_ADDR)));
            END IF;
        END IF;
    END PROCESS;
    -- Read data from RAM
END rtl;
