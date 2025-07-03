LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

entity neuronio_in1 is
port(
	clock : IN STD_LOGIC;
	neuronio_in1_enable : IN STD_LOGIC;

	bias : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	peso : IN STD_LOGIC_VECTOR(7 DOWNTO 0);	
	input : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	
	output : OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
);

end neuronio_in1;

architecture main of neuronio_in1 is

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

	signal WxI, soma_bias, result_func : STD_LOGIC_VECTOR(7 DOWNTO 0);

begin

	M : mult port map(A => input, B => peso, Produto => WxI);
	A : adder port map(A_ADDER => WxI, B_ADDER => bias, S_ADDER => soma_bias);
	F : func port map(E => soma_bias, O =>result_func);
	REG_N : reg port map( A_REG => result_func, clk => clock, en => neuronio_in1_enable, S_REG => output);

end architecture main;








	