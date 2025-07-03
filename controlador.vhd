LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

entity controlador is
	port(
		en : in std_logic;
		S : in std_logic_vector(3 DOWNTO 0);
		
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
		
		NS : out std_logic_vector(3 DOWNTO 0)
	);
end controlador;
	
architecture main of controlador is
	component reg_estados is
		port( A_REG : in std_logic_vector(3 downto 0);
				clk : in std_logic;
				en : in std_logic;
				S_REG : out std_logic_vector(3 downto 0)
		);
		
		NS(0) <= (not S0 and S1 and S2 and S3) or (S0 and (not S1) and (not S2) and (not S3)) or (S0 and (not S1) and (not S2) and S3);
		NS(1) <= ((not SO) (not S1) S2 S3 or (not SO) S1 (not S2) (not S3) or (not SO) S1 (not S2) S3 or (not SO) S1 S2 (not S3);
		NS(2) <= ((not SO) (not S1) (not S2) S3) or ((not SO) (not S1) S2 (not S3)) or ((not SO) S1 (not S2) S3) or ((not SO) S1 S2 (not S3)) or (S0 (not S1) (not S2) S3);
		NS(3) <= ((not SO) (not S1) (not S2) (not S3)) or ((not SO) (not S1) (not S2) S3) or ((not SO) (not S1) S2 (not S3)) or ((not SO) S1 (not S2) (not S3)) or ((not SO) S1 S2 (not S3)) or (S0 (not S1) (not S2) (not S3)) or (S0 (not S1) S2 (not S3));
		
		en_ROM_W <= ((not S0) (not S1) S2 (not S3)) or ((not S0) S1 (not S2) (not S3)) or ((not S0) S1 S2 (not S3)) or (S0 (not S1) (not S2) (not S3));
		en_ROM_B <= ((not S0) (not S1) S2 (not S3)) or ((not S0) S1 (not S2) (not S3)) or ((not S0) S1 S2 (not S3)) or (S0 (not S1) (not S2) (not S3)) ;
		
		en_n00 <= ((not S0) S1 (not S2) (not S3));
		
		en_n10 <= ((not S0) S1 S2 (not S3));
		en_n11 <= ((not S0) S1 S2 (not S3));
		en_n12 <= ((not S0) S1 S2 (not S3));
		en_n13 <= ((not S0) S1 S2 (not S3));
		
		en_n20 <= (S0 (not S1) (not S2) (not S3));
		en_n21 <= (S0 (not S1) (not S2) (not S3));
		en_n22 <= (S0 (not S1) (not S2) (not S3));
		en_n23 <= (S0 (not S1) (not S2) (not S3));
		
		add_W0(0) <= ((not S0) S1 (not S2) (not S3)) or ((not S0) S1 S2 (not S3)) or (S0 (not S1) (not S2) (not S3));
		add_W0(1) <= '0';
		add_W0(2) <= ((not S0) S1 S2 (not S3));
		add_W0(3) <= (S0 (not S1) (not S2) (not S3));
		
		add_B0(0) <= ((not S0) S1 (not S2) (not S3)) or ((not S0) S1 S2 (not S3)) or (S0 (not S1) (not S2) (not S3));
		add_B0(1) <= '0';
		add_B0(2) <= ((not S0) S1 S2 (not S3));
		add_B0(3) <= (S0 (not S1) (not S2) (not S3));
		
		add_W1(0) <= '0';
		add_W1(1) <= ((not S0) S1 (not S2) (not S3)) or ((not S0) S1 S2 (not S3));
		add_W1(2) <= ((not S0) S1 S2 (not S3));
		add_W1(3) <= '0';
		
		add_B1(0) <= '0';
		add_B1(1) <= ((not S0) S1 (not S2) (not S3)) or ((not S0) S1 S2 (not S3));
		add_B1(2) <= ((not S0) S1 S2 (not S3));
		add_B1(3) <= '0';
		
		add_W2(0) <= ((not S0) S1 (not S2) (not S3)) or ((not S0) S1 S2 (not S3));
		add_W2(1) <= ((not S0) S1 (not S2) (not S3)) or ((not S0) S1 S2 (not S3));
		add_W2(2) <= ((not S0) S1 S2 (not S3));
		add_W2(3) <= '0';
		
		add_B2(0) <= ((not S0) S1 (not S2) (not S3)) or ((not S0) S1 S2 (not S3));
		add_B2(1) <= ((not S0) S1 (not S2) (not S3)) or ((not S0) S1 S2 (not S3));
		add_B2(2) <= ((not S0) S1 S2 (not S3));
		add_B2(3) <= '0';
		
		add_W3(0) <= '0';
		add_W3(1) <= '0';
		add_W3(2) <= ((not S0) S1 (not S2) (not S3));
		add_W3(3) <= ((not S0) S1 S2 (not S3));
		
	end component;
			
	
	
	
	
	
	
	
	
	