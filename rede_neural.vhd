LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

entity rede_neural is
	port(
		ENTRADA : in std_logic_vector(7 DOWNTO 0);
		
		en, clk_placa : in std_logic;
		
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
	
	component controlador is
	port(
		en_contr : in std_logic;
		clock : in std_logic;
		
		-----------------------------------------
	
		add_W0 : out std_logic_vector(3 DOWNTO 0);
		add_W1 : out std_logic_vector(3 DOWNTO 0);
		add_W2 : out std_logic_vector(3 DOWNTO 0);
		add_W3 : out std_logic_vector(3 DOWNTO 0);
		
		add_B0 : out std_logic_vector(3 DOWNTO 0);
		add_B1 : out std_logic_vector(3 DOWNTO 0);
		add_B2 : out std_logic_vector(3 DOWNTO 0);
		add_B3 : out std_logic_vector(3 DOWNTO 0);
		
		en_ROM_W : out std_logic;
		en_ROM_B : out std_logic;
		
		en_n00 : out std_logic;
		en_n10 : out std_logic;
		en_n11 : out std_logic;
		en_n12 : out std_logic;
		en_n13 : out std_logic;
		en_n20 : out std_logic;
		en_n21 : out std_logic;
		en_n22 : out std_logic;
		en_n23 : out std_logic;
		en_n30 : out std_logic;
		
		------ debug -------
		state : out std_logic_vector(3 DOWNTO 0)
	);
	end component;
	
	component ROM_B is
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
	end ROM_B;
	
	component ROM_W is
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
	
	component neuronio_in1 is
	port(
		clock : IN STD_LOGIC;
		neuronio_in1_enable : IN STD_LOGIC;

		bias : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		peso : IN STD_LOGIC_VECTOR(7 DOWNTO 0);	
		input : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		
		output : OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
	end neuronio_in1;
	
	component neuronio_in4 is
		port(
			clock : IN STD_LOGIC;
			neuronio_in4_enable : IN STD_LOGIC;

			bias : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			
			peso : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			
			input_0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			input_1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			input_2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			input_3 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			
			output : OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
		);
	end neuronio_in4;
		
signal N00_SIGNAL, N10_SIGNAL, N11_SIGNAL, N12_SIGNAL, N13_SIGNAL, N20_SIGNAL, N21_SIGNAL, N22_SIGNAL, N23_SIGNAL : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal en_00_SINAL, en_10_SIGNAL, en_11_SIGNAL, en_12_SIGNAL, en_13_SIGNAL, en_20_SIGNAL, en_21_SIGNAL, en_22_SIGNAL, en_23_SIGNAL en_30_SIGNAL : STD_LOGIC;
signal W_0, W_1, W_2, W_3, B_0, B_1, B_2, B_3 : STD_LOGIC_VECTOR(7 DOWNTO 0);
	
begin 
	
	N00 : neuronio_in1 port map(clock => clk_placa, neuronio_in1_enable => en_00_SINAL , bias => B_0, peso => W_0, input => ENTRADA, output => N00_SIGNAL);
	
	N10 : neuronio_in1 port map(clock => clk_placa, neuronio_in1_enable => en_10_SIGNAL , bias => B_0, peso => W_0, input => N00_SIGNAL, output => N10_SIGNAL);
	N11 : neuronio_in1 port map(clock => clk_placa, neuronio_in1_enable => en_11_SIGNAL , bias => B_1, peso => W_1, input => N00_SIGNAL, output => N11_SIGNAL);
	N12 : neuronio_in1 port map(clock => clk_placa, neuronio_in1_enable => en_12_SIGNAL , bias => B_2, peso => W_2, input => N00_SIGNAL, output => N12_SIGNAL);
	N13 : neuronio_in1 port map(clock => clk_placa, neuronio_in1_enable => en_13_SIGNAL , bias => B_3, peso => W_3, input => N00_SIGNAL, output => N13_SIGNAL);
	
	N20 : neuronio_in4 port map(clock => clk_placa, neuronio_in4_enable => en_20_SIGNAL , bias => B_0, peso => W_0, input_0 => N00_SIGNAL,
																																				input_1 => N11_SIGNAL,
																																				input_2 => N12_SIGNAL,
																																				input_3 => N13_SIGNAL,
																																				output => N20_SIGNAL);
																																				
	N21 : neuronio_in4 port map(clock => clk_placa, neuronio_in4_enable => en_21_S , bias => B_1, peso => W_1, input_0 => N00_SIGNAL,
																																				input_1 => N11_SIGNAL,
																																				input_2 => N12_SIGNAL,
																																				input_3 => N13_SIGNAL,
																																				output => N21_SIGNAL);
																																				
	N22 : neuronio_in4 port map(clock => clk_placa, neuronio_in4_enable => en_22_SIGNAL , bias => B_2, peso => W_2, input_0 => N00_SIGNAL,
																																				input_1 => N11_SIGNAL,
																																				input_2 => N12_SIGNAL,
																																				input_3 => N13_SIGNAL, 
																																				output => N22_SIGNAL);
																																				
	N23 : neuronio_in4 port map(clock => clk_placa, neuronio_in4_enable => en_23_SIGNAL , bias => B_3, peso => W_3, input_0 => N00_SIGNAL,
																																				input_1 => N11_SIGNAL,
																																				input_2 => N12_SIGNAL,
																																				input_3 => N13_SIGNAL, 
																																				output => N23_SIGNAL);
	
	N30 :  neuronio_in1 port map(clock => clk_placa, neuronio_in1_enable => en_30_SIGNAL , bias => B_0, peso => W_0, input_0 => N20_SIGNAL,
																																				input_1 => N21_SIGNAL,
																																				input_2 => N22_SIGNAL,
																																				input_3 => N23_SIGNAL, 
																																				output => SAIDA);
	
end main;
