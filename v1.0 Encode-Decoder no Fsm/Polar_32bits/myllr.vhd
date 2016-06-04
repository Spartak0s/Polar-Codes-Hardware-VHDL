library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

entity myllr is
port (	simeio	: in signed (39 downto 0);
		llr		: out signed (5 downto 0)
);
end entity;

architecture struct of myllr is

constant ena : signed (39 downto 0):=     "0000000100000000000000000000000000000000";
constant plinena : signed (39 downto 0):= "1111111100000000000000000000000000000000";
constant ena2 : signed (44 downto 0):="000000000000010000000000000000000000000000000";
constant miden : signed (39 downto 0):="0000000000000000000000000000000000000000";
constant enaround : signed (39 downto 0):=     "0000000100000000000000000000000000000000";
constant plinenaround : signed (39 downto 0):= "1111111100000000000000000000000000000000";
constant trianta1	: signed (5 downto 0):="011111";
constant pltrianta1	: signed (5 downto 0):="100001"; 

signal simeio1,simeio2,sfalma1,sfalma2,sfalma: signed (39 downto 0);
signal temp1,temp2,temp3,temp4,temp5,temp6 : signed (44 downto 0);

begin

simeio1<=simeio + ena;
simeio2<=simeio - ena;
sfalma<= simeio2 when simeio(39)='0' else simeio1;
sfalma1<= sfalma + enaround;
sfalma2<= sfalma - enaround;
temp1<=sfalma1(39)&sfalma1(39)&sfalma1(39)&sfalma1(39)&sfalma1(39)&sfalma1;
temp2<=sfalma2(39)&sfalma2(39)&sfalma2(39)&sfalma2(39)&sfalma2(39)&sfalma2;
temp3<=sfalma1&"00000";
temp4<=sfalma2&"00000";
temp5<=temp3-temp1+ena2;
temp6<=temp4-temp2+ena2;
llr <= trianta1 when (simeio(39)='0' and sfalma(39)='0') else temp5(37 downto 32) when(simeio(39)='0' and sfalma(39)='1') else temp6(37 downto 32) when (simeio(39)='1' and sfalma(39)='0' and sfalma/=miden) else pltrianta1;

end struct;
