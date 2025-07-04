LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

entity controlador is
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
end entity;

architecture main of controlador is

component combinacional is
	port(
		en_comb : in std_logic;
		S : in std_logic_vector(3 DOWNTO 0);
		
		-----------------------------------------
		
		add_W0_comb : out std_logic_vector(3 DOWNTO 0);
		add_W1_comb : out std_logic_vector(3 DOWNTO 0);
		add_W2_comb : out std_logic_vector(3 DOWNTO 0);
		add_W3_comb : out std_logic_vector(3 DOWNTO 0);
		
		add_B0_comb : out std_logic_vector(3 DOWNTO 0);
		add_B1_comb : out std_logic_vector(3 DOWNTO 0);
		add_B2_comb : out std_logic_vector(3 DOWNTO 0);
		add_B3_comb : out std_logic_vector(3 DOWNTO 0);
		
		en_ROM_W_comb : out std_logic;
		en_ROM_B_comb : out std_logic;
		
		en_n00_comb : out std_logic;
		en_n10_comb : out std_logic;
		en_n11_comb : out std_logic;
		en_n12_comb : out std_logic;
		en_n13_comb : out std_logic;
		en_n20_comb : out std_logic;
		en_n21_comb : out std_logic;
		en_n22_comb : out std_logic;
		en_n23_comb : out std_logic;
		en_n30_comb: out std_logic;
		
		NS : out std_logic_vector(3 DOWNTO 0)
	);
end component;

component reg_estados is
		port( A_REG : in std_logic_vector(3 downto 0);
				clk : in std_logic;
				en_REG : in std_logic;
				S_REG : out std_logic_vector(3 downto 0)
		);
end component;

signal NS_SIGNAL, S_SIGNAL : std_logic_vector(3 downto 0);

begin 
	
	state <= S_SIGNAL;
	
	C : combinacional port map(en_comb => en_contr, S => S_SIGNAL, NS => NS_SIGNAL, add_W0_comb => add_W0, add_W1_comb => add_W1, add_W2_comb => add_W2, add_W3_comb => add_W3,
																		 add_B0_comb => add_B0, add_B1_comb => add_B1, add_B2_comb => add_B2, add_B3_comb => add_B3,
																		 en_ROM_B_comb => en_ROM_B, en_ROM_W_comb => en_ROM_W,
																		 en_n00_comb => en_n00,
																		 en_n10_comb => en_n10, en_n11_comb => en_n11, en_n12_comb => en_n12, en_n13_comb => en_n13,
																		 en_n20_comb => en_n20, en_n21_comb => en_n21, en_n22_comb => en_n22, en_n23_comb => en_n23,
																		 en_n30_comb => en_n30);
	R : reg_estados port map(A_REG => NS_SIGNAL, clk => clock, en_REG => '1', S_REG => S_SIGNAL);
end main;















