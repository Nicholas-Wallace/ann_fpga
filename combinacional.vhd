LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

entity combinacional is
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
		en_n30_comb : out std_logic;
		
		NS : out std_logic_vector(3 DOWNTO 0)
	);
end combinacional;
	
architecture main of combinacional is
begin 
		
		NS(3) <= ((not S(3)) and S(2) and S(1) and S(0)) or (S(3) and (not S(2)) and (not S(1)) and (not S(0))) or (S(3) and (not S(2)) and (not S(1)) and S(0));
		NS(2) <= ((not S(3)) and (not S(2)) and S(1) and S(0)) or ((not S(3)) and S(2) and (not S(1)) and (not S(0))) or ((not S(3)) and S(2) and (not S(1)) and S(0)) or ((not S(3)) and S(2) and S(1) and (not S(0)));
		NS(1) <= (en_comb and (not S(3)) and (not S(2)) and (not S(1)) and S(0)) or ((not S(3)) and (not S(2)) and S(1) and (not S(0))) or ((not S(3)) and S(2) and (not S(1)) and S(0)) or ((not S(3)) and S(2) and S(1) and (not S(0))) or (S(3) and (not S(2)) and (not S(1)) and S(0));
		NS(0) <= ((not S(3)) and (not S(2)) and (not S(1)) and (not S(0))) or ((not en_comb) and (not S(3)) and (not S(2)) and (not S(1)) and S(0)) or ((not S(3)) and (not S(2)) and S(1) and (not S(0))) or ((not S(3)) and S(2) and (not S(1)) and (not S(0))) or ((not S(3)) and S(2) and S(1) and (not S(0))) or (S(3) and (not S(2)) and (not S(1)) and (not S(0))) or (S(3) and (not S(2)) and S(1) and (not S(0)));
		
		en_ROM_W_comb <= ((not S(3)) and (not S(2)) and S(1) and (not S(0))) or ((not S(3)) and S(2) and (not S(1)) and (not S(0))) or ((not S(3)) and S(2) and S(1) and (not S(0))) or (S(3) and (not S(2)) and (not S(1)) and (not S(0)));
		en_ROM_B_comb <= ((not S(3)) and (not S(2)) and S(1) and (not S(0))) or ((not S(3)) and S(2) and (not S(1)) and (not S(0))) or ((not S(3)) and S(2) and S(1) and (not S(0))) or (S(3) and (not S(2)) and (not S(1)) and (not S(0)));
		
		en_n00_comb <= ((not S(3)) and S(2) and (not S(1)) and (not S(0)));
		
		en_n10_comb <= ((not S(3)) and S(2) and S(1) and (not S(0)));
		en_n11_comb <= ((not S(3)) and S(2) and S(1) and (not S(0)));
		en_n12_comb <= ((not S(3)) and S(2) and S(1) and (not S(0)));
		en_n13_comb <= ((not S(3)) and S(2) and S(1) and (not S(0)));
		
		en_n20_comb <= (S(3) and (not S(2)) and (not S(1)) and (not S(0)));
		en_n21_comb <= (S(3) and (not S(2)) and (not S(1)) and (not S(0)));
		en_n22_comb <= (S(3) and (not S(2)) and (not S(1)) and (not S(0)));
		en_n23_comb <= (S(3) and (not S(2)) and (not S(1)) and (not S(0)));
		
		en_n30_comb <= (S(3) and (not S(2)) and S(1) and (not S(0)));
		
		add_W0_comb(0) <= ((not S(3)) and S(2) and (not S(1)) and (not S(0))) or ((not S(3)) and S(2) and S(1) and (not S(0))) or (S(3) and (not S(2)) and (not S(1)) and (not S(0)));
		add_W0_comb(1) <= '0';
		add_W0_comb(2) <= ((not S(3)) and S(2) and S(1) and (not S(0)));
		add_W0_comb(3) <= (S(3) and (not S(2)) and (not S(1)) and (not S(0)));
		
		add_B0_comb(0) <= ((not S(3)) and S(2) and (not S(1)) and (not S(0))) or ((not S(3)) and S(2) and S(1) and (not S(0))) or (S(3) and (not S(2)) and (not S(1)) and (not S(0)));
		add_B0_comb(1) <= '0';
		add_B0_comb(2) <= ((not S(3)) and S(2) and S(1) and (not S(0)));
		add_B0_comb(3) <= (S(3) and (not S(2)) and (not S(1)) and (not S(0)));
		
		add_W1_comb(0) <= '0';
		add_W1_comb(1) <= ((not S(3)) and S(2) and (not S(1)) and (not S(0))) or ((not S(3)) and S(2) and S(1) and (not S(0)));
		add_W1_comb(2) <= ((not S(3)) and S(2) and S(1) and (not S(0)));
		add_W1_comb(3) <= '0';
		
		add_B1_comb(0) <= '0';
		add_B1_comb(1) <= ((not S(3)) and S(2) and (not S(1)) and (not S(0))) or ((not S(3)) and S(2) and S(1) and (not S(0)));
		add_B1_comb(2) <= ((not S(3)) and S(2) and S(1) and (not S(0)));
		add_B1_comb(3) <= '0';
		
		add_W2_comb(0) <= ((not S(3)) and S(2) and (not S(1)) and (not S(0))) or ((not S(3)) and S(2) and S(1) and (not S(0)));
		add_W2_comb(1) <= ((not S(3)) and S(2) and (not S(1)) and (not S(0))) or ((not S(3)) and S(2) and S(1) and (not S(0)));
		add_W2_comb(2) <= ((not S(3)) and S(2) and S(1) and (not S(0)));
		add_W2_comb(3) <= '0';
		
		add_B2_comb(0) <= ((not S(3)) and S(2) and (not S(1)) and (not S(0))) or ((not S(3)) and S(2) and S(1) and (not S(0)));
		add_B2_comb(1) <= ((not S(3)) and S(2) and (not S(1)) and (not S(0))) or ((not S(3)) and S(2) and S(1) and (not S(0)));
		add_B2_comb(2) <= ((not S(3)) and S(2) and S(1) and (not S(0)));
		add_B2_comb(3) <= '0';
		
		add_W3_comb(0) <= '0';
		add_W3_comb(1) <= '0';
		add_W3_comb(2) <= ((not S(3)) and S(2) and (not S(1)) and (not S(0)));
		add_W3_comb(3) <= ((not S(3)) and S(2) and S(1) and (not S(0)));
		
		add_B3_comb(0) <= '0';
		add_B3_comb(1) <= '0';
		add_B3_comb(2) <= ((not S(3)) and S(2) and (not S(1)) and (not S(0)));
		add_B3_comb(3) <= ((not S(3)) and S(2) and S(1) and (not S(0)));
		
end main;
			
	
	
	
	
	
	
	
	
	
