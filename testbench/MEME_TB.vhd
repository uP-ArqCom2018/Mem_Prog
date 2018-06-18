--------------------------------------------------------------------------------
-- Alumnos: Suarez Facundo-Parisi Pablo
--
-- Fecha:   16:04:51 06/04/2018
-- Nombre del diseño: Testbench de memoria de programa   

-- Nombre del proyecto:  Mem_Prog_tb
-- Dispositivo: --  
-- Version usada de herramienta:  
-- Descripcion: Simulacion del modulo de memoria de programa del microprocesador
--				implementado en la materia Arquitectura de Computadoras 
--				  
-- 

-- 
-- Dependencias:
-- 
-- Revision:
-- Revision 0.01 - Creacion Testbench
-- Comentarios adicionales:
--
-- Notas: 

--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

USE ieee.numeric_std.ALL;
 
ENTITY Mem_Prog_tb IS
END Mem_Prog_tb;
 
ARCHITECTURE behavior OF Mem_Prog_tb IS 
 
    -- Declaracion del componente unidad bajo prueba (UUT)
 
    COMPONENT Memoria_Programa
    PORT(
         CLK_i : IN  std_logic;
         RESET_i : IN  std_logic;
         ADDR_i : IN  std_logic_vector(9 downto 0);
         DATA_o : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Entradas
   signal CLK_i : std_logic := '0';
   signal RESET_i : std_logic := '0';
   signal ADDR_i : std_logic_vector(9 downto 0) := (others => '0');

 	--Salidas
   signal DATA_o : std_logic_vector(31 downto 0);

   -- Definicion de periodo de clock
   constant CLK_i_period : time := 10 ns;
 
BEGIN
 
	-- Instanciacion de UUT
   uut: Memoria_Programa PORT MAP (
          CLK_i => CLK_i,
          RESET_i => RESET_i,
          ADDR_i => ADDR_i,
          DATA_o => DATA_o
        );

   -- Definicion de proceso de clock
   CLK_i_process :process
   begin
		CLK_i <= '0';
		wait for CLK_i_period/2;
		CLK_i <= '1';
		wait for CLK_i_period/2;
   end process;
 

   -- Proceso de estimulo
	stim_proc: process
		begin		
			RESET_i<='1';
			wait for 10 ns;	
			ADDR_i<="0000000000";
			wait for 20 ns;
			RESET_i<='0';
			for sel_ADDR_i in 0 to 2 ** ADDR_i'length - 1 loop
				ADDR_i <= std_logic_vector(to_unsigned(sel_ADDR_i, ADDR_i'length));
				wait for 5 ns;
			end loop;

		wait;
	end process;

END;
