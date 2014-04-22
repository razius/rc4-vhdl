----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:08:27 04/22/2014 
-- Design Name: 
-- Module Name:    s_block - Behavioral 
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

entity s_block is
	Port(
		CLK: in STD_LOGIC;
		RST: in STD_LOGIC;
		INDEX: in STD_LOGIC_VECTOR (7 downto 0);
		VALUE: in STD_LOGIC_VECTOR (7 downto 0)
	);
end s_block;

architecture Behavioral of s_block is

begin


end Behavioral;

