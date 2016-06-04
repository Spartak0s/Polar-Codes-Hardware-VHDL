library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

entity paragogi is
port(   eisodos	: in signed (31 downto 0);
		eksodos	: out signed (31 downto 0)
		);
end entity;

architecture struct of paragogi is

signal y,y1,y2,y3,y4,y5,y6,y7,y8,y9 : signed (31 downto 0);
constant c1 : signed (31 downto 0):= "10011101001011000101011010000000";
constant c2 : signed (31 downto 0):= "11101111110001100000000000000000";

begin

y <= eisodos;
y1<=y srl 11;
y2 <= y xor y1;
y3<=y2 sll 7;
y4<=y3 and c1;
y5 <= y2 xor y4;
y6<=y5 sll 15;
y7<=y6 and c2;
y8 <= y5 xor y7;
y9<=y8 srl 18;
eksodos <= y8 xor y9;

end struct;
