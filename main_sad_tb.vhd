LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.sad_lib.ALL;

ENTITY main_sad_tb IS
    GENERIC (
	data_width :  INTEGER := 8;
        index_width : INTEGER := 4;
        array_size : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1001" --vector 4bit voi 9 phan tu
    );
END ENTITY main_sad_tb;

ARCHITECTURE rtl OF main_sad_tb IS
    SIGNAL Clk, Rst :           STD_LOGIC;
    SIGNAL start : 		STD_LOGIC;
    SIGNAL Data_A :     	STD_LOGIC_VECTOR((data_width - 1) DOWNTO 0);
    SIGNAL Addr_A :     	STD_LOGIC_VECTOR((index_width - 1) DOWNTO 0);
    SIGNAL We_A : 		STD_LOGIC;
    SIGNAL Data_B :     	STD_LOGIC_VECTOR((data_width - 1) DOWNTO 0);
    SIGNAL Addr_B :     	STD_LOGIC_VECTOR((index_width - 1) DOWNTO 0);
    SIGNAL We_B : 		STD_LOGIC;
    SIGNAL Output : 		STD_LOGIC_VECTOR((data_width - 1) DOWNTO 0);
    SIGNAL Re_C : 		STD_LOGIC;
    SIGNAL Done : 		STD_LOGIC;

    CONSTANT clk_period :       TIME := 10 ns;

    TYPE data_array IS ARRAY (0 TO 8) OF STD_LOGIC_VECTOR((data_width - 1) DOWNTO 0);
    CONSTANT A_data : data_array := (
        "00001010", "00010101", "00001101", "00000011", "00000110",
        "00000010", "00001111", "00011000", "00000001"
    );
    CONSTANT B_data : data_array := (
        "00000011", "00001001", "00010000", "00011000", "00001111",
        "00000101", "00010100", "00001100", "00001000"
    );
BEGIN



    fin_TB : main_sad
    GENERIC MAP(
	data_width,
        index_width,
        array_size
    )
    PORT MAP(
        Clk, Rst,
        start,
        Data_A,
        Addr_A,
	We_A,
	Data_B,
        Addr_B,
	We_B,
        Output,
        Re_C,
	Done
    );

    --start signal
    start_signal : PROCESS
    BEGIN
        start <= '0'; WAIT FOR clk_period*100 ;
        start <= '1'; WAIT;
    END PROCESS;
    --

    --clock signal
    clock_signal : PROCESS
    BEGIN
        Clk <= '1'; WAIT FOR clk_period ;
        Clk <= '0'; WAIT FOR clk_period ;
    END PROCESS; 
    --

    --reset signal
    reset_signal : PROCESS
    BEGIN
        Rst <= '1'; WAIT FOR clk_period*5;
        Rst <= '0'; WAIT;
    END PROCESS; 
    --

    --data A signal
    Data_A_signal : PROCESS
    BEGIN
        WAIT FOR clk_period*10 ;
        FOR i IN 0 TO 8 LOOP
            Data_A <= A_data(i);
            WAIT FOR clk_period*10 ;
        END LOOP;
        WAIT;
    END PROCESS; 
    --

    --address A signal
    Addr_A_signal : PROCESS
    BEGIN
        WAIT FOR clk_period*10;
        FOR i IN 0 TO 8 LOOP
            Addr_A <= STD_LOGIC_VECTOR(TO_UNSIGNED(i, index_width));
            WAIT FOR clk_period*10;
        END LOOP;
        WAIT;
    END PROCESS;  
    --

    --data B signal
    Data_B_signal : PROCESS
    BEGIN
        WAIT FOR clk_period*10;
        FOR i IN 0 TO 8 LOOP
            Data_B <= B_data(i);
            WAIT FOR clk_period*10;
        END LOOP;
        WAIT;
    END PROCESS;
    --

    --address B signal
    Addr_B_signal : PROCESS
    BEGIN
        WAIT FOR clk_period*10;
        FOR i IN 0 TO 8 LOOP
            Addr_B <= STD_LOGIC_VECTOR(TO_UNSIGNED(i, index_width));
            WAIT FOR clk_period*10;
        END LOOP;
        WAIT;
    END PROCESS;
    --

    --write enable A signal
    We_A_signal : PROCESS
    BEGIN
        WAIT FOR clk_period*10;
        FOR i IN 0 TO 8 LOOP
            WAIT FOR clk_period;
            We_A <= '1';
            WAIT FOR clk_period*2;
            We_A <= '0';
            WAIT FOR clk_period*7;
        END LOOP;
        WAIT;
    END PROCESS;
    ---

    --write enable B signal
    We_B_signal : PROCESS
    BEGIN
        WAIT FOR clk_period*10;
        FOR i IN 0 TO 8 LOOP
            WAIT FOR clk_period;
            We_B <= '1';
            WAIT FOR clk_period*2;
            We_B <= '0';
            WAIT FOR clk_period*7;
        END LOOP;
        WAIT;
    END PROCESS;
    --

END ARCHITECTURE rtl;
