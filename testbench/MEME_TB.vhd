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
 

--USE ieee.numeric_std.ALL;
 
ENTITY Mem_Prog_tb IS
END Mem_Prog_tb;
 
ARCHITECTURE behavior OF Mem_Prog_tb IS 
 
    -- Declaracion del componente unidad bajo prueba (UUT)
 
    COMPONENT Memoria_Programa
    PORT(
         ADDR_i : IN  std_logic_vector(9 downto 0);
         INSTR_o : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Entradas
   signal ADDR_i : std_logic_vector(9 downto 0) := (others => '0');

 	--Salidas
   signal INSTR_o : std_logic_vector(31 downto 0);

   -- Definicion de periodo de clock

 
BEGIN
 
	-- Instanciacion de UUT
   uut: Memoria_Programa PORT MAP (
          CLK_i => CLK_i,
          RESET_i => RESET_i,
          ADDR_i => ADDR_i,
          INSTR_o => INSTR_o
        );


   -- Proceso de estimulo
	stim_proc: process
		begin		
			RESET_i<='1';
			wait for 10 ns;	
			ADDR_i<="0000000000";
			RESET_i<='0';
		wait;
	end process;

END;
