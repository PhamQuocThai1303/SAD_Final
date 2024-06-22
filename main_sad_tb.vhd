LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.sad_lib.ALL;

ENTITY main_sad_tb IS

END ENTITY main_sad_tb;

ARCHITECTURE rtl OF main_sad_tb IS
    SIGNAL CLK, Reset : STD_LOGIC;
    SIGNAL start : STD_LOGIC;
    SIGNAL Data_A, Data_B : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL WE_A, WE_B : STD_LOGIC;
    SIGNAL Addr_A_in, Addr_B_in : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL Done : STD_LOGIC;
    SIGNAL data_out : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL RE_C : STD_LOGIC;
BEGIN
    clk_signal : PROCESS
    BEGIN
        CLK <= '1';
        WAIT FOR 10 ns;
        CLK <= '0';
        WAIT FOR 10 ns;
    END PROCESS; -- clk_signal

    rst_sig : PROCESS
    BEGIN
        Reset <= '1';
        WAIT FOR 50 ns;
        Reset <= '0';
        WAIT;
    END PROCESS; -- rst_sig

    Data_A_sig : PROCESS
    BEGIN
        WAIT FOR 100 ns;
        Data_A <= "00000000";
        WAIT FOR 100 ns;
        Data_A <= "00000001";
        WAIT FOR 100 ns;
        Data_A <= "00000010";
        WAIT FOR 100 ns;
        Data_A <= "00000011";
        WAIT FOR 100 ns;
        Data_A <= "00000100";
        WAIT FOR 100 ns;
        Data_A <= "00000101";
        WAIT FOR 100 ns;
        Data_A <= "00000110";
        WAIT FOR 100 ns;
        Data_A <= "00000111";
        WAIT FOR 100 ns;
        Data_A <= "00001000";
        WAIT;

    END PROCESS; -- Data_A_sig

    Addr_A_in_sig : PROCESS
    BEGIN
        WAIT FOR 100 ns;
        Addr_A_in <= "0000";
        WAIT FOR 100 ns;
        Addr_A_in <= "0001";
        WAIT FOR 100 ns;
        Addr_A_in <= "0010";
        WAIT FOR 100 ns;
        Addr_A_in <= "0011";
        WAIT FOR 100 ns;
        Addr_A_in <= "0100";
        WAIT FOR 100 ns;
        Addr_A_in <= "0101";
        WAIT FOR 100 ns;
        Addr_A_in <= "0110";
        WAIT FOR 100 ns;
        Addr_A_in <= "0111";
        WAIT FOR 100 ns;
        Addr_A_in <= "1000";
        WAIT;

    END PROCESS; -- Addr_A_in_sig

    Data_B_sig : PROCESS
    BEGIN
        WAIT FOR 100 ns;
        Data_B <= "00001000";
        WAIT FOR 100 ns;
        Data_B <= "00000111";
        WAIT FOR 100 ns;
        Data_B <= "00000110";
        WAIT FOR 100 ns;
        Data_B <= "00000101";
        WAIT FOR 100 ns;
        Data_B <= "00000100";
        WAIT FOR 100 ns;
        Data_B <= "00000011";
        WAIT FOR 100 ns;
        Data_B <= "00000010";
        WAIT FOR 100 ns;
        Data_B <= "00000001";
        WAIT FOR 100 ns;
        Data_B <= "00000000";
        WAIT;

    END PROCESS; -- Data_B_sig

    Addr_B_in_sig : PROCESS
    BEGIN
        WAIT FOR 100 ns;
        Addr_B_in <= "0000";
        WAIT FOR 100 ns;
        Addr_B_in <= "0001";
        WAIT FOR 100 ns;
        Addr_B_in <= "0010";
        WAIT FOR 100 ns;
        Addr_B_in <= "0011";
        WAIT FOR 100 ns;
        Addr_B_in <= "0100";
        WAIT FOR 100 ns;
        Addr_B_in <= "0101";
        WAIT FOR 100 ns;
        Addr_B_in <= "0110";
        WAIT FOR 100 ns;
        Addr_B_in <= "0111";
        WAIT FOR 100 ns;
        Addr_B_in <= "1000";
        WAIT;

    END PROCESS; -- Addr_B_in_sig

    WE_A_sig : PROCESS
    BEGIN
        WAIT FOR 100 ns;
        WAIT FOR 10 ns;
        WE_A <= '1';
        WAIT FOR 20 ns;
        WE_A <= '0';
        WAIT FOR 70 ns;
        WAIT FOR 10 ns;
        WE_A <= '1';
        WAIT FOR 20 ns;
        WE_A <= '0';
        WAIT FOR 70 ns;
        WAIT FOR 10 ns;
        WE_A <= '1';
        WAIT FOR 20 ns;
        WE_A <= '0';
        WAIT FOR 70 ns;
        WAIT FOR 10 ns;
        WE_A <= '1';
        WAIT FOR 20 ns;
        WE_A <= '0';
        WAIT FOR 70 ns;
        WAIT FOR 10 ns;
        WE_A <= '1';
        WAIT FOR 20 ns;
        WE_A <= '0';
        WAIT FOR 70 ns;
        WAIT FOR 10 ns;
        WE_A <= '1';
        WAIT FOR 20 ns;
        WE_A <= '0';
        WAIT FOR 70 ns;
        WAIT FOR 10 ns;
        WE_A <= '1';
        WAIT FOR 20 ns;
        WE_A <= '0';
        WAIT FOR 70 ns;
        WAIT FOR 10 ns;
        WE_A <= '1';
        WAIT FOR 20 ns;
        WE_A <= '0';
        WAIT FOR 70 ns;
        WAIT FOR 10 ns;
        WE_A <= '1';
        WAIT FOR 20 ns;
        WE_A <= '0';
        WAIT FOR 70 ns;
        WAIT;
    END PROCESS; -- WE_A_sig

    WE_B_sig : PROCESS
    BEGIN
        WAIT FOR 100 ns;
        WAIT FOR 10 ns;
        WE_B <= '1';
        WAIT FOR 20 ns;
        WE_B <= '0';
        WAIT FOR 70 ns;
        WAIT FOR 10 ns;
        WE_B <= '1';
        WAIT FOR 20 ns;
        WE_B <= '0';
        WAIT FOR 70 ns;
        WAIT FOR 10 ns;
        WE_B <= '1';
        WAIT FOR 20 ns;
        WE_B <= '0';
        WAIT FOR 70 ns;
        WAIT FOR 10 ns;
        WE_B <= '1';
        WAIT FOR 20 ns;
        WE_B <= '0';
        WAIT FOR 70 ns;
        WAIT FOR 10 ns;
        WE_B <= '1';
        WAIT FOR 20 ns;
        WE_B <= '0';
        WAIT FOR 70 ns;
        WAIT FOR 10 ns;
        WE_B <= '1';
        WAIT FOR 20 ns;
        WE_B <= '0';
        WAIT FOR 70 ns;
        WAIT FOR 10 ns;
        WE_B <= '1';
        WAIT FOR 20 ns;
        WE_B <= '0';
        WAIT FOR 70 ns;
        WAIT FOR 10 ns;
        WE_B <= '1';
        WAIT FOR 20 ns;
        WE_B <= '0';
        WAIT FOR 70 ns;
        WAIT FOR 10 ns;
        WE_B <= '1';
        WAIT FOR 20 ns;
        WE_B <= '0';
        WAIT FOR 70 ns;
        WAIT;
    END PROCESS; -- WE_B_sig

    start_sig : PROCESS
    BEGIN
        start <= '0';
        WAIT FOR 1100 ns;
        start <= '1';
        WAIT;
    END PROCESS; -- start_sig

    test : main_sad
    PORT MAP(
        CLK, Reset,
        start,
        Data_A, Data_B,
        Addr_A_in, Addr_B_in,
	WE_A, WE_B,
        Done,
        data_out,
        RE_C
    );
END ARCHITECTURE rtl;
