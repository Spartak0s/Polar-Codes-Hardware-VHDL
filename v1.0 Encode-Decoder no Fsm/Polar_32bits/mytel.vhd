library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;


entity mytel is
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
end entity;

architecture struct of mytel is

	component sat is
	port(   eisodos	: in signed (79 downto 0);
			eksodos	: out signed (39 downto 0)
			);
	end component;

	component mybpsk is
	port(   simeio : in std_logic;
			symbol : out signed (79 downto 0)
			);
	end component;


	component myawgn is
	port(   clk : in std_logic;
		rst : in std_logic;
		fre	: in std_logic;
		ready	: out std_logic;
		deigma1 : out signed (39 downto 0);
		deigma2	: out signed (39 downto 0)
		);
	end component;

	component mac is
	generic(n: integer:=40);
	port (
		clk : in std_logic;
		rst : in std_logic;
		wen1 : in std_logic;
		wen2 : in std_logic;
		a : in signed (n-1 downto 0);
		x : in signed (n-1 downto 0);
		c : in signed (2*n-1 downto 0);
		s : out signed (2*n-1 downto 0)
		);
	end component;

	component myreg is
	generic(n: integer:=40);
	port(   clk : in std_logic;
			rst : in std_logic;
			wen : in std_logic;
			eisod : in signed (n-1 downto 0);
			deigma : out signed (n-1 downto 0)
			);
	end component;

	component mydff is
	port(   clk : in std_logic;
			rst : in std_logic;
			eisod : in std_logic;
			deigma : out std_logic
			);
	end component;

	component sat51 is
	 port(   eisodos	: in signed (79 downto 0);
			 eksodos	: out signed (5 downto 0)
			 );
	end component;

	component myllr is
	port (	simeio	: in signed (39 downto 0);
			llr		: out signed (5 downto 0)
	);
	end component;

	constant miden : signed (79 downto 0):="00000000000000000000000000000000000000000000000000000000000000000000000000000000";
	signal temp_s21,temp_s22,symbol11,symbol12 : signed (79 downto 0);
	signal prosmetadosi11,prosmetadosi12,prosmetadosi21,prosmetadosi22,prosmetadosi32,prosmetadosi31: signed (79 downto 0);
	signal prosmetadosi41,prosmetadosi42,prosmetadosi51,prosmetadosi52 : signed (79 downto 0);
	signal temp_s31,temp_s41,temp_s51,temp_s32,temp_s42,temp_s52 : signed (39 downto 0);
	signal thor11,thor12,thor21,thor22 : signed (39 downto 0);
	signal symbol31,symbol32 : signed (5 downto 0);
	signal hold2,hold3,hold31,hold4,hold5,hold51,hold6,hold7,stack,simeio1,simeio2,stack2: std_logic;

