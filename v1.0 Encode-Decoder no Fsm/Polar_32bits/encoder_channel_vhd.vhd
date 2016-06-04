library ieee;
library Encoder_2K_mqam;
use Encoder_2K_mqam.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;


entity encoder_top_entity is 
port (clk:in std_logic;
	rst:in std_logic;
	snr:in std_logic_vector(5 downto 0);
	feedbk:in std_logic;
	lfsr_out1:out std_logic_vector(7 downto 0);
	fram_pass:out std_logic_vector(31 downto 0);
	data_for_dec:out std_logic_vector(31 downto 0);
	lfsr_init_state:out std_logic_vector(31 downto 0));
end encoder_top_entity;



architecture struct of encoder_top_entity is


component encoder is 
port (clk:in std_logic;
	rst:in std_logic;
	snr:in std_logic_vector(5 downto 0);
	dec_fin1:in std_logic;
	start:in std_logic;
	lfsr_out1:out std_logic_vector(7 downto 0);
	fram_pass:out std_logic_vector(35 downto 0);
	doutready:out std_logic;
	dfordec1:out std_logic_vector(5 downto 0);
	dfordec2:out std_logic_vector(5 downto 0));
	--lfsr_init_state:out std_logic_vector(7 downto 0));
end component;

component uutfsm is
port (  clk		: in std_logic;
		rst		: in std_logic;
		feedbk:in std_logic;
		dec_fin:out std_logic;
		conti	: out std_logic
);
end component;

component mydff is
port(   clk : in std_logic;
		rst : in std_logic;
		eisod : in std_logic;
		deigma : out std_logic
		);
end component;

component myreg3 is
generic(n: integer:=40);
port(   clk : in std_logic;
		rst : in std_logic;
		eisod : in std_logic_vector (n-1 downto 0);
		deigma : out std_logic_vector (n-1 downto 0)
		);
end component;

signal rst1, start,decoder_fin,doutready1:std_logic;
signal dllr0,dllr1:std_logic_vector(5 downto 0);
signal fram_pass_temp:std_logic_vector(35 downto 0);
--signal lfsr_out1_temp:std_logic_vector(7 downto 0);
--signal lfsr_init_state_temp: std_logic_vector(31 downto 0); 


begin


	rst1<= not rst;

	
	U_fm1 : uutfsm port map (clk=>clk,
				rst=>rst1,
				feedbk=>feedbk,
				dec_fin=>decoder_fin,
				conti=>start
				);


	U_enc: encoder port map(clk=>clk,
				rst=>rst1,
				snr=>snr,
				dec_fin1=>decoder_fin,
				start=>start,
				lfsr_out1=>lfsr_out1,
				fram_pass=>fram_pass_temp,
				doutready=>doutready1,
				dfordec1=>dllr0,
				dfordec2=>dllr1);
				--lfsr_init_state=>lfsr_init_state_temp);

fram_pass<=fram_pass_temp(31 downto 0);
data_for_dec<="0000000000000000000"&dllr0&dllr1&doutready1;
--lfsr_init_state<="000000000000000000000000"&lfsr_init_state_temp;
--doutready<=doutready1;
	
end struct;
