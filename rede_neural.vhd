-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- PROGRAM		"Quartus II 64-Bit"
-- VERSION		"Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"
-- CREATED		"Fri Jul 04 17:55:44 2025"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY rede_neural IS 
	PORT
	(
		ENABLE :  IN  STD_LOGIC;
		CLOCK_PLACA :  IN  STD_LOGIC;
		INPUT :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		OUTPUT :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		STATE :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END rede_neural;

ARCHITECTURE bdf_type OF rede_neural IS 

COMPONENT rom_b
	PORT(clock : IN STD_LOGIC;
		 rom_enable : IN STD_LOGIC;
		 add_0 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 add_1 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 add_2 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 add_3 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 out_0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 out_1 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 out_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 out_3 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT rom_w
	PORT(clock : IN STD_LOGIC;
		 rom_enable : IN STD_LOGIC;
		 add_0 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 add_1 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 add_2 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 add_3 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 out_0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 out_1 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 out_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 out_3 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT neuronio_in4
	PORT(clock : IN STD_LOGIC;
		 neuronio_in4_enable : IN STD_LOGIC;
		 bias : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 input_0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 input_1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 input_2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 input_3 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 peso : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 output : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT neuronio_output
	PORT(clock : IN STD_LOGIC;
		 neuronio_output_enable : IN STD_LOGIC;
		 bias : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 input_0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 input_1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 input_2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 input_3 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 peso : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 output : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT controlador
	PORT(en : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 en_ROM_W : OUT STD_LOGIC;
		 en_ROM_B : OUT STD_LOGIC;
		 en_n00 : OUT STD_LOGIC;
		 en_n10 : OUT STD_LOGIC;
		 en_n11 : OUT STD_LOGIC;
		 en_n12 : OUT STD_LOGIC;
		 en_n13 : OUT STD_LOGIC;
		 en_n20 : OUT STD_LOGIC;
		 en_n21 : OUT STD_LOGIC;
		 en_n22 : OUT STD_LOGIC;
		 en_n23 : OUT STD_LOGIC;
		 en_n30 : OUT STD_LOGIC;
		 add_B0 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 add_B1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 add_B2 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 add_B3 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 add_W0 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 add_W1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 add_W2 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 add_W3 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 state : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT neuronio_in1
	PORT(clock : IN STD_LOGIC;
		 neuronio_in1_enable : IN STD_LOGIC;
		 bias : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 input : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 peso : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 output : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_64 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_65 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_66 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_67 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_68 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_69 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_70 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_71 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_24 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_72 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_26 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_27 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_28 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_29 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_73 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_31 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_34 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_74 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_38 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_75 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_76 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_42 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_46 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_50 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_57 :  STD_LOGIC;


BEGIN 



b2v_inst : rom_b
PORT MAP(clock => CLOCK_PLACA,
		 rom_enable => SYNTHESIZED_WIRE_0,
		 add_0 => SYNTHESIZED_WIRE_1,
		 add_1 => SYNTHESIZED_WIRE_2,
		 add_2 => SYNTHESIZED_WIRE_3,
		 add_3 => SYNTHESIZED_WIRE_4,
		 out_0 => SYNTHESIZED_WIRE_72,
		 out_1 => SYNTHESIZED_WIRE_75,
		 out_2 => SYNTHESIZED_WIRE_64,
		 out_3 => SYNTHESIZED_WIRE_70);


b2v_inst1 : rom_w
PORT MAP(clock => CLOCK_PLACA,
		 rom_enable => SYNTHESIZED_WIRE_5,
		 add_0 => SYNTHESIZED_WIRE_6,
		 add_1 => SYNTHESIZED_WIRE_7,
		 add_2 => SYNTHESIZED_WIRE_8,
		 add_3 => SYNTHESIZED_WIRE_9,
		 out_0 => SYNTHESIZED_WIRE_73,
		 out_1 => SYNTHESIZED_WIRE_76,
		 out_2 => SYNTHESIZED_WIRE_69,
		 out_3 => SYNTHESIZED_WIRE_71);


b2v_inst10 : neuronio_in4
PORT MAP(clock => CLOCK_PLACA,
		 neuronio_in4_enable => SYNTHESIZED_WIRE_10,
		 bias => SYNTHESIZED_WIRE_64,
		 input_0 => SYNTHESIZED_WIRE_65,
		 input_1 => SYNTHESIZED_WIRE_66,
		 input_2 => SYNTHESIZED_WIRE_67,
		 input_3 => SYNTHESIZED_WIRE_68,
		 peso => SYNTHESIZED_WIRE_69,
		 output => SYNTHESIZED_WIRE_28);


b2v_inst11 : neuronio_in4
PORT MAP(clock => CLOCK_PLACA,
		 neuronio_in4_enable => SYNTHESIZED_WIRE_17,
		 bias => SYNTHESIZED_WIRE_70,
		 input_0 => SYNTHESIZED_WIRE_65,
		 input_1 => SYNTHESIZED_WIRE_66,
		 input_2 => SYNTHESIZED_WIRE_67,
		 input_3 => SYNTHESIZED_WIRE_68,
		 peso => SYNTHESIZED_WIRE_71,
		 output => SYNTHESIZED_WIRE_29);


b2v_inst12 : neuronio_output
PORT MAP(clock => CLOCK_PLACA,
		 neuronio_output_enable => SYNTHESIZED_WIRE_24,
		 bias => SYNTHESIZED_WIRE_72,
		 input_0 => SYNTHESIZED_WIRE_26,
		 input_1 => SYNTHESIZED_WIRE_27,
		 input_2 => SYNTHESIZED_WIRE_28,
		 input_3 => SYNTHESIZED_WIRE_29,
		 peso => SYNTHESIZED_WIRE_73,
		 output => OUTPUT);


b2v_inst2 : controlador
PORT MAP(en => ENABLE,
		 clock => CLOCK_PLACA,
		 en_ROM_W => SYNTHESIZED_WIRE_5,
		 en_ROM_B => SYNTHESIZED_WIRE_0,
		 en_n00 => SYNTHESIZED_WIRE_31,
		 en_n10 => SYNTHESIZED_WIRE_34,
		 en_n11 => SYNTHESIZED_WIRE_38,
		 en_n12 => SYNTHESIZED_WIRE_42,
		 en_n13 => SYNTHESIZED_WIRE_46,
		 en_n20 => SYNTHESIZED_WIRE_50,
		 en_n21 => SYNTHESIZED_WIRE_57,
		 en_n22 => SYNTHESIZED_WIRE_10,
		 en_n23 => SYNTHESIZED_WIRE_17,
		 en_n30 => SYNTHESIZED_WIRE_24,
		 add_B0 => SYNTHESIZED_WIRE_1,
		 add_B1 => SYNTHESIZED_WIRE_2,
		 add_B2 => SYNTHESIZED_WIRE_3,
		 add_B3 => SYNTHESIZED_WIRE_4,
		 add_W0 => SYNTHESIZED_WIRE_6,
		 add_W1 => SYNTHESIZED_WIRE_7,
		 add_W2 => SYNTHESIZED_WIRE_8,
		 add_W3 => SYNTHESIZED_WIRE_9,
		 state => STATE);


b2v_inst3 : neuronio_in1
PORT MAP(clock => CLOCK_PLACA,
		 neuronio_in1_enable => SYNTHESIZED_WIRE_31,
		 bias => SYNTHESIZED_WIRE_72,
		 input => INPUT,
		 peso => SYNTHESIZED_WIRE_73,
		 output => SYNTHESIZED_WIRE_74);


b2v_inst4 : neuronio_in1
PORT MAP(clock => CLOCK_PLACA,
		 neuronio_in1_enable => SYNTHESIZED_WIRE_34,
		 bias => SYNTHESIZED_WIRE_72,
		 input => SYNTHESIZED_WIRE_74,
		 peso => SYNTHESIZED_WIRE_73,
		 output => SYNTHESIZED_WIRE_65);


b2v_inst5 : neuronio_in1
PORT MAP(clock => CLOCK_PLACA,
		 neuronio_in1_enable => SYNTHESIZED_WIRE_38,
		 bias => SYNTHESIZED_WIRE_75,
		 input => SYNTHESIZED_WIRE_74,
		 peso => SYNTHESIZED_WIRE_76,
		 output => SYNTHESIZED_WIRE_66);


b2v_inst6 : neuronio_in1
PORT MAP(clock => CLOCK_PLACA,
		 neuronio_in1_enable => SYNTHESIZED_WIRE_42,
		 bias => SYNTHESIZED_WIRE_64,
		 input => SYNTHESIZED_WIRE_74,
		 peso => SYNTHESIZED_WIRE_69,
		 output => SYNTHESIZED_WIRE_67);


b2v_inst7 : neuronio_in1
PORT MAP(clock => CLOCK_PLACA,
		 neuronio_in1_enable => SYNTHESIZED_WIRE_46,
		 bias => SYNTHESIZED_WIRE_70,
		 input => SYNTHESIZED_WIRE_74,
		 peso => SYNTHESIZED_WIRE_71,
		 output => SYNTHESIZED_WIRE_68);


b2v_inst8 : neuronio_in4
PORT MAP(clock => CLOCK_PLACA,
		 neuronio_in4_enable => SYNTHESIZED_WIRE_50,
		 bias => SYNTHESIZED_WIRE_72,
		 input_0 => SYNTHESIZED_WIRE_65,
		 input_1 => SYNTHESIZED_WIRE_66,
		 input_2 => SYNTHESIZED_WIRE_67,
		 input_3 => SYNTHESIZED_WIRE_68,
		 peso => SYNTHESIZED_WIRE_73,
		 output => SYNTHESIZED_WIRE_26);


b2v_inst9 : neuronio_in4
PORT MAP(clock => CLOCK_PLACA,
		 neuronio_in4_enable => SYNTHESIZED_WIRE_57,
		 bias => SYNTHESIZED_WIRE_75,
		 input_0 => SYNTHESIZED_WIRE_65,
		 input_1 => SYNTHESIZED_WIRE_66,
		 input_2 => SYNTHESIZED_WIRE_67,
		 input_3 => SYNTHESIZED_WIRE_68,
		 peso => SYNTHESIZED_WIRE_76,
		 output => SYNTHESIZED_WIRE_27);


END bdf_type;