LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.sad_lib.ALL;

ENTITY main_sad IS
    GENERIC (
	data_width : INTEGER := 8;
        size : INTEGER := 4;
        matrix_size : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1001" --"9"
    );
    PORT (
        Clk, Rst : IN STD_LOGIC;
        start : IN STD_LOGIC;
        Data_A, Data_B : IN STD_LOGIC_VECTOR((data_width - 1) DOWNTO 0);
	Addr_A, Addr_B : IN STD_LOGIC_VECTOR((size - 1) DOWNTO 0);
        We_A, We_B : IN STD_LOGIC;  --Tin hieu ben ngoai

        Done : OUT STD_LOGIC;
        Output : OUT STD_LOGIC_VECTOR((data_width - 1) DOWNTO 0);
        Re_C : OUT STD_LOGIC
    );
END ENTITY main_sad;

ARCHITECTURE rtl OF main_sad IS
    SIGNAL We_A_internal, We_B_internal, Re_A, Re_B : STD_LOGIC;  --Tin hieu ben trong
    SIGNAL We_A_combined, We_B_combined : STD_LOGIC;
    SIGNAL We_C, Re_C_internal : STD_LOGIC;
    SIGNAL output_sel : STD_LOGIC;
    SIGNAL Load_i, Enable_i : STD_LOGIC;
    SIGNAL i_lt_mtrx_sz : STD_LOGIC;
BEGIN
    --tin hieu combined can co tin hieu tu ben ngoai hoac ben trong he thong
    We_A_combined <= We_A OR We_A_internal;
    We_B_combined <= We_B OR We_B_internal;

    --output cua Re_C phu thuoc vao tin hieu ben trong
    Re_C <= Re_C_internal;


    datapath_comp : datapath
    GENERIC MAP(
        size,
        matrix_size
    )
    PORT MAP(
        Clk, Rst,
        start,
        Data_A, Data_B,
        Addr_A, Addr_B,
        We_A_combined, We_B_combined, Re_A, Re_B,  -- su dung tin hieu tu ben ngoai hoac tu controller
        We_C, Re_C_internal,
        output_sel,
        Load_i,
        Enable_i,
        i_lt_mtrx_sz,
        Output
    );


    controller_comp : controller
    PORT MAP(
        Clk, Rst,
        start,
        i_lt_mtrx_sz,
        We_A_internal, We_B_internal, Re_A, Re_B,   -- su dung tin hieu noi bo de kiem soat logic va trang thai he thong
        We_C, Re_C_internal,
        output_sel,
        Load_i,
        Enable_i,
        Done
    );
END ARCHITECTURE rtl;
