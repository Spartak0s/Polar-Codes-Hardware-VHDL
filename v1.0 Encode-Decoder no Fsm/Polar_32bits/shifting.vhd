library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;



entity shifting is
generic (n: integer:=8);
port (  arithmos: in signed (N-1 downto 0);
	theseis:in signed (N-2 downto 0);
	eksodos: out signed (N-1 downto 0) );
end shifting;

architecture Behavioral of shifting is

signal num1,num2: unsigned (N-1 downto 0);
signal num3: integer;

begin

num1<=unsigned(arithmos);
num3<=to_integer(theseis);
num2<=num1 sll num3;
eksodos<=signed(num2);

end Behavioral;

