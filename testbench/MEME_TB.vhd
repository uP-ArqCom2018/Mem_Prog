--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:04:51 06/04/2018
-- Design Name:   
-- Module Name:   D:/Arq_computadoras/MEM/MEME/MEME_TB.vhd
-- Project Name:  MEME
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Memoria_Programa
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
 
ENTITY MEME_TB IS
END MEME_TB;
 
ARCHITECTURE behavior OF MEME_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Memoria_Programa
    PORT(
         CLK_i : IN  std_logic;
         RESET_i : IN  std_logic;
         ADDR_i : IN  std_logic_vector(9 downto 0);
         INSTR_o : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK_i : std_logic := '0';
   signal RESET_i : std_logic := '0';
   signal ADDR_i : std_logic_vector(9 downto 0) := (others => '0');

 	--Outputs
   signal INSTR_o : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_i_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Memoria_Programa PORT MAP (
          CLK_i => CLK_i,
          RESET_i => RESET_i,
          ADDR_i => ADDR_i,
          INSTR_o => INSTR_o
        );

   -- Clock process definitions
   CLK_i_process :process
   begin
		CLK_i <= '0';
		wait for CLK_i_period/2;
		CLK_i <= '1';
		wait for CLK_i_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      RESET_i<='1';
		wait for 10 ns;	

      --wait for CLK_i_period*10;

      -- insert stimulus here 
		ADDR_i<="0000000000";
		RESET_i<='0';
      wait;
   end process;

END;
