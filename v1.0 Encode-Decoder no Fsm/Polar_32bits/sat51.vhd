--------------
-- LLRs=5.1 --
--------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

entity sat51 is
port(   eisodos	: in signed (79 downto 0);
		eksodos	: out signed (5 downto 0)
		);
end entity;

architecture struct of sat51 is

signal endiameso: signed (5 downto 0);
signal a: signed (10 downto 0);
signal b1,b: signed (4 downto 0);
signal c,c1: signed (0 downto 0);
constant miden : signed ( 10 downto 0):="00000000000";
constant assoi : signed (10 downto 0) :="11111111111";


begin
a<=eisodos(79 downto 69);
b1<=eisodos(68 downto 64);
c1<=eisodos(63 downto 63);
endiameso<=b&c;
eksodos<=endiameso;



pr1:process(a,b1,c1)
begin
if ((a=miden and b1(4)='0') or (a=assoi and b1(4)='1')) then
	b<=b1;
	c<=c1;
elsif (a(10)='0') then
	b<="01111";
	c<=(others=>'1');
else
	b<="10000";
	c<=(others=>'0');
end if;
end process;



end struct;
