-------------------------------------------
-- Programa de prueba de la práctica 2.  --
-- Este programa no debe ser modificado. --
-------------------------------------------

with Text_io, Ada.Integer_text_Io;
use  Text_io, Ada.Integer_text_Io;

-----------------------------------------------------------------------
-- El programa de prueba pide un número natural al usuario y lo usa  --
-- para probar la función Es_Primo, viendo si el valor entrado lo es,--
-- y el procedimiento Producto, calculando el producto del número en --
-- positivo y negativo.                                              --
-----------------------------------------------------------------------
procedure Practica2 is
	------------------------------------------------------
	-- Subprogramas a desarrollar en ficheros separados --
	------------------------------------------------------

	-- Producto se desarrollará en el fichero "practica2-producto.adb"
	procedure Producto(X: in integer; Y: out Integer) is separate;

	-- Es_Primo se desarrollará en el fichero "practica2-es_primo.adb"
	function Es_Primo(N: in Natural) return Boolean is separate;

	-----------------------------------------------------------------
	-- Fin de los subprogramas a desarrollar en ficheros separados --
	-----------------------------------------------------------------

	-----------------------------------------
	-- variables para realizar las pruebas --
	-----------------------------------------
	X   : Natural;		-- Dato de entrada
	P1,					-- Producto de 1 hasta X 
	P2	: Integer;		-- Producto de -1 a -X
	Resp: Character;	-- Variable de control para continuar las pruebas
begin
	Put_Line("Hola, vamos a probar los subprogramas...");
	-- El bucle repite las pruebas mientras el usuario quiera
	loop		
		-- Entrada de los datos para trabajar
		New_Line;
		Put_line("Dame un valor natural");

		Put("El valor es: ");
		Get(X);
		New_Line;

		-- Prueba de la función Es_Primo
		Put("El ");
		Put(X,0);
		if Es_Primo(X) then
			Put(" es ");
		else
			Put(" no es ");
		end if;
		Put("primo");
		New_Line;

		-- Prueba del procedimiento Producto
		Producto(X, P1);
		Producto(-X, P2);

		Put("El producto de todos los valores entre 1 y ");
		Put(X,0);
		Put(" es: ");
		Put(P1,0);
		New_Line;

		Put("El producto de todos los valores entre -1 y ");
		Put(-X,0);
		Put(" es: ");
		Put(P2,0);
		New_Line(2);

		-- Control para continuar las pruebas
		Put("Repetimos? (S/s) ");
		Get(Resp);
		New_Line;

		exit when (Resp /= 'S') and (Resp /= 's');
	end loop;
end;