begin

	hold2<=not hold;
	stack<=hold31 or hold3 or hold4;
	stack2<=hold51 or hold6;
	simeio1<=simeio(0);
	simeio2<=simeio(1);

	U_bp1:  mybpsk port map (simeio=>simeio1,
							symbol=>prosmetadosi11
							);
							
	U_bp2:  mybpsk port map (simeio=>simeio2,
							symbol=>prosmetadosi12
							);
							
	U_th1:  myawgn port map (clk=>clk,
							rst=>rst,
							fre=>hold,
							ready=>etoima,
							deigma1=>thor11,
							deigma2=>thor12
							);
							
	U_rg11:  myreg generic map (n=>80) port map (clk=>clk,
											rst=>rst,
											wen=>hold2,
											eisod=>prosmetadosi11,
											deigma=>prosmetadosi21
											);
											
	U_rg12:  myreg generic map (n=>80) port map (clk=>clk,
											rst=>rst,
											wen=>hold2,
											eisod=>prosmetadosi12,
											deigma=>prosmetadosi22
											);	
											
	U_rg71:  myreg generic map (n=>80) port map (clk=>clk,
											rst=>rst,
											wen=>hold3,
											eisod=>prosmetadosi21,
											deigma=>prosmetadosi31
											);
											
	U_rg72:  myreg generic map (n=>80) port map (clk=>clk,
											rst=>rst,
											wen=>hold3,
											eisod=>prosmetadosi22,
											deigma=>prosmetadosi32
											);
											
	U_rg91:  myreg generic map (n=>80) port map (clk=>clk,
											rst=>rst,
											wen=>hold31,
											eisod=>prosmetadosi31,
											deigma=>prosmetadosi41
											);
											
	U_rg92:  myreg generic map (n=>80) port map (clk=>clk,
											rst=>rst,
											wen=>hold31,
											eisod=>prosmetadosi32,
											deigma=>prosmetadosi42
											);
	
	U_rg93:  myreg generic map (n=>80) port map (clk=>clk,
											rst=>rst,
											wen=>hold4,
											eisod=>prosmetadosi41,
											deigma=>prosmetadosi51
											);
	U_rg94:  myreg generic map (n=>80) port map (clk=>clk,
											rst=>rst,
											wen=>hold4,
											eisod=>prosmetadosi42,
											deigma=>prosmetadosi52
											);
											
	U_rg21:  myreg generic map (n=>40) port map (clk=>clk,
											rst=>rst,
											wen=>stack,
											eisod=>thor11,
											deigma=>thor21
											);
											
	U_rg22:  myreg generic map (n=>40) port map (clk=>clk,
											rst=>rst,
											wen=>stack,
											eisod=>thor12,
											deigma=>thor22
											);
											
	U_mc11:  mac generic map (n=>40) port map (clk=>clk,
											rst=>rst,
											wen1=>hold4,
											wen2=>hold4,
											a=>sigma,
											x=>thor21,
											c=>prosmetadosi51,
											s=>temp_s21
											);
	U_mc12:  mac generic map (n=>40) port map (clk=>clk,
											rst=>rst,
											wen1=>hold4,
											wen2=>hold4,
											a=>sigma,
											x=>thor22,
											c=>prosmetadosi52,
											s=>temp_s22
											);
											
	U_sa11:  sat port map (eisodos=>temp_s21,
						eksodos=>temp_s31
						);
						
	U_sa12:  sat port map (eisodos=>temp_s22,
						eksodos=>temp_s32
						);
						
	U_rg31:  myreg generic map (n=>40) port map (clk=>clk,
											rst=>rst,
											wen=>hold5,
											eisod=>temp_s31,
											deigma=>temp_s41
											);
											
	U_rg32:  myreg generic map (n=>40) port map (clk=>clk,
											rst=>rst,
											wen=>hold5,
											eisod=>temp_s32,
											deigma=>temp_s42
											);
											
	temp_s51<=temp_s41(38 downto 0)&'0';
	temp_s52<=temp_s42(38 downto 0)&'0';
	
	U_mc21:  mac generic map (n=>40) port map (clk=>clk,
											rst=>rst,
											wen1=>stack2,
											wen2=>stack2,
											a=>temp_s51,
											x=>sigma_tetr,
											c=>miden,
											s=>symbol11
											);
											
	U_mc22:  mac generic map (n=>40) port map (clk=>clk,
											rst=>rst,
											wen1=>stack2,
											wen2=>stack2,
											a=>temp_s52,
											x=>sigma_tetr,
											c=>miden,
											s=>symbol12
											);
											
	U_sa21:  sat51 port map (eisodos=>symbol11,
						eksodos=>symbol31
						);
	
	U_sa22:  sat51 port map (eisodos=>symbol12,
						eksodos=>symbol32
						);
						
	--U_rg_llr1: myreg generic map (n=>40) port map ( clk=>clk,
	--										rst=>rst,
	--										wen=>hold6,
	--										eisod=>temp_s4,
	--										deigma=>temp_s5
	--										);
	--U_ml11:  myllr port map (	simeio=>temp_s5,
	--					llr=>symbol3
	--					);
	


	U_rg5:  mydff port map (clk=>clk,
						rst=>rst,
						eisod=>hold2,
						deigma=>hold3
						);
						
	U_rg6:  mydff port map (clk=>clk,
						rst=>rst,
						eisod=>hold3,
						deigma=>hold31
						);
	U_rg112:  mydff port map (clk=>clk,
						rst=>rst,
						eisod=>hold31,
						deigma=>hold4
						);					
	U_rg8:  mydff port map (clk=>clk,
						rst=>rst,
						eisod=>hold4,
						deigma=>hold5
						);
	U_rg113:  mydff port map (clk=>clk,
						rst=>rst,
						eisod=>hold5,
						deigma=>hold51
						);
	U_rg10:  mydff port map (clk=>clk,
						rst=>rst,
						eisod=>hold51,
						deigma=>hold6
						);
	U_rg111:  mydff port map (clk=>clk,
						rst=>rst,
						eisod=>hold6,
						deigma=>hold7
						);
						
	U_rg41:  myreg generic map (n=>6) port map (clk=>clk,
											rst=>rst,
											wen=>hold7,
											eisod=>symbol31,
											deigma=>symbol1
											);

	U_rg42:  myreg generic map (n=>6) port map (clk=>clk,
											rst=>rst,
											wen=>hold7,
											eisod=>symbol32,
											deigma=>symbol2
											);
end struct;
