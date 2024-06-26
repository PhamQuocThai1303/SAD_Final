LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY controller IS
    PORT (
	--input
        Clk, Rst :                  IN STD_LOGIC;
        start :                     IN STD_LOGIC;
        i_lt_arr_sz :              IN STD_LOGIC;

	--output
        We_A, We_B :                OUT STD_LOGIC;
	Re_A, Re_B :                OUT STD_LOGIC; 
        We_C, Re_C :                OUT STD_LOGIC;
        output_sel :                OUT STD_LOGIC; --quyet dinh dau ra cua Controller, la A,B hay C
        Load_i :                    OUT STD_LOGIC;
        Enable_i :                  OUT STD_LOGIC;
        Done :                      OUT STD_LOGIC
    );
END ENTITY controller;

ARCHITECTURE rtl OF controller IS
    TYPE State_stage IS (s0, s1, s2, s3, s4, s5, s6, s7);
    SIGNAL state : State_stage;
BEGIN

    PROCESS (Clk, Rst)
    BEGIN
        IF Rst = '1' THEN
            state <= S0;
        ELSIF (Clk'event AND Clk = '1') THEN
            CASE state IS
                WHEN s0 =>
                 state <= s1;
                WHEN s1 =>
                 IF start = '1' THEN
                     state <= s2;
                 ELSE
                     state <= s0;
                 END IF;
                WHEN s2 =>
                 state <= s3;
                WHEN s3 =>
                 IF i_lt_arr_sz = '0' THEN
                     state <= s4;
                 ELSE
                     state <= s7;
                 END IF;
                WHEN s4 =>
                 state <= s5;
                WHEN s5 =>
                 state <= s6;
                WHEN s6 =>
                 state <= s3;
              
                WHEN s7 =>
                 IF start = '0' THEN
                     state <= s0;
                 ELSE
                     state <= s7;
                 END IF;
            END CASE;
        END IF;
    END PROCESS;

    --combinational logic
    Done <= '1'       WHEN state = s7 ELSE '0';
    output_sel <= '1' WHEN state = s0 ELSE '0';
    Load_i <= '1'     WHEN state = s2 ELSE '0';
    Enable_i <= '1'   WHEN state = s6 ELSE '0';
    Re_A <= '1'       WHEN state = s4 ELSE '0';
    Re_B <= '1'       WHEN state = s4 ELSE '0';
    Re_C <= '1'       WHEN state = s0 OR state = s6 ELSE '0'; --khoi tao viec doc ra C
    We_C <= '1'       WHEN state = s0 OR state = s5 ELSE '0'; --khoi tao viec viet vao C

END ARCHITECTURE rtl;
