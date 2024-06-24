LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.sad_lib.ALL;

ENTITY main_sad_tb IS
    GENERIC (
	data_width :  INTEGER := 8;
        index_width : INTEGER := 4;
        matrix_size : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1001" --vector 4bit voi 9 phan tu
    );
END ENTITY main_sad_tb;

ARCHITECTURE rtl OF main_sad_tb IS
    SIGNAL Clk, Rst :           STD_LOGIC;
    SIGNAL start : 		STD_LOGIC;
    SIGNAL Data_A :     	STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL Addr_A :     	STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL We_A : 		STD_LOGIC;
    SIGNAL Data_B :     	STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL Addr_B :     	STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL We_B : 		STD_LOGIC;
    SIGNAL Output : 		STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL Re_C : 		STD_LOGIC;
    SIGNAL Done : 		STD_LOGIC;
BEGIN

    start_signal : PROCESS
    BEGIN
        start <= '0';
        WAIT FOR 1100 ns;
        start <= '1';
        WAIT;
    END PROCESS;

    clock_signal : PROCESS
    BEGIN
        Clk <= '1';
        WAIT FOR 10 ns;
        Clk <= '0';
        WAIT FOR 10 ns;
    END PROCESS; 

    reset_signal : PROCESS
    BEGIN
        Rst <= '1';
        WAIT FOR 50 ns;
        Rst <= '0';
        WAIT;
    END PROCESS; 

    Data_A_signal : PROCESS
    BEGIN
        WAIT FOR 100 ns;
        Data_A <= "00001010";
        WAIT FOR 100 ns;
        Data_A <= "00010101";
        WAIT FOR 100 ns;
        Data_A <= "00001101";
        WAIT FOR 100 ns;
        Data_A <= "00000011";
        WAIT FOR 100 ns;
        Data_A <= "00000110";
        WAIT FOR 100 ns;
        Data_A <= "00000010";
        WAIT FOR 100 ns;
        Data_A <= "00001111";
        WAIT FOR 100 ns;
        Data_A <= "00011000";
        WAIT FOR 100 ns;
        Data_A <= "00000001";
        WAIT;

    END PROCESS; 

    Addr_A_signal : PROCESS
    BEGIN
        WAIT FOR 100 ns;
        Addr_A <= "0000";
        WAIT FOR 100 ns;
        Addr_A <= "0001";
        WAIT FOR 100 ns;
        Addr_A <= "0010";
        WAIT FOR 100 ns;
        Addr_A <= "0011";
        WAIT FOR 100 ns;
        Addr_A <= "0100";
        WAIT FOR 100 ns;
        Addr_A <= "0101";
        WAIT FOR 100 ns;
        Addr_A <= "0110";
        WAIT FOR 100 ns;
        Addr_A <= "0111";
        WAIT FOR 100 ns;
        Addr_A <= "1000";
        WAIT;

    END PROCESS; 

    Data_B_signal : PROCESS
    BEGIN
        WAIT FOR 100 ns;
        Data_B <= "00000011";
        WAIT FOR 100 ns;
        Data_B <= "00001001";
        WAIT FOR 100 ns;
        Data_B <= "00010000";
        WAIT FOR 100 ns;
        Data_B <= "00011000";
        WAIT FOR 100 ns;
        Data_B <= "00001111";
        WAIT FOR 100 ns;
        Data_B <= "00000101";
        WAIT FOR 100 ns;
        Data_B <= "00010100";
        WAIT FOR 100 ns;
        Data_B <= "00001100";
        WAIT FOR 100 ns;
        Data_B <= "00001000";
        WAIT;

    END PROCESS;

    Addr_B_signal : PROCESS
    BEGIN
        WAIT FOR 100 ns;
        Addr_B <= "0000";
        WAIT FOR 100 ns;
        Addr_B <= "0001";
        WAIT FOR 100 ns;
        Addr_B <= "0010";
        WAIT FOR 100 ns;
        Addr_B <= "0011";
        WAIT FOR 100 ns;
        Addr_B <= "0100";
        WAIT FOR 100 ns;
        Addr_B <= "0101";
        WAIT FOR 100 ns;
        Addr_B <= "0110";
        WAIT FOR 100 ns;
        Addr_B <= "0111";
        WAIT FOR 100 ns;
        Addr_B <= "1000";
        WAIT;

    END PROCESS;

    We_A_signal : PROCESS
    BEGIN
        WAIT FOR 100 ns;
        WAIT FOR 10 ns;
        We_A <= '1';
        WAIT FOR 20 ns;
        We_A <= '0';
        WAIT FOR 70 ns;
        WAIT FOR 10 ns;
        We_A <= '1';
        WAIT FOR 20 ns;
        We_A <= '0';
        WAIT FOR 70 ns;
        WAIT FOR 10 ns;
        We_A <= '1';
        WAIT FOR 20 ns;
        We_A <= '0';
        WAIT FOR 70 ns;
        WAIT FOR 10 ns;
        We_A <= '1';
        WAIT FOR 20 ns;
        We_A <= '0';
        WAIT FOR 70 ns;
        WAIT FOR 10 ns;
        We_A <= '1';
        WAIT FOR 20 ns;
        We_A <= '0';
        WAIT FOR 70 ns;
        WAIT FOR 10 ns;
        We_A <= '1';
        WAIT FOR 20 ns;
        We_A <= '0';
        WAIT FOR 70 ns;
        WAIT FOR 10 ns;
        We_A <= '1';
        WAIT FOR 20 ns;
        We_A <= '0';
        WAIT FOR 70 ns;
        WAIT FOR 10 ns;
        We_A <= '1';
        WAIT FOR 20 ns;
        We_A <= '0';
        WAIT FOR 70 ns;
        WAIT FOR 10 ns;
        We_A <= '1';
        WAIT FOR 20 ns;
        We_A <= '0';
        WAIT FOR 70 ns;
        WAIT;
    END PROCESS;

    We_B_signal : PROCESS
    BEGIN
        WAIT FOR 100 ns;
        WAIT FOR 10 ns;
        We_B <= '1';
        WAIT FOR 20 ns;
        We_B <= '0';
        WAIT FOR 70 ns;
        WAIT FOR 10 ns;
        We_B <= '1';
        WAIT FOR 20 ns;
        We_B <= '0';
        WAIT FOR 70 ns;
        WAIT FOR 10 ns;
        We_B <= '1';
        WAIT FOR 20 ns;
        We_B <= '0';
        WAIT FOR 70 ns;
        WAIT FOR 10 ns;
        We_B <= '1';
        WAIT FOR 20 ns;
        We_B <= '0';
        WAIT FOR 70 ns;
        WAIT FOR 10 ns;
        We_B <= '1';
        WAIT FOR 20 ns;
        We_B <= '0';
        WAIT FOR 70 ns;
        WAIT FOR 10 ns;
        We_B <= '1';
        WAIT FOR 20 ns;
        We_B <= '0';
        WAIT FOR 70 ns;
        WAIT FOR 10 ns;
        We_B <= '1';
        WAIT FOR 20 ns;
        We_B <= '0';
        WAIT FOR 70 ns;
        WAIT FOR 10 ns;
        We_B <= '1';
        WAIT FOR 20 ns;
        We_B <= '0';
        WAIT FOR 70 ns;
        WAIT FOR 10 ns;
        We_B <= '1';
        WAIT FOR 20 ns;
        We_B <= '0';
        WAIT FOR 70 ns;
        WAIT;
    END PROCESS;


    fin_TB : main_sad
    GENERIC MAP(
	data_width,
        index_width,
        matrix_size
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
END ARCHITECTURE rtl;
