LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

PACKAGE sad_lib IS

    --dpmem
    COMPONENT Regn IS
        PORT (
            RAM_ADDR : IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- Address to write/read RAM
            RAM_DATA_IN : IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- Data to write into RAM
            en_wr : IN STD_LOGIC; -- Write enable
            en_re : IN STD_LOGIC; -- 
            RAM_CLOCK : IN STD_LOGIC; -- Clock input for RAM
            RAM_DATA_OUT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) -- Data output of RAM
        );
    END COMPONENT;

    --datapath
    COMPONENT datapath IS
        GENERIC (
            size : INTEGER := 4;
            matrix_size : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1001"
        );
        PORT (
            CLK, Reset : IN STD_LOGIC;
            start : IN STD_LOGIC;
            Data_A, Data_B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            Addr_A_in, Addr_B_in : IN STD_LOGIC_VECTOR((size - 1) DOWNTO 0);
            WE_A, WE_B, RE_A, RE_B : IN STD_LOGIC;
            WE_C, RE_C : IN STD_LOGIC;
            dout_sel : IN STD_LOGIC;
            LD_i : IN STD_LOGIC;
            EN_i : IN STD_LOGIC;

            i_lt_mtrx_sz : OUT STD_LOGIC;
            data_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)

        );
    END COMPONENT;

    --controller
    COMPONENT controller IS
        PORT (
                CLK, Reset : IN STD_LOGIC;
        	start : IN STD_LOGIC;
        	i_lt_mtrx_sz : IN STD_LOGIC;

        	WE_A, WE_B, RE_A, RE_B : OUT STD_LOGIC;
        	WE_C, RE_C : OUT STD_LOGIC;
        	dout_sel : OUT STD_LOGIC; --quyet dinh dau ra cua Controller, la A, B hay C
        	LD_i : OUT STD_LOGIC;
        	EN_i : OUT STD_LOGIC;
        	Done : OUT STD_LOGIC
        );
    END COMPONENT;
    --
    COMPONENT main_sad IS
        GENERIC (
	data_width : INTEGER := 8;
        size : INTEGER := 4;
        matrix_size : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1001"
    );
    PORT (
        CLK, Reset : IN STD_LOGIC;
        start : IN STD_LOGIC;
        Data_A, Data_B : IN STD_LOGIC_VECTOR((data_width - 1) DOWNTO 0);
	Addr_A_in, Addr_B_in : IN STD_LOGIC_VECTOR((size - 1) DOWNTO 0);
        WE_A, WE_B : IN STD_LOGIC;

        Done : OUT STD_LOGIC;
        data_out : OUT STD_LOGIC_VECTOR(data_width - 1 DOWNTO 0);
        RE_C : OUT STD_LOGIC
    );
    END COMPONENT;

END PACKAGE sad_lib;
