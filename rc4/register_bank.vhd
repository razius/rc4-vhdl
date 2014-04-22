----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:04:46 04/21/2014 
-- Design Name: 
-- Module Name:    register_bank - Behavioral 
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

entity register_bank is
	Generic ( cell_width: integer :=8; -- the width in bits of a register cell
				 cell_no: integer :=256; -- the total number of register cells
				 addr_width: integer := 8); -- the width in bits of the address bus 
	Port (DATA_IN: in  STD_LOGIC_VECTOR (cell_width-1 downto 0);
			DATA_OUT: out STD_LOGIC_VECTOR (cell_width-1 downto 0);
			READ_ADDR: in STD_LOGIC_VECTOR (addr_width-1 downto 0); 
			WRITE_ADDR: in STD_LOGIC_VECTOR (addr_width-1 downto 0);
			CLK: in  STD_LOGIC);
end register_bank;

architecture Behavioral of register_bank is
	-- signals going out of the address decoders for the address and data bus.
	signal read_addr_decoded, write_addr_decoded: STD_LOGIC_VECTOR ((cell_no - 1) downto 0);

	-- holds and value of clock and address bus. determines if a register cell is clocked.
	signal is_clocked: STD_LOGIC_VECTOR ((cell_no - 1) downto 0);

	-- signals going out of the registry cells.
	type signal_matrix is ARRAY ((cell_no - 1) downto 0) of STD_LOGIC_VECTOR ((cell_width - 1) downto 0);
	signal register_cells_out: signal_matrix;
	
	component address_decoder is
		 Generic ( width: integer :=addr_width);
		 Port ( DATA_IN : in  STD_LOGIC_VECTOR ((width - 1) downto 0);
				  DATA_OUT : out  STD_LOGIC_VECTOR ((cell_no - 1) downto 0));
	end component;

	component register_cell is
		Generic ( width: integer :=cell_width);
		Port (DATA_IN : in  STD_LOGIC_VECTOR ((width - 1) downto 0);
				DATA_OUT: out STD_LOGIC_VECTOR ((width - 1) downto 0);
				CLK : in  STD_LOGIC);
	end component;
begin
	ab: address_decoder port map(
		DATA_IN => READ_ADDR,
		DATA_OUT => read_addr_decoded
	);
	db: address_decoder port map(
		DATA_IN => WRITE_ADDR,
		DATA_OUT => write_addr_decoded
	);
	gen:
	  for i in cell_no-1 downto 0 generate
			is_clocked(i) <= CLK and write_addr_decoded(i);
			rc: register_cell port map(
				DATA_IN => DATA_IN,
				DATA_OUT => register_cells_out(i),
				CLK => is_clocked(i)
			);
			DATA_OUT <= register_cells_out(i) when (read_addr_decoded(i) = '1') else (cell_width-1 downto 0 => 'Z');
	  end generate;   
end Behavioral;
