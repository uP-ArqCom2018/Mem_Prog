--------------------------------------------------------------------------------
-- Alumnos: Suarez Facundo-Parisi Pablo
--
-- Fecha:   16:04:51 06/04/2018
-- Nombre del dise�o: Memoria de Programa   

-- Nombre del proyecto:  Memoria_Programa
-- Dispositivo: --  
-- Herramienta utilizada: Quartus Prime Lite Edition,ISE Xilinx , GHDL
-- Version usada de herramienta:  
-- Descripcion: El objetivo de dicha unidad es proporcionar la instrucci�n que debe ejecutarse a trav�s de una Memoria
--		que contiene el programa almacenado sobre un arreglo de 2**10 palabras de 1 byte. Al realizar un cambio de la instrucci�n
--		se proporcionan los valores de las 4 palabras de 1 byte, a trav�s de la concatenaci�n, para determinar la instrucci�n de 
--		32 palabras que ser� repartida sobre el Datapath.
--				  
-- 
--Entradas Genericas: 
--					*  anch_inst: Ancho de la palabra en la memoria.
-- 					*  ancho_address: Ancho de la direccion de la palabra.
--
--
--Entradas:			
--					* CLK_i: Se�al de sincronismo.
--					* RESET_i: Se�al de reinicializacion.
--					* ADDR_i: Indica la direcci�n donde se determina la direcci�n de la pr�xima instrucci�n que se ejecuta.
--Salidas:					
--					* DATA_o: Instrucci�n que ejecuta el procesador.
--
-- Dependencias: Librerias ieee, ieee.std_logic_1164, ieee.numeric_std
--				ieee.math_real, ieee.std_logic_misc, std.textio
-- 
-- Revision:
-- Revision 1.00 - Creacion Codigo, simulacion con testbench.
-- Comentarios adicionales:
--		Descripci�n de Funci�n "Ini_rom_file":
--				Puede decirse que ejecutan tres pasos: En primer lugar se lee una linea de texto desde un archivo
--				a continuaci�n se efect�a la lectura de la linea,en forma de un vector de bits.
--				Por �ltimo, se lo convierte en un dato del tipo STD_LOGIC_VECTOR.
-- Notas: 
--		Es posible utilizar el paquete *IEEE.std_logic_textio* en lugar de todas las dem�s.
--		Dicho planteamiento se deja documentado para una posible futura mejora de la descripci�n del hardware.
--
--Fuentes utilizadas: 
-- Enlace web: https://ceworkbench.wordpress.com/2014/05/11/initializing-an-fpga-rom-from-a-text-file/
--------------------------------------------------------------------------------

-- Se escriben las librerias y paquetes
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use ieee.std_logic_misc.all;
use std.textio.all;
--use IEEE.std_logic_textio.all;

--Entidad
entity Memoria_Programa is
	generic(
		ancho_inst:		integer := 8;
		ancho_address:	integer := 10
	);
	port(
		CLK_i:	in  std_logic;
		RESET_i:	in	 std_logic;
		ADDR_i:	in	 std_logic_vector(ancho_address-1 downto 0);
		DATA_o:	out std_logic_vector((4*ancho_inst)-1 downto 0)
	);
end Memoria_Programa;

--Arquitectura
architecture Mem_Prog of Memoria_Programa is
	
	--Declaraci�n de tipo arreglo de standar logic vector
	
	type rom_arreglo is array (2**ancho_address-1 downto 0) of std_logic_vector (ancho_inst-1 downto 0);
	
	signal rom: rom_arreglo;


	
	--Se crea constante con valor de rom
	--constant rom: rom_arreglo	:=Ini_rom_file("Valores_ROM.txt");
	
	
	--Se comienza la arquitectura
	begin
	rom(35 downto 0)<=(
	"00010011",--se agrega una ultima instrucción porque este micro nunca salta
	"00000010",
	"10100000",
	"00000000",
	"11100011",
	"10011010",
	"01000000",
	"11111110",
	"10010011",
	"10000000",
	"00010000",
	"00000000",
	"00100011",
	"10100101",
	"10010000",
	"00000000",
	"10110011",
	"10000100",
	"00100100",
	"00000000",
	"00010011",
	"10010001",
	"00010000",
	"00000000",
	"10000011",
	"10100100",
	"10100000",
	"00000000",
	"10010011",
	"00000000",
	"00000000",
	"00000000",
	"00010011",
	"00000010",
	"10100000", 
	"00000000"
	);
	--Se realiza el proceso de la Rom
	
	process(CLK_i,RESET_i)
		begin

			if RESET_i='0' then
				DATA_o<=(others=>'0');
			elsif(CLK_i'event and CLK_i='1') then
				DATA_o<=rom((to_integer(unsigned(ADDR_i)))) & rom((to_integer(unsigned(ADDR_i)+1))) & rom((to_integer(unsigned(ADDR_i)+2))) & rom((to_integer(unsigned(ADDR_i)+3)));-- & rom((to_integer(unsigned(ADDR_i)+3)));
			end if;
			
	end process;
end Mem_Prog;
