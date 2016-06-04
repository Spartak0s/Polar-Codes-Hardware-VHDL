library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;


entity myreg2 is
generic(n: integer:=40);
port(   clk : in std_logic;
		rst : in std_logic;
		eisod : in signed (n-1 downto 0);
		deigma : out signed (n-1 downto 0)
		);
end entity;


architecture struct of myreg2 is


begin

pr1:process (clk) 
begin
   if clk='1' and clk'event then
      if rst='0' then 
         deigma <=(others => '0');
      else
         deigma <= eisod;
      end if;
   end if;
end process;



end struct;
