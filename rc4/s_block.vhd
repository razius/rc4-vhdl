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
-- any Xilinx primitives in this code.2
--library UNISIM;
--use UNISIM.VComponents.all;

entity s_block is
	Port(
		CLK: in STD_LOGIC;
		RST: in STD_LOGIC;
		INDEX: in STD_LOGIC_VECTOR (7 downto 0);
		READY: out STD_LOGIC;
		VALUE: out STD_LOGIC_VECTOR (7 downto 0)
	);
end s_block;

architecture Behavioral of s_block is
	component register_bank is
		Generic ( cell_width: integer :=8; -- the width in bits of a register cell
					 cell_no: integer :=256; -- the total number of register cells
					 addr_width: integer := 8); -- the width in bits of the address bus 
		Port (DATA_IN: in  STD_LOGIC_VECTOR (cell_width-1 downto 0);
				DATA_OUT: out STD_LOGIC_VECTOR (cell_width-1 downto 0);
				READ_ADDR: in STD_LOGIC_VECTOR (addr_width-1 downto 0); 
				WRITE_ADDR: in STD_LOGIC_VECTOR (addr_width-1 downto 0);
				CLK: in  STD_LOGIC;
				RST: in STD_LOGIC);
	end component;

	component flip_flop is
		 Port ( CLK : in  STD_LOGIC;
				  RST : in STD_LOGIC;
				  DATA_IN : in  STD_LOGIC;
				  DATA_OUT : out  STD_LOGIC);
	end component;

	component accumulator is
		Generic ( size: integer :=8);
		Port (
			CLK: in STD_LOGIC;
			RST: in STD_LOGIC;
			DATA_IN: in STD_LOGIC_VECTOR (size-1 downto 0);
			DATA_OUT: out STD_LOGIC_VECTOR (size-1 downto 0);
			CARRY: out STD_LOGIC
		);
	end component;

	component alu is
		 Generic ( size: integer :=8);
		 Port ( X : in  STD_LOGIC_VECTOR (size-1 downto 0);
				  Y : in  STD_LOGIC_VECTOR (size-1 downto 0);
				  SUM : out  STD_LOGIC_VECTOR (size-1 downto 0);
				  CARRY : out STD_LOGIC);
	end component;

	signal counter_value: STD_LOGIC_VECTOR (7 downto 0);
	signal counter_overflow: STD_LOGIC;
	
	signal i_clock, i_initialized: STD_LOGIC;
	signal i_index, i_value: STD_LOGIC_VECTOR (7 downto 0);

	signal j_initialized: STD_LOGIC;
	signal j_index, j_value, i_plus_k, acc_value: STD_LOGIC_VECTOR (7 downto 0);

	signal t_initialized: STD_LOGIC;
	signal t_index, t_value: STD_LOGIC_VECTOR (7 downto 0);

begin
	counter: accumulator port map(
		CLK => CLK,
		RST => RST,
		DATA_IN => (size-1 downto 0);
		DATA_OUT => counter_value,
		CARRY => counter_overflow
	);
	
	--

	i_rb: register_bank port map(
		DATA_IN => counter_value,
		DATA_OUT => i_value,
		READ_ADDR => i_index,
		WRITE_ADDR => counter_value,
		CLK => CLK and not i_initialized,
		RST => RST
	);
	
	i_fp: flip_flop port map(
		CLK => counter_overflow,
		RST => RST,
		DATA_IN => '1',
		DATA_OUT => i_initialized
	);
		
	
		
end Behavioral;