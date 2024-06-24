LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE IEEE.std_logic_unsigned.ALL;
USE work.sad_lib.ALL;

ENTITY datapath IS
    GENERIC (
	data_width :  INTEGER := 8;
        index_width : INTEGER := 4;
        matrix_size : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1001" --vector 4bit voi 9 phan tu
    );
    PORT (
	--input
        Clk, Rst :                       IN STD_LOGIC;
        start :                          IN STD_LOGIC;
        Data_A, Data_B : 		 IN STD_LOGIC_VECTOR((data_width - 1) DOWNTO 0); --du lieu cua A, B
        Addr_A, Addr_B : 		 IN STD_LOGIC_VECTOR((index_width - 1) DOWNTO 0); --dia chi co dinh cua A va B
        We_A, We_B : 	 		 IN STD_LOGIC; 
	Re_A, Re_B :                     IN STD_LOGIC; 
        We_C, Re_C : 			 IN STD_LOGIC;
        output_sel : 			 IN STD_LOGIC;
        Load_i : 			 IN STD_LOGIC; --load cua bo dem i
        Enable_i : 			 IN STD_LOGIC; --enable cua bo dem i

	--output
        i_lt_mtrx_sz : 			 OUT STD_LOGIC;
        Output : 			 OUT STD_LOGIC_VECTOR((data_width - 1) DOWNTO 0)
    );
END ENTITY datapath;

ARCHITECTURE rtl OF datapath IS
    SIGNAL i : 				 STD_LOGIC_VECTOR((index_width - 1) DOWNTO 0); --gia tri bo dem dia chi
    SIGNAL prevI : 			 STD_LOGIC_VECTOR((index_width - 1) DOWNTO 0);
    SIGNAL indx_A, indx_B, indx_C :      STD_LOGIC_VECTOR((index_width - 1) DOWNTO 0); --dia chi cua A va B,C
    SIGNAL Output_A, Output_B, Diff_AB : STD_LOGIC_VECTOR((data_width - 1) DOWNTO 0);
    SIGNAL Data_C : 			 STD_LOGIC_VECTOR((data_width - 1) DOWNTO 0);
    SIGNAL Output_C : 			 STD_LOGIC_VECTOR((data_width - 1) DOWNTO 0);
BEGIN

    i_lt_mtrx_sz <= '0' WHEN i < matrix_size ELSE '1';
    Diff_AB <= Output_A - Output_B WHEN Output_A > Output_B ELSE (Output_B - Output_A);
    Data_C <= "00000000" WHEN output_sel = '1' ELSE (Output_C + Diff_AB); --output_sel = 1 -> port C; =0 -> port A,B
    -- Khi khong trong qua trinh SAD, dia chi cua A,B dc luu lai thanh dia chi A,B ban dau
    indx_A <= i WHEN start = '1' ELSE Addr_A;
    indx_B <= i WHEN start = '1' ELSE Addr_B;
    indx_C <= i;
    --luu tru output
    Output <= Output_C;

    ----------------------- tang gia tri bo dem i -----------------------------
    PROCESS (Rst, Clk)
    BEGIN
        IF (Rst = '1') THEN
            prevI <= "0000";
        ELSIF (Clk'event AND Clk = '1') THEN
            IF Load_i = '1' THEN
                prevI <= "0000";
            ELSIF Enable_i = '1' THEN
                prevI <= prevI + "0001";
            END IF;
        END IF;
    END PROCESS;
    i <= prevI;
    ----------------------------------------------------------------------------

    --Khoi tao cac unit memory de luu tru A,B,C
    Reg_A : Regn
    PORT MAP(
        indx_A,
        Data_A,
        We_A,
        Re_A,
        Clk,
        Output_A
    );
    
    Reg_B : Regn
    PORT MAP(
        indx_B,
        Data_B,
        We_B,
        Re_B,
        Clk,
        Output_B
    );

    Reg_C : Regn
    PORT MAP(
        indx_C,
        Data_C,
        We_C,
        Re_C,
        Clk,
        Output_C
    );

END ARCHITECTURE rtl;
