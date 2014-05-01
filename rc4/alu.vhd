----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:45:30 04/30/2014 
-- Design Name: 
-- Module Name:    alu - Behavioral 
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

entity alu is
	 Generic ( size: integer :=8);
    Port ( X : in  STD_LOGIC_VECTOR (size-1 downto 0);
           Y : in  STD_LOGIC_VECTOR (size-1 downto 0);
			  SUM : out  STD_LOGIC_VECTOR (size-1 downto 0);
			  CARRY : out STD_LOGIC);
end alu;

architecture Behavioral of alu is
	signal full_added_carry_signal : STD_LOGIC_VECTOR (size downto 0);
	
	component full_adder
		port(
			X: in STD_LOGIC;
			Y: in STD_LOGIC;
			CARRY_IN: in STD_LOGIC;
			SUM: out STD_LOGIC;
			CARRY_OUT: out STD_LOGIC);
	end component;

begin
	-- the carry_in signal for the fist full adder is connected to ground.
	full_added_carry_signal(0) <= '0';
	
	-- the carry_out from the last full adder is connected to the alu's carry out port.
	carry <= full_added_carry_signal(size);

	gen:
		for i in 0 to size-1 generate
			fa: full_adder port map(X(i), Y(i), full_added_carry_signal(i), SUM(i), full_added_carry_signal(i+1));
		end generate;
end Behavioral ;
