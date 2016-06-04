library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;


entity pinakes2 is
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
end pinakes2;

architecture struct of pinakes2 is

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

	signal addr_ra0,addr_ra1,addr_ra2,addr_ra3,temp2,address397,address398 : signed ( adr_length1-4 downto 0);
	signal addr_ra4,addr_ra5,addr_ra6,addr_ra7,address399,address400 : signed ( adr_length1-4 downto 0);
	signal extra : signed (adr_length1-4 downto 0);
	signal w_r_sig,wen1,wen2,wen0,wen3,wen4,wen5,wen6,wen7 : std_logic;
	signal meriko,meriko2,meriko3,meriko4,address397_t,address398_t,temp1: signed (adr_length1 downto 0);
	signal meriko5,meriko6,meriko7,meriko8,address399_t,address400_t: signed (adr_length1 downto 0);
	signal mnimi0,mnimi3,mnimi3980,mnimi3981,mnimi1,mnimi2,mnimi3971,mnimi3972 : signed (width-1 downto 0);
	signal mnimi4,mnimi5,mnimi3991,mnimi3992,mnimi6,mnimi7,mnimi4001,mnimi4000 : signed (width-1 downto 0);
	
	-----------------------------------------------------
	-- Endiameses Statheres pou xrisimopoiountai gia   --
	-- ton ipologismo ton dieythinseon gia ta stoixeia --
	-- i+397,398,399,400. To c4 einai gia na pigainei  --
	-- i mideniki mnimi sto stoixeio 0 otan...
	-----------------------------------------------------
	constant c397 : signed (adr_length1 downto 0):="00110001101";--397
	constant c398 : signed (adr_length1 downto 0):="00110001110";--398
	constant c399 : signed (adr_length1 downto 0):="00110001111";--399
	constant c400 : signed (adr_length1 downto 0):="00110010000";--400
	constant c2 : signed (adr_length1 downto 0):="01001110000";--624
	constant c4 : signed (adr_length1-4 downto 0):="1001110";--74

