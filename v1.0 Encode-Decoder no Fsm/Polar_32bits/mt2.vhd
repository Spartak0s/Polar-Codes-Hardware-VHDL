library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;


entity mt2 is
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
end entity;


architecture struct of mt2 is

	component myfsm is
	port (  clk		: in std_logic;
			rst		: in std_logic;
			freezing : in std_logic;
			running	: out std_logic;
			conti	: out std_logic;
			address	: out signed (9 downto 0)
	);
	end component;

	component pinakes2 is
	generic( width		: natural := 32;
			 adr_length1	: natural := 10
	);
	port( clk		: in std_logic;
		  sel		: in std_logic;
		  en		: in std_logic;
		  neostoix1	: in  signed (width-1 downto 0);
		  neostoix2	: in  signed (width-1 downto 0);
		  neostoix3 : in  signed (width-1 downto 0);
		  neostoix4 : in  signed (width-1 downto 0);
		  address1	: in  signed (adr_length1-1 downto 0);
		  stoixeio0	: out signed (width-1 downto 0);
		  stoixeio1	: out signed (width-1 downto 0);
		  stoixeio2	: out signed (width-1 downto 0);
		  stoixeio3 : out signed (width-1 downto 0);
		  stoixeio4 : out signed (width-1 downto 0);
		  stoixeio397	: out signed (width-1 downto 0);
		  stoixeio398	: out signed (width-1 downto 0);
		  stoixeio399	: out signed (width-1 downto 0);
		  stoixeio400	: out signed (width-1 downto 0)
	);
	end component;

	component paragogi is
	port(   eisodos	: in signed (31 downto 0);
			eksodos	: out signed (31 downto 0)
			);
	end component;

	component ananeosi is
	port(   eisodos1: in signed (31 downto 0);
			eisodos2: in signed (31 downto 0);
			eisodos3: in signed (31 downto 0);
			eksodos	: out signed (31 downto 0)
			);
	end component;

	component myrom2 is
	port( 
		  address1	: in signed (9 downto 0);
		  address2	: in signed (9 downto 0);
		  address3	: in signed (9 downto 0);
		  address4	: in signed (9 downto 0);
		  stoixeio1	: out signed (31 downto 0);
		  stoixeio2	: out signed (31 downto 0);
		  stoixeio3	: out signed (31 downto 0);
		  stoixeio4	: out signed (31 downto 0)
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

	signal mnimi1,mnimi2,mnimi3,mnimi397,mnimi398,temp1,temp2 : signed (31 downto 0);
	signal mnimi4,mnimi5,mnimi399,mnimi400,temp3,temp4 : signed (31 downto 0);
	signal neomnimi1,neomnimi2,romstoixeio1,romstoixeio2,ananeomeno1,ananeomeno2 : signed (31 downto 0);
	signal neomnimi3,neomnimi4,romstoixeio3,romstoixeio4,ananeomeno3,ananeomeno4 : signed (31 downto 0);
	signal address,address2,address3,address4 : signed (9 downto 0);
	signal katastasi1,katastasi2 : std_logic;
	constant ena : signed (9 downto 0):="0000000001";
	constant dio : signed (9 downto 0):="0000000010";
	constant tria : signed (9 downto 0):="0000000011";

begin
	address2<=address+ena;
	address3<=address+dio;
	address4<=address+tria;

	U_fsm1:  myfsm port map (clk=>clk,
									rst=>rst,
									freezing=>freeze,
									running=>katastasi1,
									conti=>katastasi2,
									address=>address
									);
									
	U_rom1:  myrom2 port map (address1=>address,
							address2=>address2,
							address3=>address3,
							address4=>address4,
							stoixeio1=>romstoixeio1,
							stoixeio2=>romstoixeio2,
							stoixeio3=>romstoixeio3,
							stoixeio4=>romstoixeio4
							);
							
	U_par1:  paragogi port map (eisodos=>mnimi1,
								eksodos=>temp1
								);
								
	U_par2:  paragogi port map (eisodos=>mnimi2,
								eksodos=>temp2
								);
								
	U_par3:  paragogi port map (eisodos=>mnimi3,
								eksodos=>temp3
								);
								
	U_par4:  paragogi port map (eisodos=>mnimi4,
								eksodos=>temp4
								);	
								
	U_ana1:  ananeosi port map (eisodos1=>mnimi1,
								eisodos2=>mnimi2,
								eisodos3=>mnimi397,
								eksodos=>ananeomeno1
								);
								
	U_ana2:  ananeosi port map (eisodos1=>mnimi2,
								eisodos2=>mnimi3,
								eisodos3=>mnimi398,
								eksodos=>ananeomeno2
								);

	U_ana3:  ananeosi port map (eisodos1=>mnimi3,
								eisodos2=>mnimi4,
								eisodos3=>mnimi399,
								eksodos=>ananeomeno3
								);
								
	U_ana4:  ananeosi port map (eisodos1=>mnimi4,
								eisodos2=>mnimi5,
								eisodos3=>mnimi400,
								eksodos=>ananeomeno4
								);
		
	U_pin1:  pinakes2 generic map (width=>32,
								adr_length1=>10
								)
					port map (clk=>clk,
							sel=>katastasi1,
							en=>katastasi2,
							neostoix1=>neomnimi1,
							neostoix2=>neomnimi2,
							neostoix3=>neomnimi3,
							neostoix4=>neomnimi4,
							address1=>address,
							stoixeio0=>mnimi1,
							stoixeio1=>mnimi2,
							stoixeio2=>mnimi3,
							stoixeio3=>mnimi4,
							stoixeio4=>mnimi5,
							stoixeio397=>mnimi397,
							stoixeio398=>mnimi398,
							stoixeio399=>mnimi399,
							stoixeio400=>mnimi400
							);
							
	U_reg1:  myreg generic map (n=>32) port map (clk=>clk,
												rst=>rst,
												wen=>katastasi2,
												eisod=>temp1,
												deigma=>tixaios1
												);
												
	U_reg2:  myreg generic map (n=>32) port map (clk=>clk,
												rst=>rst,
												wen=>katastasi2,
												eisod=>temp2,
												deigma=>tixaios2
												);

	U_reg3:  myreg generic map (n=>32) port map (clk=>clk,
												rst=>rst,
												wen=>katastasi2,
												eisod=>temp3,
												deigma=>tixaios3
												);
												
	U_reg4:  myreg generic map (n=>32) port map (clk=>clk,
												rst=>rst,
												wen=>katastasi2,
												eisod=>temp4,
												deigma=>tixaios4
												);												

	neomnimi1<=romstoixeio1 when katastasi1='0' else ananeomeno1;
	neomnimi2<=romstoixeio2 when katastasi1='0' else ananeomeno2;
	neomnimi3<=romstoixeio3 when katastasi1='0' else ananeomeno3;
	neomnimi4<=romstoixeio4 when katastasi1='0' else ananeomeno4;
	running<=katastasi1;
	frozen<=katastasi2;

end struct;
