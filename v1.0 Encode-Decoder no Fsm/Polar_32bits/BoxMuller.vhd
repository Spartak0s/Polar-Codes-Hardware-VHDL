library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

entity BoxMuller is
port(	clk	: in std_logic;
	rst	: in std_logic;
	wen : in std_logic;
	eisodos1: in signed (31 downto 0);
	eisodos2: in signed (31 downto 0);
	eksodos	: out signed (39 downto 0)
		);
end entity;


architecture struct of BoxMuller is

	component mycos is
	port(	clk		: in std_logic;
			rst		: in std_logic;
			wen		: in std_logic;
			eisodos	: in signed (31 downto 0);
			eksodos	: out signed (39 downto 0)
		);
	end component;

	component mylog2 is
	port(	clk		: in std_logic;
			rst		: in std_logic;
			wen		: in std_logic;
			eisodos	: in signed (31 downto 0);
			eksodos	: out signed (39 downto 0)
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

	component sat is
	port(   eisodos	: in signed (79 downto 0);
			eksodos	: out signed (39 downto 0)
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

	signal temp: signed (79 downto 0);
	signal gia_cos,gia_log : signed (31 downto 0);
	signal mycos1,mylog1,temp1,temp2: signed (39 downto 0);
	constant miden: signed (79 downto 0):=(others=>'0');

begin

	U_reg1: myreg generic map (n=>32) port map (clk=>clk,
											rst=>rst,
											wen=>wen,
											eisod=>eisodos2,
											deigma=>gia_cos
											);
											
	U_reg2: myreg generic map (n=>32) port map (clk=>clk,
											rst=>rst,
											wen=>wen,
											eisod=>eisodos1,
											deigma=>gia_log
											);
											
	U_cos1: mycos port map (clk=>clk,
						rst=>rst,
						wen=>wen,
						eisodos=>gia_cos,
						eksodos=>mycos1
						);
						
	U_log1: mylog2 port map (clk=>clk,
						rst=>rst,
						wen=>wen,
						eisodos=>gia_log,
						eksodos=>mylog1
						);
						
	U_reg3: myreg generic map (n=>40) port map (clk=>clk,
											rst=>rst,
											wen=>wen,
											eisod=>mycos1,
											deigma=>temp1
											);
											
	U_reg4: myreg generic map (n=>40) port map (clk=>clk,
											rst=>rst,
											wen=>wen,
											eisod=>mylog1,
											deigma=>temp2
											);
											
	U_ma5: mac generic map (n=>40) port map (clk=>clk,
											rst=>rst,
											wen1=>wen,
											wen2=>wen,
											a=>temp1,
											x=>temp2,
											c=>miden,
											s=>temp
											);
											
	U_sa5: sat port map (eisodos=>temp,
						eksodos=>eksodos
						);
						
end struct;
