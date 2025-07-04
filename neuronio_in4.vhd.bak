LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

entity neuronio_in4 is
port(
	clock : IN STD_LOGIC;
	neuronio_in4_enable : IN STD_LOGIC;

	bias : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	
	peso_0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	peso_1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	peso_2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	peso_3 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	
	input_0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	input_1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	input_2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	input_3 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	
	output : OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
);

end neuronio_in4;

architecture main of neuronio_in4 is

	component adder is
		port(
			A_ADDER, B_ADDER : in std_logic_vector(7 downto 0);
			S_ADDER : out std_logic_vector(7 downto 0)
		);
	end component;

	component reg is
	port( A_REG : in std_logic_vector(7 downto 0);
			clk : in std_logic;
			en : in std_logic;
			S_REG : out std_logic_vector(7 downto 0)
	);
	end component;
	
	component func is
		port(
		E : in std_logic_vector(7 downto 0);
		O : out std_logic_vector(7 downto 0)
		);
	end component;
	
	component mult is
	port(
		A, B : in std_logic_vector(7 downto 0);
		Produto : out std_logic_vector(7 downto 0)
	);
end component;

	signal W0xI0, W1xI1, W2xI2, W3xI3, S01, S23, S0123, soma_bias, result_func : STD_LOGIC_VECTOR(7 DOWNTO 0);

begin

	M0 : mult port map(A => input_0, B => peso_0, Produto => W0xI0);
	M1 : mult port map(A => input_1, B => peso_1, Produto => W1xI1);
	M2 : mult port map(A => input_2, B => peso_2, Produto => W2xI2);
	M3 : mult port map(A => input_3, B => peso_3, Produto => W3xI3);
	
	A01 : adder port map(A_ADDER => W0xI0, B_ADDER => W1xI1, S_ADDER => S01);
	A23 : adder port map(A_ADDER => W2xI2, B_ADDER => W3xI3, S_ADDER => S23);
	
	A0123: adder port map(A_ADDER => S01, B_ADDER => S23, S_ADDER => S0123);
	
	A_BIAS : adder port map(A_ADDER => S0123, B_ADDER => bias, S_ADDER => soma_bias);
	
	F : func port map(E => soma_bias, O =>result_func);
	REG_N : reg port map( A_REG => result_func, clk => clock, en => neuronio_in4_enable, S_REG => output);

end architecture main;








	