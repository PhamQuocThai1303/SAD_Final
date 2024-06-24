LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY Regn IS
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
END Regn;

ARCHITECTURE rtl OF Regn IS
    -- Tao 1 vung memory co tong cong 72bit, 9 dia chi, moi dia chi 8 bit du lieu
    TYPE Mem_arr IS ARRAY (0 TO 8) OF STD_LOGIC_VECTOR((data_width - 1) DOWNTO 0);
    -- Khoi tao 9 gia tri bang 0
    SIGNAL Mem_ele : Mem_arr := (
        "00000000", "00000000", "00000000", "00000000",
    	"00000000", "00000000", "00000000", "00000000", "00000000"
    );

BEGIN

    PROCESS (Clk)
    	VARIABLE addr : integer;
    BEGIN
        IF rising_edge(Clk) THEN
	    addr := to_integer(unsigned(Mem_addr)); --luu lai dia chi vao addr
            IF W_enable = '1' THEN --Luu du lieu
                Mem_ele(addr) <= Data_mem_in;
            END IF;
        END IF;
    END PROCESS;


    PROCESS (Clk)
    	VARIABLE addr : integer;
    BEGIN
        IF rising_edge(Clk) THEN
	    addr := to_integer(unsigned(Mem_addr)); --luu lai dia chi vao addr
            IF R_enable = '1' THEN  --Lay ra du lieu
                Data_mem_out <= Mem_ele(addr);
            END IF;
        END IF;
    END PROCESS;
END rtl;
