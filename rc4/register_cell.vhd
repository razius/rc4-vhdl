----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:02:25 04/21/2014 
-- Design Name: 
-- Module Name:    register_cell - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity register_cell is
	 Generic ( width: integer :=8);
    Port ( DATA_IN : in  STD_LOGIC_VECTOR (width-1 downto 0);
			  DATA_OUT: out STD_LOGIC_VECTOR (width-1 downto 0);
			  CLK : in  STD_LOGIC);
end register_cell;

architecture Behavioral of register_cell is

	component flip_flop
		port(
			CLK: in STD_LOGIC;
			DATA_IN: in STD_LOGIC;
			DATA_OUT: out STD_LOGIC
		);
	end component;

begin
	gen:
		for index in width-1 downto 0 generate
			fp: flip_flop port map(CLK, DATA_IN(index), DATA_OUT(index));
		end generate;
end Behavioral;

