----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:54:59 04/21/2014 
-- Design Name: 
-- Module Name:    full_adder - Behavioral 
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

entity full_adder is
    Port ( X : in STD_LOGIC;
           Y : in STD_LOGIC;
			  CARRY_IN: in STD_LOGIC;
           CARRY_OUT : out STD_LOGIC;
           SUM_OUT : out STD_LOGIC
			  );
end full_adder;

architecture Behavioral of full_adder is
	signal h1_sum_out, h1_carry_out, h2_carry_out: STD_LOGIC;
	
	component half_adder
		port(
				X: in STD_LOGIC;
				Y: in STD_LOGIC;
				SUM: out STD_LOGIC;
				CARRY: out STD_LOGIC
				);
	end component;

begin
	h1: half_adder port map(X, Y, h1_sum_out, h1_carry_out);
	h2: half_adder port map(h1_sum_out, CARRY_IN, SUM_OUT, h2_carry_out);

	CARRY_OUT <= h1_carry_out or h2_carry_out;
end Behavioral;

