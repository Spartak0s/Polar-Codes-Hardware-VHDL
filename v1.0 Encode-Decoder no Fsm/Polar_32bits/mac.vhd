library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

entity mac is
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
end mac;

architecture struct of mac is

signal p,p1: signed (2*n-1 downto 0);

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

begin


U_ml1: fast generic map (n=>n,k=>(n/2)) port map (clk=>clk,rst=>rst,wen=>wen2,a=>a,b=>x,p=>p);

pr1:process (clk) 
begin
   if clk='1' and clk'event then
      if rst='0' then 
         p1 <=(others => '0');
      elsif (wen1='1') then
         p1 <= p;
      end if;
   end if;
end process;

s<=p1+c;

end struct;
