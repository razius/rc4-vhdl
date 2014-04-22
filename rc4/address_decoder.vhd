----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:19:32 04/21/2014 
-- Design Name: 
-- Module Name:    address_decoder - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.math_real.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity address_decoder is
	 Generic ( width: integer :=8);
    Port ( DATA_IN: in  STD_LOGIC_VECTOR (width-1 downto 0);
           DATA_OUT: out  STD_LOGIC_VECTOR (((2**width) - 1) downto 0));
end address_decoder;

architecture Behavioral of address_decoder is
begin	
	gen:
		for i in ((2**width) - 1) downto 0 generate
			DATA_OUT(i) <= '1' WHEN to_integer(unsigned(DATA_IN)) = i ELSE '0';
		end generate;
end Behavioral;

