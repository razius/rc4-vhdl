----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:01:21 04/21/2014 
-- Design Name: 
-- Module Name:    flip_flop - Behavioral 
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

entity flip_flop is
    Port ( CLK : in  STD_LOGIC;
			  RST : in STD_LOGIC;
			  DATA_IN : in  STD_LOGIC;
           DATA_OUT : out  STD_LOGIC);
end flip_flop;

architecture Behavioral of flip_flop is

begin
	process (CLK, RST) is
	begin
		if (RST = '1') then
			DATA_OUT <= '0';
		elsif rising_edge(CLK) then
			DATA_OUT <= DATA_IN;
		end if;
	end process;	
end Behavioral;