begin

	------------------------------------------------
	-- Ypologismos ton dieythinseon ton RAM ston  --
	-- Mersenne Twister.                          --
	------------------------------------------------
	w_r_sig<=sel and address1(2);
	extra<="000000"&w_r_sig;
	temp2<=address1(adr_length1-1 downto 3)+extra;
	addr_ra0<="0000000" when temp2=c4 else temp2;
	addr_ra2<=address1(adr_length1-1 downto 3);
	addr_ra1<=address1(adr_length1-1 downto 3);
	addr_ra3<=address1(adr_length1-1 downto 3);
	addr_ra4<=address1(adr_length1-1 downto 3);
	addr_ra5<=address1(adr_length1-1 downto 3);
	addr_ra6<=address1(adr_length1-1 downto 3);
	addr_ra7<=address1(adr_length1-1 downto 3);
	temp1<='0'&address1;
	meriko<=temp1 + c397;
	meriko2<= meriko - c2;
	meriko3<=temp1 + c398;
	meriko4<=meriko3 - c2;
	meriko5<=temp1 + c399;
	meriko6<=meriko5 - c2;
	meriko7<=temp1 + c400;
	meriko8<=meriko7 - c2;
	address397_t<=meriko when meriko2(adr_length1)='1' else meriko2;
	address397<=address397_t(adr_length1-1 downto 3);
	address398_t<=meriko3 when meriko4(adr_length1)='1' else meriko4;
	address398<=address398_t(adr_length1-1 downto 3);
	address399_t<=meriko5 when meriko6(adr_length1)='1' else meriko6;
	address399<=address399_t(adr_length1-1 downto 3);
	address400_t<=meriko7 when meriko8(adr_length1)='1' else meriko8;
	address400<=address400_t(adr_length1-1 downto 3);
	
	---------------------------------------------------
	-- H mothodos me tin opoia energopoiountai ta    --
	-- write enable simata gia tis RAM pou xrisimo-  --
	-- poiountai ston Mersenn Twister                --
	---------------------------------------------------
	wen0<='1' when address1(2)='0' and en='1' else '0';
	wen2<='1' when address1(2)='0' and en='1' else '0';
	wen4<='1' when address1(2)='1' and en='1' else '0';
	wen6<='1' when address1(2)='1' and en='1' else '0';
	wen1<='1' when address1(2)='0' and en='1' else '0';
	wen3<='1' when address1(2)='0' and en='1' else '0';
	wen5<='1' when address1(2)='1' and en='1' else '0';
	wen7<='1' when address1(2)='1' and en='1' else '0';
		  
	U_ra0: myram generic map (width=>width,
							adr_length=>7
							)
				port map (clk=>clk,
						wen=>wen0,
						neostoix=>neostoix1,
						address1=>addr_ra0,
						address2=>address400,
						stoixeio1=>mnimi0,
						stoixeio2=>mnimi4000
						);
						
	U_ra2: myram generic map (width=>width,
							adr_length=>7
							)
				port map (clk=>clk,
						wen=>wen2,
						neostoix=>neostoix3,
						address1=>addr_ra2,
						address2=>address398,
						stoixeio1=>mnimi2,
						stoixeio2=>mnimi3980
						);
						
	U_ra4: myram generic map (width=>width,
							adr_length=>7
							)
				port map (clk=>clk,
						wen=>wen4,
						neostoix=>neostoix1,
						address1=>addr_ra4,
						address2=>address400,
						stoixeio1=>mnimi4,
						stoixeio2=>mnimi4001
						);
						
	U_ra6: myram generic map (width=>width,
							adr_length=>7
							)
				port map (clk=>clk,
						wen=>wen6,
						neostoix=>neostoix3,
						address1=>addr_ra6,
						address2=>address398,
						stoixeio1=>mnimi6,
						stoixeio2=>mnimi3981
						);

	U_ra1: myram generic map (width=>width,
							adr_length=>7
							)
				port map (clk=>clk,
						wen=>wen1,
						neostoix=>neostoix2,
						address1=>addr_ra1,
						address2=>address397,
						stoixeio1=>mnimi1,
						stoixeio2=>mnimi3972
						);
						
	U_ra3: myram generic map (width=>width,
							adr_length=>7
							)
				port map (clk=>clk,
						wen=>wen3,
						neostoix=>neostoix4,
						address1=>addr_ra3,
						address2=>address399,
						stoixeio1=>mnimi3,
						stoixeio2=>mnimi3992
						);
						
	U_ra5: myram generic map (width=>width,
							adr_length=>7
							)
				port map (clk=>clk,
						wen=>wen5,
						neostoix=>neostoix2,
						address1=>addr_ra5,
						address2=>address397,
						stoixeio1=>mnimi5,
						stoixeio2=>mnimi3971
						);
						
	U_ra7: myram generic map (width=>width,
							adr_length=>7
							)
				port map (clk=>clk,
						wen=>wen7,
						neostoix=>neostoix4,
						address1=>addr_ra7,
						address2=>address399,
						stoixeio1=>mnimi7,
						stoixeio2=>mnimi3991
						);



	---------------------------------------------------
	-- Anagkaioi poliplektes gia to poies times tha  --
	-- bgainoun stin eksodo gia tin paragogi ton     --
	-- tixaion arithmon kai stin ananeosi ton timon  --
	-- ton pinakon tou Mersenne Twister              --
	---------------------------------------------------
	stoixeio0<=mnimi0 when address1(2)='0' else mnimi4;
	stoixeio1<=mnimi1 when address1(2)='0' else mnimi5;
	stoixeio2<=mnimi2 when address1(2)='0' else mnimi6;
	stoixeio3<=mnimi3 when address1(2)='0' else mnimi7;
	stoixeio4<=mnimi4 when address1(2)='0' else mnimi0;
	stoixeio397<=mnimi3971 when address397_t(2)='1' else mnimi3972;
	stoixeio398<=mnimi3981 when address397_t(2)='1' else mnimi3980;
	stoixeio399<=mnimi3991 when address397_t(2)='1' else mnimi3992;
	stoixeio400<=mnimi4000 when address397_t(2)='1' else mnimi4001;

end struct;
