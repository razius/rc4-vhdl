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
			COUNT: out STD_LOGIC_VECTOR (size-1 downto 0);
			OVERFLOW: out STD_LOGIC);
end counter;

architecture Behavioral of counter is
	component register_cell is
		 Generic ( width: integer :=size);
		 Port ( DATA_IN : in  STD_LOGIC_VECTOR (width-1 downto 0);
				  DATA_OUT: out STD_LOGIC_VECTOR (width-1 downto 0);
				  CLK : in  STD_LOGIC);
	end component;
	
	component alu is
		 Generic ( size: integer :=size);
		 Port ( X : in  STD_LOGIC_VECTOR (size-1 downto 0);
				  Y : in  STD_LOGIC_VECTOR (size-1 downto 0);
				  SUM : out  STD_LOGIC_VECTOR (size-1 downto 0);
				  CARRY: out STD_LOGIC);
	end component;
	signal NEW_RESULT, STORED_RESULT: STD_LOGIC_VECTOR (size-1 downto 0);
begin
		al: alu port map(
			X => STORED_RESULT,
			Y => (size-1 downto 1 => '0', others => '1' ),
			SUM => NEW_RESULT,
			CARRY => OVERFLOW
		);
		rc: register_cell port map(
			DATA_IN => NEW_RESULT,
			DATA_OUT => STORED_RESULT,
			CLK => CLK
		);
		COUNT <= STORED_RESULT;
end Behavioral;

