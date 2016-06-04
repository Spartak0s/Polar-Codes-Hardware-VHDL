library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

entity sat is
port(   eisodos	: in signed (79 downto 0);
		eksodos	: out signed (39 downto 0)
		);
end entity;

architecture struct of sat is

signal endiameso: signed (39 downto 0);
signal a,b1,b: signed (7 downto 0);
signal c,c1: signed (31 downto 0);
constant miden : signed ( 7 downto 0):="00000000";
constant assoi : signed (7 downto 0) :="11111111";


begin
a<=eisodos(79 downto 72);
b1<=eisodos(71 downto 64);
c1<=eisodos(63 downto 32);
endiameso<=b&c;
eksodos<=endiameso;



pr1:process(a,b1,c1)
begin
if ((a=miden and b1(7)='0') or (a=assoi and b1(7)='1')) then
	b<=b1;
	c<=c1;
elsif (a(7)='0') then
	b<="01111111";
	c<=(others=>'1');
else
	b<="10000000";
	c<=(others=>'0');
end if;
end process;



end struct;
