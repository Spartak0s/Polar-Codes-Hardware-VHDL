library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;


entity mysystem is
port(   clk 		: in std_logic;
	rst		: in std_logic;
	dinready: in std_logic;
	datain	: in signed (1 downto 0);
	sigma1	: in signed (39 downto 0);
	sigma2	: in signed (39 downto 0);
	doutready: out std_logic;
	dataout11: out std_logic_vector (5 downto 0);
	dataout21: out std_logic_vector (5 downto 0)
		);
end entity;

architecture struct of mysystem is

	component mytel is
	port(   clk 		: in std_logic;
		rst		: in std_logic;
		simeio		: in signed (1 downto 0);
		hold		: in std_logic;
		sigma		: in signed ( 39 downto 0);
		sigma_tetr	: in signed (39 downto 0);
		etoima		: out std_logic;
		symbol1		: out signed (5 downto 0);
		symbol2		: out signed (5 downto 0)
		);
	end component;

	component myfsm3 is
	port (  clk		: in std_logic;
		rst		: in std_logic;
		dready	: in std_logic;
		mtready : in std_logic;
		stop	: out std_logic;
		mnread	: out std_logic
		);
	end component;

	component myram is
	generic( width		: natural := 32;
			 adr_length	: natural := 8
	);
	port( clk		: in std_logic;
		  wen		: in std_logic;
		  neostoix	: in  signed (width-1 downto 0);
		  address1	: in  signed (adr_length-1 downto 0);
		  address2	: in  signed (adr_length-1 downto 0);
		  stoixeio1	: out signed (width-1 downto 0);
		  stoixeio2	: out signed (width-1 downto 0)
	);
	end component;

	component myram2 is
	generic( width		: natural := 32;
			 adr_length	: natural := 8
	);
	port( clk		: in std_logic;
		  wen		: in std_logic;
		  neostoix	: in  signed (width-1 downto 0);
		  address1	: in  signed (adr_length-1 downto 0);
		  stoixeio1	: out signed (width-1 downto 0)
	);
	end component;

	signal perim,giapame,en2,en1 : std_logic;
	signal symbol1,symbol2 : signed (5 downto 0);
	signal addr21,addr22,addr1 : signed (13 downto 0);
	signal addr : signed (12 downto 0);
	signal tosend : std_logic;
	signal simeio1: signed (1 downto 0);
	signal dataout1,dataout2: signed (5 downto 0);

begin

	fsm1: myfsm3 port map (clk=>clk,
						rst=>rst,
						dready=>dinready,
						mtready=>giapame,
						stop=>perim,
						mnread=>doutready
						);
						
	tel1: mytel port map (clk=>clk,
						rst=>rst,
						simeio=>datain,
						hold=>perim,
						sigma=>sigma1,
						sigma_tetr=>sigma2,
						etoima=>giapame,
						symbol1=>symbol1,
						symbol2=>symbol2
						);
						
	dataout11<=std_logic_vector(symbol1);
	dataout21<=std_logic_vector(symbol2);

end struct;
