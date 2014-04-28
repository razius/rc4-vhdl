--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:45:36 04/28/2014
-- Design Name:   
-- Module Name:   Z:/workspace/school/Sem6/DES/Handin/code/rc4/s_block_testbench.vhd
-- Project Name:  rc4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: s_block
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY s_block_testbench IS
END s_block_testbench;
 
ARCHITECTURE behavior OF s_block_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT s_block
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         INDEX : IN  std_logic_vector(7 downto 0);
         VALUE : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal INDEX : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal VALUE : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: s_block PORT MAP (
          CLK => CLK,
          RST => RST,
          INDEX => INDEX,
          VALUE => VALUE
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		RST <= '1';

      wait for CLK_period*10;

		RST <= '0';

		INDEX <= (7 downto 1 => '0', others => '1');
      -- insert stimulus here 

      wait;
   end process;

END;
