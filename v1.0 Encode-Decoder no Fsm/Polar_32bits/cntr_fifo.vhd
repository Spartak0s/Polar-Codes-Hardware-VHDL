library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity cntr_fifo is

generic(n: natural :=3);
port(	clock:	in std_logic;
	reset:	in std_logic;
	hold	: in std_logic;
	q:	out std_logic_vector(n-1 downto 0);
	cc:	in std_logic
);
end cntr_fifo;


architecture behv of cntr_fifo is		 	  
	
signal count: std_logic_vector(n-1 downto 0);

begin


    process(clock)
    begin
		
		
			if (clock='1' and clock'event) then
			if reset = '0' then
			count<= "000";
			else
			if (hold = '1')then
				if count = "100" then
				count<="010";
				else
				count <= count + 1;
				end if;
			end if;
			end if;			
		end if;
    end process;		
		q <=count;
end behv;