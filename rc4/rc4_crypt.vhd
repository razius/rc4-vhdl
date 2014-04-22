----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:00:24 04/21/2014 
-- Design Name: 
-- Module Name:    rc4_crypt - Behavioral 
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

entity rc4_crypt is
	Port(
		START: in STD_LOGIC;
		CLK: in STD_LOGIC;
		KEY_IN: in STD_LOGIC_VECTOR (2048 downto 0);
		DATA_IN: in STD_LOGIC_VECTOR (7 downto 0);
		READY: out STD_LOGIC;
		DATA_OUT: out STD_LOGIC_VECTOR (7 downto 0)
	);

end rc4_crypt;

architecture Behavioral of rc4_crypt is
	component s_block is
		Port(
			CLK: in STD_LOGIC;
			RST: in STD_LOGIC;
			INDEX: in STD_LOGIC_VECTOR (7 downto 0);
			VALUE: in STD_LOGIC_VECTOR (7 downto 0)
		);
	end component;
	signal s_block_index, s_block_value: STD_LOGIC_VECTOR (7 downto 0);
begin
	s: s_block port map(
		CLK => CLK,
		RST => '0',
		INDEX => s_block_index,
		VALUE => s_block_value
	);
	s_block_index <= DATA_IN;
	DATA_OUT <= s_block_value;
end Behavioral;
