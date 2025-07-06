LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

entity ROM_W is
port(
	clock : IN STD_LOGIC;
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
end ROM_W;

architecture behav OF ROM_W IS
	TYPE rom_type IS ARRAY(0 to 15)OF STD_LOGIC_VECTOR(7 DOWNTO 0);
	
	CONSTANT mem: rom_type := 
	(0 => "00000010", -- W0
	 1 => "11111111", -- W1
	 2 => "11111111",
	 3 => "11111111",
	 4 => "11111111",
	 5 => "00000011",
	 6 => "00000011",
	 7 => "00000011",
	 8 => "00000011",
	 9 => "00000110",
	 others => "00000000" -- nunca deve ser acessado	
	);
	
BEGIN

PROCESS(clock) IS
BEGIN 
	IF(RISING_EDGE(clock) AND rom_enable = '1') THEN 
		out_0 <= mem(conv_integer(unsigned(add_0)));
		out_1 <= mem(conv_integer(unsigned(add_1)));
		out_2 <= mem(conv_integer(unsigned(add_2)));
		out_3 <= mem(conv_integer(unsigned(add_3)));
	END IF;
END PROCESS;
END behav;
	
	
	
	
