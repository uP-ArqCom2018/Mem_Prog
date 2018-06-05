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
		DATA_o:	out std_logic_vector(31 downto 0)
	);
end Memoria_Programa;

--Arquitectura
architecture Mem_Prog of Memoria_Programa is
	
	--Declaración de tipo arreglo de standar logic vector
	
	type rom_arreglo is array (2**ancho_address-1 downto 0) of std_logic_vector (ancho_inst-1 downto 0);
	
	--Función para lectura de archivo e inicialización de ROM	
	impure function Ini_rom_file (file_name : string) return rom_arreglo is
		file rom_file:			text open read_mode is file_name;
		variable	rom_line:	line;
		variable	rom_value:	bit_vector(ancho_inst-1 downto 0);
		variable	temp:			rom_arreglo;
	begin
		for rom_index in 0 to 2**ancho_address-1 loop
			readline(rom_file,rom_line);
			read(rom_line,rom_value);
			temp(rom_index):=	to_stdlogicvector(rom_value);
		end loop;
		return temp;
	end function;
	
	--Se crea constante con valor de rom
	constant rom: rom_arreglo	:=Ini_rom_file("Valores_ROM.txt");
	
	--Se comienza la arquitectura
	begin
	
	--Se realiza el proceso de la Rom
	
	process(CLK_i,RESET_i)
		begin
			if RESET_i='1' then
				DATA_o<=(others=>'0');
			elsif(CLK_i'event and CLK_i='1') then
				--INSTR_o<=(rom((to_integer(unsigned(ADDR_i)&(unsigned(ADDR_i)+1)&(unsigned(ADDR_i)+2)&(unsigned(ADDR_i)+3)))));
				--INSTR_o<=(rom(ADDR_i));
				DATA_o<=rom((to_integer(unsigned(ADDR_i)))) & rom((to_integer(unsigned(ADDR_i)+1))) & rom((to_integer(unsigned(ADDR_i)+2))) & rom((to_integer(unsigned(ADDR_i)+3)));-- & rom((to_integer(unsigned(ADDR_i)+3)));
			end if;
	end process;
end Mem_Prog;
