----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:26:11 02/06/2016 
-- Design Name: 
-- Module Name:    Decoder16 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.all;
use work.MyPackage.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Decoder is
	Port (clk: in std_logic;
			rst: in std_logic;
			ce_inputs: in std_logic;
			inputs : in data;
			outputs : out std_logic_vector(N/2-1 downto 0));
end Decoder;

architecture Behavioral of Decoder is
	signal P: llr_2d := (others=>(others=>(others=> '0')));
	signal u : std_logic_vector(N/2-1 downto 0) := (others => '0');
	signal s: s_2d := (others=>(others=> '0'));
	signal ce_outputs: std_logic:= '1';
begin
	--Input Registers
	GEN_REG_INPUT:
	for I in 0 to N-1 generate
		U_D_FF_Inputs: entity work.D_FF_gen generic map(width=>integer_part+fractional_part)
										 port map(clk =>clk,
													 rst =>rst,
													 ce =>ce_inputs,
													 d =>inputs(I),
													 q =>P(stages)(I));
	end generate GEN_REG_INPUT;
	
	-- STAGE 5
F50: entity F port map(lamdaA => P(5)(0),lamdaB => P(5)(1),lamdaOut => P(4)(0));
G51: entity G port map(lamdaA => P(5)(0),lamdaB => P(5)(1),s => s(5)(0),lamdaOut => P(4)(1));
F52: entity F port map(lamdaA => P(5)(2),lamdaB => P(5)(3),lamdaOut => P(4)(2));
G53: entity G port map(lamdaA => P(5)(2),lamdaB => P(5)(3),s => s(5)(1),lamdaOut => P(4)(3));
F54: entity F port map(lamdaA => P(5)(4),lamdaB => P(5)(5),lamdaOut => P(4)(4));
G55: entity G port map(lamdaA => P(5)(4),lamdaB => P(5)(5),s => s(5)(2),lamdaOut => P(4)(5));
F56: entity F port map(lamdaA => P(5)(6),lamdaB => P(5)(7),lamdaOut => P(4)(6));
G57: entity G port map(lamdaA => P(5)(6),lamdaB => P(5)(7),s => s(5)(3),lamdaOut => P(4)(7));
F58: entity F port map(lamdaA => P(5)(8),lamdaB => P(5)(9),lamdaOut => P(4)(8));
G59: entity G port map(lamdaA => P(5)(8),lamdaB => P(5)(9),s => s(5)(4),lamdaOut => P(4)(9));
F510: entity F port map(lamdaA => P(5)(10),lamdaB => P(5)(11),lamdaOut => P(4)(10));
G511: entity G port map(lamdaA => P(5)(10),lamdaB => P(5)(11),s => s(5)(5),lamdaOut => P(4)(11));
F512: entity F port map(lamdaA => P(5)(12),lamdaB => P(5)(13),lamdaOut => P(4)(12));
G513: entity G port map(lamdaA => P(5)(12),lamdaB => P(5)(13),s => s(5)(6),lamdaOut => P(4)(13));
F514: entity F port map(lamdaA => P(5)(14),lamdaB => P(5)(15),lamdaOut => P(4)(14));
G515: entity G port map(lamdaA => P(5)(14),lamdaB => P(5)(15),s => s(5)(7),lamdaOut => P(4)(15));
F516: entity F port map(lamdaA => P(5)(16),lamdaB => P(5)(17),lamdaOut => P(4)(16));
G517: entity G port map(lamdaA => P(5)(16),lamdaB => P(5)(17),s => s(5)(8),lamdaOut => P(4)(17));
F518: entity F port map(lamdaA => P(5)(18),lamdaB => P(5)(19),lamdaOut => P(4)(18));
G519: entity G port map(lamdaA => P(5)(18),lamdaB => P(5)(19),s => s(5)(9),lamdaOut => P(4)(19));
F520: entity F port map(lamdaA => P(5)(20),lamdaB => P(5)(21),lamdaOut => P(4)(20));
G521: entity G port map(lamdaA => P(5)(20),lamdaB => P(5)(21),s => s(5)(10),lamdaOut => P(4)(21));
F522: entity F port map(lamdaA => P(5)(22),lamdaB => P(5)(23),lamdaOut => P(4)(22));
G523: entity G port map(lamdaA => P(5)(22),lamdaB => P(5)(23),s => s(5)(11),lamdaOut => P(4)(23));
F524: entity F port map(lamdaA => P(5)(24),lamdaB => P(5)(25),lamdaOut => P(4)(24));
G525: entity G port map(lamdaA => P(5)(24),lamdaB => P(5)(25),s => s(5)(12),lamdaOut => P(4)(25));
F526: entity F port map(lamdaA => P(5)(26),lamdaB => P(5)(27),lamdaOut => P(4)(26));
G527: entity G port map(lamdaA => P(5)(26),lamdaB => P(5)(27),s => s(5)(13),lamdaOut => P(4)(27));
F528: entity F port map(lamdaA => P(5)(28),lamdaB => P(5)(29),lamdaOut => P(4)(28));
G529: entity G port map(lamdaA => P(5)(28),lamdaB => P(5)(29),s => s(5)(14),lamdaOut => P(4)(29));
F530: entity F port map(lamdaA => P(5)(30),lamdaB => P(5)(31),lamdaOut => P(4)(30));
G531: entity G port map(lamdaA => P(5)(30),lamdaB => P(5)(31),s => s(5)(15),lamdaOut => P(4)(31));
-- STAGE 4
F40: entity F port map(lamdaA => P(4)(0),lamdaB => P(4)(2),lamdaOut => P(3)(0));
F41: entity F port map(lamdaA => P(4)(1),lamdaB => P(4)(3),lamdaOut => P(3)(1));
G42: entity G port map(lamdaA => P(4)(0),lamdaB => P(4)(2),s => s(4)(0),lamdaOut => P(3)(2));
G43: entity G port map(lamdaA => P(4)(1),lamdaB => P(4)(3),s => s(4)(1),lamdaOut => P(3)(3));
F44: entity F port map(lamdaA => P(4)(4),lamdaB => P(4)(6),lamdaOut => P(3)(4));
F45: entity F port map(lamdaA => P(4)(5),lamdaB => P(4)(7),lamdaOut => P(3)(5));
G46: entity G port map(lamdaA => P(4)(4),lamdaB => P(4)(6),s => s(4)(2),lamdaOut => P(3)(6));
G47: entity G port map(lamdaA => P(4)(5),lamdaB => P(4)(7),s => s(4)(3),lamdaOut => P(3)(7));
F48: entity F port map(lamdaA => P(4)(8),lamdaB => P(4)(10),lamdaOut => P(3)(8));
F49: entity F port map(lamdaA => P(4)(9),lamdaB => P(4)(11),lamdaOut => P(3)(9));
G410: entity G port map(lamdaA => P(4)(8),lamdaB => P(4)(10),s => s(4)(4),lamdaOut => P(3)(10));
G411: entity G port map(lamdaA => P(4)(9),lamdaB => P(4)(11),s => s(4)(5),lamdaOut => P(3)(11));
F412: entity F port map(lamdaA => P(4)(12),lamdaB => P(4)(14),lamdaOut => P(3)(12));
F413: entity F port map(lamdaA => P(4)(13),lamdaB => P(4)(15),lamdaOut => P(3)(13));
G414: entity G port map(lamdaA => P(4)(12),lamdaB => P(4)(14),s => s(4)(6),lamdaOut => P(3)(14));
G415: entity G port map(lamdaA => P(4)(13),lamdaB => P(4)(15),s => s(4)(7),lamdaOut => P(3)(15));
F416: entity F port map(lamdaA => P(4)(16),lamdaB => P(4)(18),lamdaOut => P(3)(16));
F417: entity F port map(lamdaA => P(4)(17),lamdaB => P(4)(19),lamdaOut => P(3)(17));
G418: entity G port map(lamdaA => P(4)(16),lamdaB => P(4)(18),s => s(4)(8),lamdaOut => P(3)(18));
G419: entity G port map(lamdaA => P(4)(17),lamdaB => P(4)(19),s => s(4)(9),lamdaOut => P(3)(19));
F420: entity F port map(lamdaA => P(4)(20),lamdaB => P(4)(22),lamdaOut => P(3)(20));
F421: entity F port map(lamdaA => P(4)(21),lamdaB => P(4)(23),lamdaOut => P(3)(21));
G422: entity G port map(lamdaA => P(4)(20),lamdaB => P(4)(22),s => s(4)(10),lamdaOut => P(3)(22));
G423: entity G port map(lamdaA => P(4)(21),lamdaB => P(4)(23),s => s(4)(11),lamdaOut => P(3)(23));
F424: entity F port map(lamdaA => P(4)(24),lamdaB => P(4)(26),lamdaOut => P(3)(24));
F425: entity F port map(lamdaA => P(4)(25),lamdaB => P(4)(27),lamdaOut => P(3)(25));
G426: entity G port map(lamdaA => P(4)(24),lamdaB => P(4)(26),s => s(4)(12),lamdaOut => P(3)(26));
G427: entity G port map(lamdaA => P(4)(25),lamdaB => P(4)(27),s => s(4)(13),lamdaOut => P(3)(27));
F428: entity F port map(lamdaA => P(4)(28),lamdaB => P(4)(30),lamdaOut => P(3)(28));
F429: entity F port map(lamdaA => P(4)(29),lamdaB => P(4)(31),lamdaOut => P(3)(29));
G430: entity G port map(lamdaA => P(4)(28),lamdaB => P(4)(30),s => s(4)(14),lamdaOut => P(3)(30));
G431: entity G port map(lamdaA => P(4)(29),lamdaB => P(4)(31),s => s(4)(15),lamdaOut => P(3)(31));
-- STAGE 3
F30: entity F port map(lamdaA => P(3)(0),lamdaB => P(3)(4),lamdaOut => P(2)(0));
F31: entity F port map(lamdaA => P(3)(1),lamdaB => P(3)(5),lamdaOut => P(2)(1));
F32: entity F port map(lamdaA => P(3)(2),lamdaB => P(3)(6),lamdaOut => P(2)(2));
F33: entity F port map(lamdaA => P(3)(3),lamdaB => P(3)(7),lamdaOut => P(2)(3));
G34: entity G port map(lamdaA => P(3)(0),lamdaB => P(3)(4),s => s(3)(0),lamdaOut => P(2)(4));
G35: entity G port map(lamdaA => P(3)(1),lamdaB => P(3)(5),s => s(3)(1),lamdaOut => P(2)(5));
G36: entity G port map(lamdaA => P(3)(2),lamdaB => P(3)(6),s => s(3)(2),lamdaOut => P(2)(6));
G37: entity G port map(lamdaA => P(3)(3),lamdaB => P(3)(7),s => s(3)(3),lamdaOut => P(2)(7));
F38: entity F port map(lamdaA => P(3)(8),lamdaB => P(3)(12),lamdaOut => P(2)(8));
F39: entity F port map(lamdaA => P(3)(9),lamdaB => P(3)(13),lamdaOut => P(2)(9));
F310: entity F port map(lamdaA => P(3)(10),lamdaB => P(3)(14),lamdaOut => P(2)(10));
F311: entity F port map(lamdaA => P(3)(11),lamdaB => P(3)(15),lamdaOut => P(2)(11));
G312: entity G port map(lamdaA => P(3)(8),lamdaB => P(3)(12),s => s(3)(4),lamdaOut => P(2)(12));
G313: entity G port map(lamdaA => P(3)(9),lamdaB => P(3)(13),s => s(3)(5),lamdaOut => P(2)(13));
G314: entity G port map(lamdaA => P(3)(10),lamdaB => P(3)(14),s => s(3)(6),lamdaOut => P(2)(14));
G315: entity G port map(lamdaA => P(3)(11),lamdaB => P(3)(15),s => s(3)(7),lamdaOut => P(2)(15));
F316: entity F port map(lamdaA => P(3)(16),lamdaB => P(3)(20),lamdaOut => P(2)(16));
F317: entity F port map(lamdaA => P(3)(17),lamdaB => P(3)(21),lamdaOut => P(2)(17));
F318: entity F port map(lamdaA => P(3)(18),lamdaB => P(3)(22),lamdaOut => P(2)(18));
F319: entity F port map(lamdaA => P(3)(19),lamdaB => P(3)(23),lamdaOut => P(2)(19));
G320: entity G port map(lamdaA => P(3)(16),lamdaB => P(3)(20),s => s(3)(8),lamdaOut => P(2)(20));
G321: entity G port map(lamdaA => P(3)(17),lamdaB => P(3)(21),s => s(3)(9),lamdaOut => P(2)(21));
G322: entity G port map(lamdaA => P(3)(18),lamdaB => P(3)(22),s => s(3)(10),lamdaOut => P(2)(22));
G323: entity G port map(lamdaA => P(3)(19),lamdaB => P(3)(23),s => s(3)(11),lamdaOut => P(2)(23));
F324: entity F port map(lamdaA => P(3)(24),lamdaB => P(3)(28),lamdaOut => P(2)(24));
F325: entity F port map(lamdaA => P(3)(25),lamdaB => P(3)(29),lamdaOut => P(2)(25));
F326: entity F port map(lamdaA => P(3)(26),lamdaB => P(3)(30),lamdaOut => P(2)(26));
F327: entity F port map(lamdaA => P(3)(27),lamdaB => P(3)(31),lamdaOut => P(2)(27));
G328: entity G port map(lamdaA => P(3)(24),lamdaB => P(3)(28),s => s(3)(12),lamdaOut => P(2)(28));
G329: entity G port map(lamdaA => P(3)(25),lamdaB => P(3)(29),s => s(3)(13),lamdaOut => P(2)(29));
G330: entity G port map(lamdaA => P(3)(26),lamdaB => P(3)(30),s => s(3)(14),lamdaOut => P(2)(30));
G331: entity G port map(lamdaA => P(3)(27),lamdaB => P(3)(31),s => s(3)(15),lamdaOut => P(2)(31));
-- STAGE 2
F20: entity F port map(lamdaA => P(2)(0),lamdaB => P(2)(8),lamdaOut => P(1)(0));
F21: entity F port map(lamdaA => P(2)(1),lamdaB => P(2)(9),lamdaOut => P(1)(1));
F22: entity F port map(lamdaA => P(2)(2),lamdaB => P(2)(10),lamdaOut => P(1)(2));
F23: entity F port map(lamdaA => P(2)(3),lamdaB => P(2)(11),lamdaOut => P(1)(3));
F24: entity F port map(lamdaA => P(2)(4),lamdaB => P(2)(12),lamdaOut => P(1)(4));
F25: entity F port map(lamdaA => P(2)(5),lamdaB => P(2)(13),lamdaOut => P(1)(5));
F26: entity F port map(lamdaA => P(2)(6),lamdaB => P(2)(14),lamdaOut => P(1)(6));
F27: entity F port map(lamdaA => P(2)(7),lamdaB => P(2)(15),lamdaOut => P(1)(7));
G28: entity G port map(lamdaA => P(2)(0),lamdaB => P(2)(8),s => s(2)(0),lamdaOut => P(1)(8));
G29: entity G port map(lamdaA => P(2)(1),lamdaB => P(2)(9),s => s(2)(1),lamdaOut => P(1)(9));
G210: entity G port map(lamdaA => P(2)(2),lamdaB => P(2)(10),s => s(2)(2),lamdaOut => P(1)(10));
G211: entity G port map(lamdaA => P(2)(3),lamdaB => P(2)(11),s => s(2)(3),lamdaOut => P(1)(11));
G212: entity G port map(lamdaA => P(2)(4),lamdaB => P(2)(12),s => s(2)(4),lamdaOut => P(1)(12));
G213: entity G port map(lamdaA => P(2)(5),lamdaB => P(2)(13),s => s(2)(5),lamdaOut => P(1)(13));
G214: entity G port map(lamdaA => P(2)(6),lamdaB => P(2)(14),s => s(2)(6),lamdaOut => P(1)(14));
G215: entity G port map(lamdaA => P(2)(7),lamdaB => P(2)(15),s => s(2)(7),lamdaOut => P(1)(15));
F216: entity F port map(lamdaA => P(2)(16),lamdaB => P(2)(24),lamdaOut => P(1)(16));
F217: entity F port map(lamdaA => P(2)(17),lamdaB => P(2)(25),lamdaOut => P(1)(17));
F218: entity F port map(lamdaA => P(2)(18),lamdaB => P(2)(26),lamdaOut => P(1)(18));
F219: entity F port map(lamdaA => P(2)(19),lamdaB => P(2)(27),lamdaOut => P(1)(19));
F220: entity F port map(lamdaA => P(2)(20),lamdaB => P(2)(28),lamdaOut => P(1)(20));
F221: entity F port map(lamdaA => P(2)(21),lamdaB => P(2)(29),lamdaOut => P(1)(21));
F222: entity F port map(lamdaA => P(2)(22),lamdaB => P(2)(30),lamdaOut => P(1)(22));
F223: entity F port map(lamdaA => P(2)(23),lamdaB => P(2)(31),lamdaOut => P(1)(23));
G224: entity G port map(lamdaA => P(2)(16),lamdaB => P(2)(24),s => s(2)(8),lamdaOut => P(1)(24));
G225: entity G port map(lamdaA => P(2)(17),lamdaB => P(2)(25),s => s(2)(9),lamdaOut => P(1)(25));
G226: entity G port map(lamdaA => P(2)(18),lamdaB => P(2)(26),s => s(2)(10),lamdaOut => P(1)(26));
G227: entity G port map(lamdaA => P(2)(19),lamdaB => P(2)(27),s => s(2)(11),lamdaOut => P(1)(27));
G228: entity G port map(lamdaA => P(2)(20),lamdaB => P(2)(28),s => s(2)(12),lamdaOut => P(1)(28));
G229: entity G port map(lamdaA => P(2)(21),lamdaB => P(2)(29),s => s(2)(13),lamdaOut => P(1)(29));
G230: entity G port map(lamdaA => P(2)(22),lamdaB => P(2)(30),s => s(2)(14),lamdaOut => P(1)(30));
G231: entity G port map(lamdaA => P(2)(23),lamdaB => P(2)(31),s => s(2)(15),lamdaOut => P(1)(31));
-- STAGE 1
F10: entity F port map(lamdaA => P(1)(0),lamdaB => P(1)(16),lamdaOut => P(0)(0));
F11: entity F port map(lamdaA => P(1)(1),lamdaB => P(1)(17),lamdaOut => P(0)(1));
F12: entity F port map(lamdaA => P(1)(2),lamdaB => P(1)(18),lamdaOut => P(0)(2));
F13: entity F port map(lamdaA => P(1)(3),lamdaB => P(1)(19),lamdaOut => P(0)(3));
F14: entity F port map(lamdaA => P(1)(4),lamdaB => P(1)(20),lamdaOut => P(0)(4));
F15: entity F port map(lamdaA => P(1)(5),lamdaB => P(1)(21),lamdaOut => P(0)(5));
F16: entity F port map(lamdaA => P(1)(6),lamdaB => P(1)(22),lamdaOut => P(0)(6));
F17: entity F port map(lamdaA => P(1)(7),lamdaB => P(1)(23),lamdaOut => P(0)(7));
F18: entity F port map(lamdaA => P(1)(8),lamdaB => P(1)(24),lamdaOut => P(0)(8));
F19: entity F port map(lamdaA => P(1)(9),lamdaB => P(1)(25),lamdaOut => P(0)(9));
F110: entity F port map(lamdaA => P(1)(10),lamdaB => P(1)(26),lamdaOut => P(0)(10));
F111: entity F port map(lamdaA => P(1)(11),lamdaB => P(1)(27),lamdaOut => P(0)(11));
F112: entity F port map(lamdaA => P(1)(12),lamdaB => P(1)(28),lamdaOut => P(0)(12));
F113: entity F port map(lamdaA => P(1)(13),lamdaB => P(1)(29),lamdaOut => P(0)(13));
F114: entity F port map(lamdaA => P(1)(14),lamdaB => P(1)(30),lamdaOut => P(0)(14));
F115: entity F port map(lamdaA => P(1)(15),lamdaB => P(1)(31),lamdaOut => P(0)(15));
G116: entity G port map(lamdaA => P(1)(0),lamdaB => P(1)(16),s => s(1)(0),lamdaOut => P(0)(16));
G117: entity G port map(lamdaA => P(1)(1),lamdaB => P(1)(17),s => s(1)(1),lamdaOut => P(0)(17));
G118: entity G port map(lamdaA => P(1)(2),lamdaB => P(1)(18),s => s(1)(2),lamdaOut => P(0)(18));
G119: entity G port map(lamdaA => P(1)(3),lamdaB => P(1)(19),s => s(1)(3),lamdaOut => P(0)(19));
G120: entity G port map(lamdaA => P(1)(4),lamdaB => P(1)(20),s => s(1)(4),lamdaOut => P(0)(20));
G121: entity G port map(lamdaA => P(1)(5),lamdaB => P(1)(21),s => s(1)(5),lamdaOut => P(0)(21));
G122: entity G port map(lamdaA => P(1)(6),lamdaB => P(1)(22),s => s(1)(6),lamdaOut => (P(0)(22)));
G123: entity G port map(lamdaA => P(1)(7),lamdaB => P(1)(23),s => s(1)(7),lamdaOut => P(0)(23));
G124: entity G port map(lamdaA => P(1)(8),lamdaB => P(1)(24),s => s(1)(8),lamdaOut => P(0)(24));
G125: entity G port map(lamdaA => P(1)(9),lamdaB => P(1)(25),s => s(1)(9),lamdaOut => P(0)(25));
G126: entity G port map(lamdaA => P(1)(10),lamdaB => P(1)(26),s => s(1)(10),lamdaOut => P(0)(26));
G127: entity G port map(lamdaA => P(1)(11),lamdaB => P(1)(27),s => s(1)(11),lamdaOut => P(0)(27));
G128: entity G port map(lamdaA => P(1)(12),lamdaB => P(1)(28),s => s(1)(12),lamdaOut => P(0)(28));
G129: entity G port map(lamdaA => P(1)(13),lamdaB => P(1)(29),s => s(1)(13),lamdaOut => P(0)(29));
G130: entity G port map(lamdaA => P(1)(14),lamdaB => P(1)(30),s => s(1)(14),lamdaOut => P(0)(30));
G131: entity G port map(lamdaA => P(1)(15),lamdaB => P(1)(31),s => s(1)(15),lamdaOut => P(0)(31));

