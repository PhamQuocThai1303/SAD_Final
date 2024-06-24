LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

PACKAGE sad_lib IS

    ---------------------main SAD-------------------------------
    COMPONENT main_sad IS
        GENERIC (
	data_width :  INTEGER := 8;
        index_width : INTEGER := 4;
        array_size : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1001" --vector 4bit voi 9 phan tu
    );
    PORT (
	--input
        Clk, Rst : 	 IN STD_LOGIC;
        start : 	 IN STD_LOGIC;
        Data_A : 	 IN STD_LOGIC_VECTOR((data_width - 1) DOWNTO 0);
	Addr_A : 	 IN STD_LOGIC_VECTOR((index_width - 1) DOWNTO 0);
        We_A :     	 IN STD_LOGIC;  --Tin hieu ben ngoai
	Data_B : 	 IN STD_LOGIC_VECTOR((data_width - 1) DOWNTO 0);
	Addr_B : 	 IN STD_LOGIC_VECTOR((index_width - 1) DOWNTO 0);
        We_B :     	 IN STD_LOGIC;  --Tin hieu ben ngoai

	--output
        Output : 	 OUT STD_LOGIC_VECTOR((data_width - 1) DOWNTO 0);
        Re_C : 		 OUT STD_LOGIC;
	Done : 		 OUT STD_LOGIC
    );
    END COMPONENT;
    ------------------------------------------------------------


    ---------------------datapath-------------------------------
    COMPONENT datapath IS
        GENERIC (
	data_width :  INTEGER := 8;
        index_width : INTEGER := 4;
        array_size : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1001" --vector 4bit voi 9 phan tu
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
        i_lt_arr_sz : 			 OUT STD_LOGIC;
        Output : 			 OUT STD_LOGIC_VECTOR((data_width - 1) DOWNTO 0)
    );
    END COMPONENT;
    -------------------------------------------------------------



    ---------------------controller-------------------------------
    COMPONENT controller IS
        PORT (
	--input
        Clk, Rst :                  IN STD_LOGIC;
        start :                     IN STD_LOGIC;
        i_lt_arr_sz :              IN STD_LOGIC;

	--output
        We_A, We_B :                OUT STD_LOGIC;
	Re_A, Re_B :                OUT STD_LOGIC; 
        We_C, Re_C :                OUT STD_LOGIC;
        output_sel :                OUT STD_LOGIC;
        Load_i :                    OUT STD_LOGIC;
        Enable_i :                  OUT STD_LOGIC;
        Done :                      OUT STD_LOGIC
    );
    END COMPONENT;
    -------------------------------------------------------------



    ---------------------Register n bit-------------------------------
    COMPONENT Regn IS
        GENERIC (
	data_width :  INTEGER := 8;
        index_width : INTEGER := 4;
        array_size : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1001" --vector 4bit voi 9 phan tu
    );
    PORT (
	--input
	Clk : 		IN STD_LOGIC;
        Mem_addr : 	IN STD_LOGIC_VECTOR((index_width - 1) DOWNTO 0); --index cua unit
        W_enable : 	IN STD_LOGIC; 
        R_enable : 	IN STD_LOGIC; 
	Data_mem_in :   IN STD_LOGIC_VECTOR((data_width - 1) DOWNTO 0); -- data cua unit duoc luu vao mem

	--output
        Data_mem_out :  OUT STD_LOGIC_VECTOR((data_width - 1) DOWNTO 0) -- data cua unit duoc lay ra va su dung
    );
    END COMPONENT;
    -------------------------------------------------------------------

END PACKAGE sad_lib;
