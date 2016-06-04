library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;


entity myawgn is
port(   clk : in std_logic;
		rst : in std_logic;
		fre	: in std_logic;
		ready	: out std_logic;
		deigma1 : out signed (39 downto 0);
		deigma2	: out signed (39 downto 0)
		);
end entity;


architecture struct of myawgn is

component BoxMuller is
port(	clk	: in std_logic;
	rst	: in std_logic;
	wen : in std_logic;
	eisodos1: in signed (31 downto 0);
	eisodos2: in signed (31 downto 0);
	eksodos	: out signed (39 downto 0)
		);
end component;

component mt2 is
port(   clk : in std_logic;
		rst : in std_logic;
		freeze : in std_logic;
		running	: out std_logic;
		frozen	: out std_logic;
		tixaios1 : out signed (31 downto 0);
		tixaios2 : out signed (31 downto 0);
		tixaios3 : out signed (31 downto 0);
		tixaios4 : out signed (31 downto 0)
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

component mydff2 is
port(   clk : in std_logic;
		rst : in std_logic;
		wen : in std_logic;
		eisod : in std_logic;
		deigma : out std_logic
		);
end component;

signal arithmos1,arithmos2,arithmos3,arithmos4: signed (31 downto 0);
signal trexo,sinex: std_logic;

begin

U_mt1: mt2 port map (clk=>clk,
					rst=>rst,
					freeze=>fre,
					running=>trexo,
					frozen=>sinex,
					tixaios1=>arithmos1,
					tixaios2=>arithmos2,
					tixaios3=>arithmos3,
					tixaios4=>arithmos4
					);

U_bm1: BoxMuller port map (clk=>clk,
						rst=>trexo,
						wen=>sinex,
						eisodos1=>arithmos1,
						eisodos2=>arithmos2,
						eksodos=>deigma1
						);

U_bm2: BoxMuller port map (clk=>clk,
						rst=>trexo,
						wen=>sinex,
						eisodos1=>arithmos3,
						eisodos2=>arithmos4,
						eksodos=>deigma2
						);
						
-- U_rg1: myreg generic map (n=>40) port map ( clk => clk,
							-- rst=>rst,
							-- wen=>sinex,
							-- eisod=> deigma1,
							-- deigma=>deigma
							-- );
							
-- U_df1: mydff2 port map (clk=>clk,
					-- rst=>rst,
					-- wen=>sinex,
					-- eisod=>trexo,
					-- deigma=>ready
					-- );
ready<=trexo;

end struct;