--Ouput Registers
ce_outputs <= '1';
U_D_FF0: entity D_FF_1bit port map(
clk => clk,
rst => rst,
ce =>ce_outputs,
d => P(0)(26)(sign_bit),
q => outputs(0));

U_D_FF1: entity D_FF_1bit port map(
clk => clk,
rst => rst,
ce =>ce_outputs,
d => P(0)(22)(sign_bit),
q => outputs(1));

U_D_FF2: entity D_FF_1bit port map(
clk => clk,
rst => rst,
ce =>ce_outputs,
d => P(0)(14)(sign_bit),
q => outputs(2));

U_D_FF3: entity D_FF_1bit port map(
clk => clk,
rst => rst,
ce =>ce_outputs,
d => P(0)(30)(sign_bit),
q => outputs(3));

U_D_FF4: entity D_FF_1bit port map(
clk => clk,
rst => rst,
ce =>ce_outputs,
d => P(0)(25)(sign_bit),
q => outputs(4));

U_D_FF5: entity D_FF_1bit port map(
clk => clk,
rst => rst,
ce =>ce_outputs,
d => P(0)(21)(sign_bit),
q => outputs(5));

U_D_FF6: entity D_FF_1bit port map(
clk => clk,
rst => rst,
ce =>ce_outputs,
d => P(0)(13)(sign_bit),
q => outputs(6));

