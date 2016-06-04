library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

entity myram2 is
generic( width		: natural := 32;
		 adr_length	: natural := 8
);
port( clk		: in std_logic;
	  wen		: in std_logic;
	  neostoix	: in  signed (width-1 downto 0);
	  address1	: in  signed (adr_length-1 downto 0);
	  stoixeio1	: out signed (width-1 downto 0)
);
end myram2;


architecture struct of myram2 is

type mem_type is array ((2**adr_length-1) downto 0) of signed (width-1 downto 0);
signal stoixeia: mem_type;

begin

pr1:process (clk)
begin
   if (clk'event and clk = '1') then
		 if (wen = '1') then
            stoixeia(to_integer(unsigned(address1))) <= neostoix;
         end if;
   end if;
end process;

stoixeio1 <= stoixeia(to_integer(unsigned(address1)));

end struct;
