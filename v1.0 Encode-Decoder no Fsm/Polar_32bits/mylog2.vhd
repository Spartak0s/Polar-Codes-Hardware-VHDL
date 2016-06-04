library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

entity mylog2 is
port(	clk		: in std_logic;
		rst		: in std_logic;
		wen		: in std_logic;
		eisodos	: in signed (31 downto 0);
		eksodos	: out signed (39 downto 0)
	);
end mylog2;

architecture struct of mylog2 is

	component ldzcount is
	port ( 	x: in signed (31 downto 0);
		k: out signed (5 downto 0);
		k2: out signed (5 downto 0));
	end component;

	component shifting is
	generic (N: integer:=8);
	port (  arithmos: in signed (N-1 downto 0);
		theseis:in signed (N-2 downto 0);
		eksodos: out signed (N-1 downto 0) );
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

	component sat is
	port(   eisodos	: in signed (79 downto 0);
			eksodos	: out signed (39 downto 0)
			);
	end component;

	component synt1 is
	port( 
		  address1	: in signed (5 downto 0);
		  stoixeio1	: out signed (80-1 downto 0)
	);
	end component;

	component synt2 is
	port( 
		  address1	: in signed (5 downto 0);
		  stoixeio1	: out signed (80-1 downto 0)
	);
	end component;

	component synt3 is
	port( 
		  address1	: in signed (5 downto 0);
		  stoixeio1	: out signed (80-1 downto 0)
	);
	end component;

	component synt4 is
	port( 
		  address1	: in signed (5 downto 0);
		  stoixeio1	: out signed (80-1 downto 0)
	);
	end component;

	component synt5 is
	port( 
		  address1	: in signed (5 downto 0);
		  stoixeio1	: out signed (40-1 downto 0)
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

	signal plithos,plithos3,plithos31,plithos32,plithos4,plithos5,plithos6,plithos61 : signed (5 downto 0);
	signal plith2,plith3,plith4,plith21,plith22,plith31,plith32,plith41,plith42 : signed (5 downto 0);
	signal x1,eisodos1: signed (32 downto 0);
	signal plithos2,eisodos2,eisod,eisod1 : signed (31 downto 0);
	signal x,x2,x3,eis3,eis4,eis5,eis31,eis32,eis41,eis42,eis51,temp5,x11 : signed (39 downto 0);
	signal temp1,temp2,temp3,temp4,a1,a2,a3,a4: signed (79 downto 0);
	signal foo1,foo2,foo3,a5 :signed (39 downto 0);
	constant ena: signed (39 downto 0):="0000000100000000000000000000000000000000";
	signal reged1,reged2,reged3 : signed (39 downto 0);

begin

	U_re35:  myreg generic map (n=>32) port map (clk=>clk,
											rst=>rst,
											wen=>wen,
											eisod=>eisodos,
											deigma=>eisod
											);

	U_ldz1:  ldzcount port map (x=>eisod,
							k=>plithos,
							k2=>plithos4
							);

	eisodos1<='0'& eisodos2;
	plithos2<="00000000000000000000000000"&plithos5;
	x2<="0000000" & x1;
	x11<=x2-ena;
	
	U_re28:  myreg generic map (n=>40) port map (clk=>clk,
											rst=>rst,
											wen=>wen,
											eisod=>x11,
											deigma=>x
											);
	plithos61<=plithos-1;
	
	U_re36:  myreg generic map (n=>6) port map (clk=>clk,
											rst=>rst,
											wen=>wen,
											eisod=>plithos61,
											deigma=>plithos6
											);

	U_re01:  myreg generic map (n=>6) port map (clk=>clk,
											rst=>rst,
											wen=>wen,
											eisod=>plithos4,
											deigma=>plithos5
											);
											
	U_re02:  myreg generic map (n=>6) port map (clk=>clk,
											rst=>rst,
											wen=>wen,
											eisod=>plithos6,
											deigma=>plithos3
											);
											
	U_re03:  myreg generic map (n=>32) port map (clk=>clk,
											rst=>rst,
											wen=>wen,
											eisod=>eisod,
											deigma=>eisodos2
											);
											
	U_shi1:  shifting generic map (n=>33) port map (arithmos=>eisodos1,
												theseis=>plithos2,
												eksodos=>x1
												);
												
	U_syn5:  synt5 port map (address1=>plithos3,
							stoixeio1=>a5
							);
							
	U_re04:  myreg generic map (n=>6) port map (clk=>clk,
											rst=>rst,
											wen=>wen,
											eisod=>plithos3,
											deigma=>plithos31
											);
	U_rg20: myreg generic map (n=>6) port map (clk=>clk,
												rst=>rst,
												wen=>wen,
												eisod=>plithos31,
												deigma=>plithos32
												);
												
	U_syn4:  synt4 port map (address1=>plithos32,
							stoixeio1=>a4
							);
							
	U_ma1:  mac generic map (n=>40)  port map (clk=>clk,
											rst=>rst,
											wen1=>wen,
											wen2=>wen,
											a=>a5,
											x=>x,
											c=>a4,
											s=>temp1
											);
											
	U_rg21:	myreg generic map (n=>40) port map (clk=>clk,
												rst=>rst,
												wen=>wen,
												eisod=>x,
												deigma=>x3
												);
												
	U_sa1:  sat port map (eisodos=>temp1,
						eksodos=>foo1
						);
						
	U_re05:  myreg generic map (n=>40) port map (clk=>clk,
											rst=>rst,
											wen=>wen,
											eisod=>foo1,
											deigma=>reged1
											);
											
	U_re06:  myreg generic map (n=>40) port map (clk=>clk,
											rst=>rst,
											wen=>wen,
											eisod=>x3,
											deigma=>eis3
											);
											
	U_re07:  myreg generic map (n=>40) port map (clk=>clk,
											rst=>rst,
											wen=>wen,
											eisod=>eis3,
											deigma=>eis31
											);
											
	U_re08:  myreg generic map (n=>6) port map (clk=>clk,
											rst=>rst,
											wen=>wen,
											eisod=>plithos32,
											deigma=>plith2
											);
											
	U_re09:  myreg generic map (n=>6) port map (clk=>clk,
											rst=>rst,
											wen=>wen,
											eisod=>plith2,
											deigma=>plith21
											);
											
	U_rg22:	myreg generic map (n=>6) port map (clk=>clk,
												rst=>rst,
												wen=>wen,
												eisod=>plith21,
												deigma=>plith22
												);	
												
	U_syn3:  synt3 port map (address1=>plith22,
							stoixeio1=>a3
							);
				
	U_ma2:  mac generic map (n=>40)  port map (clk=>clk,
											rst=>rst,
											wen1=>wen,
											wen2=>wen,
											a=>reged1,
											x=>eis31,
											c=>a3,
											s=>temp2
											);
	
	U_rg23:	myreg generic map (n=>40) port map (clk=>clk,
												rst=>rst,
												wen=>wen,
												eisod=>eis31,
												deigma=>eis32
												);
											
	U_sa2:  sat port map (eisodos=>temp2,
						eksodos=>foo2
						);
						
	U_re10:  myreg generic map (n=>40) port map (clk=>clk,
											rst=>rst,
											wen=>wen,
											eisod=>foo2,
											deigma=>reged2
											);
											
	U_re11:  myreg generic map (n=>40) port map (clk=>clk,
											rst=>rst,
											wen=>wen,
											eisod=>eis32,
											deigma=>eis4
											);
											
	U_re12:  myreg generic map (n=>40) port map (clk=>clk,
											rst=>rst,
											wen=>wen,
											eisod=>eis4,
											deigma=>eis41
											);
											
	U_re13:  myreg generic map (n=>6) port map (clk=>clk,
											rst=>rst,
											wen=>wen,
											eisod=>plith22,
											deigma=>plith3
											);
											
	U_re14:  myreg generic map (n=>6) port map (clk=>clk,
											rst=>rst,
											wen=>wen,
											eisod=>plith3,
											deigma=>plith31
											);
											
	U_rg24:	myreg generic map (n=>6) port map (clk=>clk,
												rst=>rst,
												wen=>wen,
												eisod=>plith31,
												deigma=>plith32
												);
												
	U_syn2:  synt2 port map (address1=>plith32,
							stoixeio1=>a2
							);
												
	U_ma3:  mac generic map (n=>40)  port map (clk=>clk,
											rst=>rst,
											wen1=>wen,
											wen2=>wen,
											a=>reged2,
											x=>eis41,
											c=>a2,
											s=>temp3
											);
	U_rg25:	myreg generic map (n=>40) port map (clk=>clk,
												rst=>rst,
												wen=>wen,
												eisod=>eis41,
												deigma=>eis42
												);										
	U_sa3:  sat port map (eisodos=>temp3,
						eksodos=>foo3
						);
						
	U_re15:  myreg generic map (n=>40) port map (clk=>clk,
											rst=>rst,
											wen=>wen,
											eisod=>foo3,
											deigma=>reged3
											);
											
	U_re16:  myreg generic map (n=>40) port map (clk=>clk,
											rst=>rst,
											wen=>wen,
											eisod=>eis42,
											deigma=>eis5
											);
											
	U_re17:  myreg generic map (n=>40) port map (clk=>clk,
											rst=>rst,
											wen=>wen,
											eisod=>eis5,
											deigma=>eis51
											);
											
	U_re18:  myreg generic map (n=>6) port map (clk=>clk,
											rst=>rst,
											wen=>wen,
											eisod=>plith32,
											deigma=>plith4
											);
											
	U_re19:  myreg generic map (n=>6) port map (clk=>clk,
											rst=>rst,
											wen=>wen,
											eisod=>plith4,
											deigma=>plith41
											);
											
	U_rg26:	myreg generic map (n=>6) port map (clk=>clk,
												rst=>rst,
												wen=>wen,
												eisod=>plith41,
												deigma=>plith42
												);

											
	U_syn1:  synt1 port map (address1=>plith42,
							stoixeio1=>a1
							);												
	U_ma4:  mac generic map (n=>40)  port map (clk=>clk,
											rst=>rst,
											wen1=>wen,
											wen2=>wen,
											a=>reged3,
											x=>eis51,
											c=>a1,
											s=>temp4
											);
											
	U_sa4:  sat port map (eisodos=>temp4,
						eksodos=>eksodos
						);
						
	-- U_re20:  myreg generic map (n=>40) port map (clk=>clk,
											-- rst=>rst,
											-- wen=>wen,
											-- eisod=>temp5,
											-- deigma=>eksodos
											-- );
											
end struct;
