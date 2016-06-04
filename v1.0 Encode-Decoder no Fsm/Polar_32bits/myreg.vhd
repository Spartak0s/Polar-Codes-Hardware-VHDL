library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;


entity myreg is
generic(n: integer:=40);
port(   clk : in std_logic;
		rst : in std_logic;
		wen : in std_logic;
		eisod : in signed (n-1 downto 0);
		deigma : out signed (n-1 downto 0)
		);
end entity;


architecture struct of myreg is


begin

pr1:process (clk) 
begin
   if clk='1' and clk'event then
      if rst='0' then 
         deigma <=(others => '0');
      elsif (wen='1') then
         deigma <= eisod;
      end if;
   end if;
end process;



end struct;
