------------------------------------------ ----------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:00:43 04/30/2014 
-- Design Name: 
-- Module Name:    accumulator - Behavioral 
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

entity accumulator is
	Generic ( size: integer :=8);
	Port (
		CLK: in STD_LOGIC;
		DATA_IN: in STD_LOGIC_VECTOR (size-1 downto 0);
		DATA_OUT: out STD_LOGIC_VECTOR (size-1 downto 0);
		CARRY: out STD_LOGIC
	);
end accumulator;

architecture Behavioral of accumulator is

	component alu is
		 Generic ( size: integer :=8);
		 Port ( X : in  STD_LOGIC_VECTOR (size-1 downto 0);
				  Y : in  STD_LOGIC_VECTOR (size-1 downto 0);
				  SUM : out  STD_LOGIC_VECTOR (size-1 downto 0);
				  CARRY : out STD_LOGIC);
	end component;

	component register_cell is
		Generic ( width: integer :=size);
		Port (DATA_IN : in  STD_LOGIC_VECTOR ((width - 1) downto 0);
				DATA_OUT: out STD_LOGIC_VECTOR ((width - 1) downto 0);
				CLK : in  STD_LOGIC);
	end component;

	signal rc_in, rc_out: STD_LOGIC_VECTOR (size-1 downto 0) := (size-1 downto 0 => '0');

begin

	al: alu port map (
		X => DATA_IN,
		Y => rc_out,
		SUM => rc_in,
		CARRY => CARRY
	);

	result_cell: register_cell port map (
		DATA_IN => rc_in,
		DATA_OUT => rc_out,
		CLK => CLK
	);

	DATA_OUT <= rc_out;

end Behavioral;
