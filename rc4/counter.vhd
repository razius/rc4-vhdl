----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:54:24 04/21/2014 
-- Design Name: 
-- Module Name:    counter - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter is
	Generic ( size: integer :=8);
	Port (CLK: in STD_LOGIC;
			RST: in STD_LOGIC;
			COUNT: out STD_LOGIC_VECTOR (size-1 downto 0);
			OVERFLOW: OUT STD_LOGIC
			);
end counter;

architecture Behavioral of counter is
	signal tmp: STD_LOGIC_VECTOR (size-1 downto 0);
begin
	process (CLK, RST) is
	begin
		if (RST = '1') then
			tmp <= (others => '0');
		elsif (CLK = '1') then
			tmp <= tmp + 1;
			if (tmp = (size-1 downto 0 => '1')) then
				OVERFLOW <= '1';
			else
				OVERFLOW <= '0';
			end if;
		end if;
	end process;
	COUNT <= tmp;
end Behavioral;
