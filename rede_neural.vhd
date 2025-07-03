LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

entity rede_neural is
	port(
		ENTRADA, w, b : in std_logic_vector(7 DOWNTO 0);
		
		en, clk : in std_logic;
		
		SAIDA : out std_logic_vector(7 DOWNTO 0)
	);
end entity;

architecture main of rede_neural is

	component neuronio_in1 is
		port(
			clock : IN STD_LOGIC;
			neuronio_in1_enable : IN STD_LOGIC;

			bias : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			peso : IN STD_LOGIC_VECTOR(7 DOWNTO 0);	
			input : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			
			output : OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
		);
	end component;
	
begin 
	
	N : neuronio_in1 port map(clock => clk, neuronio_in1_enable => en, bias => b, peso => w, input => ENTRADA, output => SAIDA);
end main;