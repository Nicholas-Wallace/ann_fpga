LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

entity ROM is
port(
	clock : IN STD_LOGIC;
	rom_enable : IN STD_LOGIC;
	address : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
	data_output : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
);
end ROM;

architecture behav OF ROM IS
	TYPE rom_type IS ARRAY(0 to 35)OF STD_LOGIC_VECTOR(7 DOWNTO 0);
	
	CONSTANT mem: rom_type := 
	(0 => "00000001", -- W0
	 1 => "00000001", -- W1
	 2 => "00000001",
	 3 => "00000001",
	 5 => "00000001",
	 6 => "00000001",
	 7 => "00000001",
	 8 => "00000001",
	 9 => "00000001",
	 10 => "00000001",
	 11 => "00000001",
	 12 => "00000001",
	 13 => "00000001",
	 14 => "00000001",
	 15 => "00000001",
	 16 => "00000001",
	 17 => "00000001",
	 18 => "00000001",
	 19 => "00000001",
	 20 => "00000001",
	 21 => "00000001",
	 22 => "00000001",
	 23 => "00000001",
	 24 => "00000001",
	 25 => "00000000", -- BIAS 0
	 26 => "00000000",
	 27 => "00000000",
	 28 => "00000000",
	 29 => "00000000",
	 30 => "00000000",
	 31 => "00000000",
	 32 => "00000000",
	 33 => "00000000",
	 34 => "00000000",
	 others => "00000000" -- nunca deve ser acessado	
	);
	
BEGIN

PROCESS(clock) IS
BEGIN 
	IF(RISING_EDGE(clock) AND rom_enable = '1') THEN 
		data_output <= mem(conv_integer(unsigned(address)));
	END IF;
END PROCESS;
END behav;
	
	
	
	