library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

entity mycount is
generic(n: integer:=40);
port(	clk : in std_logic;
		rst : in std_logic;
		en	: in std_logic;
		cnt : out std_logic_vector (n-1 downto 0)
);
end mycount;

architecture struct of mycount is

signal count : std_logic_vector (n-1 downto 0);

begin

pr1:process (clk) 
begin
   if clk='1' and clk'event then
      if rst='0' then 
         count <=(others => '0');
      elsif en='1' then
         count <= count+1;
      end if;
   end if;
end process;

cnt<=count;

end struct;
