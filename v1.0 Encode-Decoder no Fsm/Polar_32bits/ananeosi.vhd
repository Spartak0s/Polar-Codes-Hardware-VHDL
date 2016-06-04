library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

entity ananeosi is
port(   eisodos1: in signed (31 downto 0);
		eisodos2: in signed (31 downto 0);
		eisodos3: in signed (31 downto 0);
		eksodos	: out signed (31 downto 0)
		);
end entity;

architecture struct of ananeosi is

signal x,x1,x2,x3,temp,temp2 : signed (31 downto 0);
constant c1 : signed (31 downto 0):= "10000000000000000000000000000000";
constant c2 : signed (31 downto 0):= "01111111111111111111111111111111";
constant c3 : signed (31 downto 0):= "10011001000010001011000011011111";

begin
x1<=eisodos1 and c1;
x2<=eisodos2 and c2;

x <= x1 or x2;
x3<=x srl 1;
temp <= eisodos3 xor x3;
temp2<=temp xor c3;
eksodos<=temp2 when temp(0)='1' else temp;
end struct;
