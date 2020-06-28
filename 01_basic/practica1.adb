--Cláusula de contexto con las librerías básicas de E/S.
with Text_Io, Ada.Integer_Text_IO;
use Text_Io, Ada.Integer_Text_IO;

--Aquí empieza el procedimiento principal del programa.
procedure Practica1 is
	--Aquí van las declaraciones del algoritmo.
	n:integer;--Declaro la variable de entrada N
begin
	--aquí van las sentencias ejecutables del algoritmo.
	put_line("Por favor deme un numero entero:");
	get(n);-- le pido al usuario que me de el valor entero
	If N > 0 then
		for i in 1..n loop-- Con esta estructura para coloco los numeros en columna por pantalla de menor a mayor 
			put(I);       -- lo realizo con una estructura "para" por que me parece mas optima pero tambien se podria utilizar un mientra lo unico que deberiamos declarar una variable contadora
			new_line;
		end loop;
	else
		if n < 0 then
			for I in  reverse N..-1 loop
				put(I);-- en esta estructura es parecida a la anterior solo que los coloca de menor a mayor
				new_line;
			end loop;
		else
			put_line("CERO");-- pone cero por que no entra en los dos casos anteriores
		end if;
	end if;
end Practica1;
