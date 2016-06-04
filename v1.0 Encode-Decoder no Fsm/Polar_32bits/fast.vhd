library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity fast is
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
end fast;

architecture struct of fast is


component myreg is
generic(n: integer:=40);
port(   clk : in std_logic;
		rst : in std_logic;
		wen : in std_logic;
		eisod : in signed (n-1 downto 0);
		deigma : out signed (n-1 downto 0)
		);
end component;

signal signextpLL: signed (k-1 downto 0);
signal signextpHL:signed (k-1 downto 0);
signal signextrlow:signed (k-1 downto 0);

signal klow: signed (k-1 downto 0);
--
signal pLL,pLL2:  signed (2*k+1 downto 0);
signal pHL,pHL2:  signed (n downto 0);
signal pLH,pLH2:  signed (n downto 0);
signal pHH,pHH2:  signed (2*(n -k) - 1 downto 0);
--

signal rlow:	signed (k + n + 1 downto 0);
signal rhigh:	signed ( n + k downto 0);
---
signal alow, blow : signed (k downto 0);
signal ahigh, bhigh: signed (n- k-1 downto 0);
--
signal result: signed(2*n+1 downto 0);
begin

alow  <= '0' & a( k -1 downto 0); -- k+1 bits
ahigh <= 	a(n - 1  downto k); -- n-k bits

blow  <= '0' & b(k -1 downto 0); -- k+1 bits
bhigh <= 	b(n - 1 downto k); -- n-k bits

pLL <=  alow * blow ; -- 2(k+1) bits
pLH <=  alow * bhigh; -- n-k+k+1=n+1 bits
pHL <= ahigh * blow; -- n-k+k+1=n+1 bits
pHH <= ahigh * bhigh; -- 2(n-k) bits

U_rg1: myreg generic map ( 2*(k+1)) port map (clk=>clk,rst=>rst,wen=>wen,eisod=>pLL,deigma=>pLL2);
U_rg2: myreg generic map ( n+1) port map (clk=>clk,rst=>rst,wen=>wen,eisod=>pLH,deigma=>pLH2);
U_rg3: myreg generic map ( n+1) port map (clk=>clk,rst=>rst,wen=>wen,eisod=>pHL,deigma=>pHL2);
U_rg4: myreg generic map ( 2*(n-k)) port map (clk=>clk,rst=>rst,wen=>wen,eisod=>pHH,deigma=>pHH2);
--------------pipelinestage 1: delay partial products

klow  <= (others => '0'); -- k bits		
signextpLL <= (others => '0'); 
signextpHL <= (others => pHL2(n));



rlow  <=  (pLH2(n) & pLH2 & klow) + (signextpLL & pLL2) ; -- 62 bits

rhigh <= (pHH2(2*(n -k) - 1) & pHH2 & klow )+ ( signextpHL & pHL2) ; -- 61 bits

--------------pipelinestage 2: delay partial sums

signextrlow<= ( others =>rlow(n+k+1));

result <= ( rhigh(n+k) & rhigh & klow) + ( signextrlow & rlow);

p <= result( 2*n-1 downto 0);

--------------pipelinestage 3:??????

end architecture struct;
