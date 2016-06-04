library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

entity sel is
port(   eisodos1	: in signed (39 downto 0);
	eksodos1	: out signed (39 downto 0)
		);
end entity;

architecture struct of sel is

constant pi: signed(39 downto 0):="0000001100100100001111110110101010001000";
constant pi2: signed(39 downto 0):="0000011001001000011111101101010100010000";
constant pimiso: signed(39 downto 0):="0000000110010010000111111011010101000100";
constant pi32: signed (39 downto 0):= "0000010010110110010111110001111111001100";
constant miden: signed (39 downto 0):=(others=>'0');
signal eks1 : signed (39 downto 0);
signal eks2 : signed (39 downto 0);
signal eks3 : signed (39 downto 0);
signal eks4 : signed (39 downto 0);

begin

pr1:process(eisodos1)
begin
if (miden<=eisodos1 and eisodos1<pimiso) then
	eksodos1<=eisodos1;
elsif (pimiso<=eisodos1 and eisodos1<pi) then
	eksodos1<=pi-eisodos1;
elsif (pi<=eisodos1 and eisodos1<pi32) then
	eksodos1<=eisodos1-pi;
else
	eksodos1<=pi2-eisodos1;
end if;
end process;

end struct;
