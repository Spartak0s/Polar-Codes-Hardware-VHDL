library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

entity mycos is
port(	clk		: in std_logic;
		rst		: in std_logic;
		wen		: in std_logic;
		eisodos	: in signed (31 downto 0);
		eksodos	: out signed (39 downto 0)
		);
end entity;

architecture struct of mycos is

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

	component sel is
	port(   eisodos1	: in signed (39 downto 0);
		eksodos1	: out signed (39 downto 0)
			);
	end component;

	component sel2 is
	port(   eisodos1	: in signed (39 downto 0);
		eisodos2	: in signed (39 downto 0);
		eksodos1	: out signed (39 downto 0)
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

	component fast is
	generic (
		n: integer := 8;
		k: integer := 4
		);
	port (	clk : in std_logic;
		rst : in std_logic;
		wen : in std_logic;
		a:  in  signed (n-1 downto 0);
		b:  in  signed (n-1 downto 0);
		p: out  signed (2*n-1 downto 0)
		);
	end component;

	signal temp1,temp2,temp3,temp4: signed(79 downto 0);
	signal foo1,foo2,foo3,foo4,foo5: signed(39 downto 0);
	signal x1,x2,x3,x31,eis2,eis3,eis4,eis21,eis22,eis31,eis32,eis41: signed(39 downto 0);
	signal reged1,reged2,reged3 : signed (39 downto 0);
	signal num1,num3,num4,num5,num31,num32,num41,num42,num51,num52,num6,num61,num62,num11: signed (39 downto 0);
	signal num2: signed (79 downto 0);
	constant pi: signed(39 downto 0):="0000001100100100001111110110101010001000";
	constant a0: signed (79 downto 0):="00000000000000010110101000001001111001100110011111110011101111001101000000000000";
	constant a1: signed (79 downto 0):=(others=>'0');
	constant a2: signed (79 downto 0):="11111111111111110100110000101100111001100111011101010000000000000000000000000000";
	constant a3: signed (79 downto 0):=(others=>'0');
	constant a4: signed (39 downto 0):="0000000000001101011011100111111110011101";

begin

	x1<="0000000"&eisodos&'0';
	--num2<=x1*pi;
	U_fa1: fast generic map ( n=>40,k=>20) port map ( clk=>clk,rst=>rst,wen=>wen,a=>x1,b=>pi,p=>num2);
	num1<=num2(71 downto 32);
	
	U_re60: myreg generic map (n=>40) port map (clk=>clk,
											rst=>rst,
											wen=>wen,
											eisod=>num1,
											deigma=>num11
											);

	U_sel1: sel port map (eisodos1=>num11,
							eksodos1=>x2
							);
							
	U_re01: myreg generic map (n=>40) port map (clk=>clk,
											rst=>rst,
											wen=>wen,
											eisod=>x2,
											deigma=>x3
											);
											
	U_re02: myreg generic map (n=>40) port map (clk=>clk,
											rst=>rst,
											wen=>wen,eisod=>num11,
											deigma=>num6
											);
											
	U_re18: myreg generic map (n=>40) port map (clk=>clk,
												rst=>rst,
												wen=>wen,
												eisod=>num6,
												deigma=>num61
												);
	U_ma1: mac generic map (n=>40)  port map (clk=>clk,
											rst=>rst,
											wen1=>wen,
											wen2=>wen,
											a=>a4,
											x=>x3,
											c=>a3,
											s=>temp1
											);
											
	U_sa1: sat port map ( eisodos=>temp1,
							eksodos=>foo1
							);
							
	U_re20:  myreg generic map (n=>40) port map (clk=>clk,
											rst=>rst,
											wen=>wen,
											eisod=>x3,
											deigma=>x31
											);
	
	U_re21:  myreg generic map (n=>40) port map (clk=>clk,
											rst=>rst,
											wen=>wen,
											eisod=>num61,
											deigma=>num62
											);
							
	U_re03:  myreg generic map (n=>40) port map (clk=>clk,
											rst=>rst,
											wen=>wen,
											eisod=>foo1,
											deigma=>reged1
											);
											
	U_re04:  myreg generic map (n=>40) port map (clk=>clk,
											rst=>rst,
											wen=>wen,
											eisod=>x31,
											deigma=>eis2
											);
											
	U_re05:  myreg generic map (n=>40) port map (clk=>clk,
											rst=>rst,
											wen=>wen,
											eisod=>eis2,
											deigma=>eis21
											);
											
	U_re06:  myreg generic map (n=>40) port map (clk=>clk,
											rst=>rst,
											wen=>wen,
											eisod=>num62,
											deigma=>num3
											);
											
	U_re07:  myreg generic map (n=>40) port map (clk=>clk,
											rst=>rst,
											wen=>wen,
											eisod=>num3,
											deigma=>num31
											);
											
	U_ma2:  mac generic map (n=>40)  port map (clk=>clk,
											rst=>rst,
											wen1=>wen,
											wen2=>wen,
											a=>reged1,
											x=>eis21,
											c=>a2,
											s=>temp2
											);
											
	U_sa2:  sat port map ( eisodos=>temp2,
						eksodos=>foo2
						);
						
	U_re22:  myreg generic map (n=>40) port map (clk=>clk,
											rst=>rst,
											wen=>wen,
											eisod=>eis21,
											deigma=>eis22
											);
	
	U_re23:  myreg generic map (n=>40) port map (clk=>clk,
											rst=>rst,
											wen=>wen,
											eisod=>num31,
											deigma=>num32
											);
											
	U_re19: myreg generic map (n=>40) port map (clk=>clk,
											rst=>rst,
											wen=>wen,
											eisod=>foo2,
											deigma=>reged2
											);
											
	U_re08:  myreg generic map (n=>40) port map (clk=>clk,
											rst=>rst,
											wen=>wen,
											eisod=>eis22,
											deigma=>eis3
											);
											
	U_re09:  myreg generic map (n=>40) port map (clk=>clk,
											rst=>rst,
											wen=>wen,
											eisod=>eis3,
											deigma=>eis31
											);
											
	U_re10:  myreg generic map (n=>40) port map (clk=>clk,
											rst=>rst,
											wen=>wen,
											eisod=>num32,
											deigma=>num4
											);
											
	U_re11:  myreg generic map (n=>40) port map (clk=>clk,
											rst=>rst,
											wen=>wen,eisod=>num4,
											deigma=>num41
											);
											
	U_ma3:  mac generic map (n=>40)  port map (clk=>clk,
										rst=>rst,
										wen1=>wen,
										wen2=>wen,
										a=>reged2,
										x=>eis31,
										c=>a1,
										s=>temp3
										);
										
	U_sa3:  sat port map (eisodos=>temp3,
						eksodos=>foo3
						);
	
	U_re24:  myreg generic map (n=>40) port map (clk=>clk,
											rst=>rst,
											wen=>wen,
											eisod=>eis31,
											deigma=>eis32
											);
	
	U_re25:  myreg generic map (n=>40) port map (clk=>clk,
											rst=>rst,
											wen=>wen,
											eisod=>num41,
											deigma=>num42
											);
											
	U_re12:  myreg generic map (n=>40) port map (clk=>clk,
											rst=>rst,
											wen=>wen,
											eisod=>foo3,
											deigma=>reged3
											);
											
	U_re13:  myreg generic map (n=>40) port map (clk=>clk,
											rst=>rst,
											wen=>wen,
											eisod=>eis32,
											deigma=>eis4);
											
	U_re14:  myreg generic map (n=>40) port map (clk=>clk,
											rst=>rst,
											wen=>wen,
											eisod=>eis4,
											deigma=>eis41
											);
											
	U_re15:  myreg generic map (n=>40) port map (clk=>clk,
											rst=>rst,
											wen=>wen,
											eisod=>num42,
											deigma=>num5
											);
											
	U_re16:  myreg generic map (n=>40) port map (clk=>clk,
											rst=>rst,
											wen=>wen,
											eisod=>num5,
											deigma=>num51
											);
											
	U_re26:  myreg generic map (n=>40) port map (clk=>clk,
											rst=>rst,
											wen=>wen,
											eisod=>num51,
											deigma=>num52
											);
	
	U_ma4:  mac generic map (n=>40)  port map (clk=>clk,
										rst=>rst,
										wen1=>wen,
										wen2=>wen,
										a=>reged3,
										x=>eis41,
										c=>a0,
										s=>temp4
										);
										
	U_sa4:  sat port map (eisodos=>temp4,
						eksodos=>foo4
						);
						
	U_sel3: sel2 port map (eisodos1=>num52,
							eisodos2=>foo4,
							eksodos1=>eksodos
							);
							
	-- U_re17:  myreg generic map (n=>40) port map (clk=>clk,
											-- rst=>rst,
											-- wen=>wen,
											-- eisod=>foo5,
											-- deigma=>eksodos
											-- );

end struct;