U_D_FF7: entity D_FF_1bit port map(
clk => clk,
rst => rst,
ce =>ce_outputs,
d => P(0)(29)(sign_bit),
q => outputs(7));

U_D_FF8: entity D_FF_1bit port map(
clk => clk,
rst => rst,
ce =>ce_outputs,
d => P(0)(3)(sign_bit),
q => outputs(8));

U_D_FF9: entity D_FF_1bit port map(
clk => clk,
rst => rst,
ce =>ce_outputs,
d => P(0)(19)(sign_bit),
q => outputs(9));

U_D_FF10: entity D_FF_1bit port map(
clk => clk,
rst => rst,
ce =>ce_outputs,
d => P(0)(11)(sign_bit),
q => outputs(10));

U_D_FF11: entity D_FF_1bit port map(
clk => clk,
rst => rst,
ce =>ce_outputs,
d => P(0)(27)(sign_bit),
q => outputs(11));

U_D_FF12: entity D_FF_1bit port map(
clk => clk,
rst => rst,
ce =>ce_outputs,
d => P(0)(7)(sign_bit),
q => outputs(12));

U_D_FF13: entity D_FF_1bit port map(
clk => clk,
rst => rst,
ce =>ce_outputs,
d => P(0)(23)(sign_bit),
q => outputs(13));

U_D_FF14: entity D_FF_1bit port map(
clk => clk,
rst => rst,
ce =>ce_outputs,
d => P(0)(15)(sign_bit),
q => outputs(14));

U_D_FF15: entity D_FF_1bit port map(
clk => clk,
rst => rst,
ce =>ce_outputs,
d => P(0)(31)(sign_bit),
q => outputs(15));

--Partial Sums Vector
u <=P(0)(31)(sign_bit)&P(0)(15)(sign_bit)&P(0)(23)(sign_bit)&P(0)(7)(sign_bit)&P(0)(27)(sign_bit)&P(0)(11)(sign_bit)&P(0)(19)(sign_bit)&P(0)(3)(sign_bit)&P(0)(29)(sign_bit)&P(0)(13)(sign_bit)&P(0)(21)(sign_bit)&P(0)(25)(sign_bit)&P(0)(30)(sign_bit)&P(0)(14)(sign_bit)&P(0)(22)(sign_bit)&P(0)(26)(sign_bit);
--Partial Sums Entity
Partials: entity PartialSumGenerator port map(u,s);
end Behavioral;