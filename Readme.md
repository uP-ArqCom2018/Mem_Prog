# Memoria de Programa del [Microprocesador]
##### Autores: Suarez Facundo - Parisi Pablo
### Descripción
El objetivo de dicha unidad es proporcionar la instrucción que debe ejecutarse a través de una Memoria que contiene el programa almacenado sobre un arreglo de 2ˆ10 palabras de 1 byte. Al realizar un cambio de la instrucción se proporcionan los valores de las 4 palabras de 1 byte, a través de la concatenación, para determinar la instrucción de 32 bits que será repartida sobre el Datapath.
* Entradas:
  - ADDRESS_i [10...0] : Indica la dirección donde se determina la dirección de la próxima instrucción que se ejecuta.
  - CLK_i : Señal de sincronismo.
  - RESET_i : Señal de reset.
* Salidas:
  - DATA_o [31...0] : Instrucción que ejecuta el procesador.

La unidad *Program Counter* brindará a este módulo la dirección correspondiente a la instrucción que se ejecutará. Ésta misma se distribuye a lo largo del Datapath del procesador.

#### Dependencias: 
Para la implementación de hardware se utilizan las librerías:  *ieee.std_logic_1164*, *ieee.numeric_std*, *ieee.math_real*, *ieee.std_logic_misc*, *std.textio*.
Con el propósito de efectuar la inicialización de la Memoria a través de un archivo de texto, se realiza la declaración de la función *Ini_rom_file*.
Se declara un proceso que realiza la muestra en forma concatenada del contenido de las 4 palabras (la palabra determinada por la dirección y las tres adyacentes).
##### Descripción de Función *Ini_rom_file* 
Puede decirse que ejecutan tres pasos: En primer lugar se lee una linea de texto desde un archivo; a continuación se efectúa la lectura de la linea,en forma de un vector de bits. 
Por último, se lo convierte en un dato del tipo STD_LOGIC_VECTOR.
#### Revisión: 
La primer revisión incluye el testbench con el que se realizó la primer simulación de la descripción.

#### Comentarios Adicionales:
Es posible utilizar el paquete *IEEE.std_logic_textio* en lugar de todas las demás. Dicho planteamiento se deja documentado para una posible futura mejora de la descripción del hardware.

[Microprocesador]: <https://github.com/uP-ArqCom2018>
[Suarez Facundo]: <https://github.com/ffsuarez/>
[Parisi Pablo]:<https://github.com/pmparisi>