---------------------------------------------------------------------
--                 Prueba de la práctica 3 de                      --
-- Metodología de la Programación/Metodología de la Programación I --
---------------------------------------------------------------------
with Text_Io, Ada.Integer_Text_Io;
use  Text_Io, Ada.Integer_Text_Io;

procedure Practica_3 is
	---------------------------------------------
	-- Declaraciones de tipos para la práctica --
	---------------------------------------------
	subtype Numero_Corto is Integer range -127..128;
	type Matriz is array(Positive range <>, Positive range <>) of Numero_Corto;

	type Vector is array(Positive range <>) of Numero_Corto;

	type TMayor is record
		Elemento: Numero_Corto;
		Posi    : Positive;
	end record;

	-- Excepción que debe lanzarse si se produce un error de desbordamiento
	-- cuando se está realizando una suma de valores de tipo Numero_Corto.
	Error_Suma : Exception;

	------------------------------------------------------
	-- Subprogramas a desarrollar en ficheros separados --
	------------------------------------------------------

	-- Devuelve un vector con la suma de todas las filas de una matriz.
	-- Si se produce un error al intentar sumar dos valores lanza la 
	-- excepción Error_Suma.
	function Suma_Filas(M:Matriz) return Vector is separate;

	-- Devuelve el mayor elemento de un vector y su posición.
	function Mayor(V:Vector) return TMayor is separate;
	-------------------------------------------
	-- Fin de los subprogramas a desarrollar --
	-------------------------------------------

	-----------------------------
	-- Subprogramas auxiliares --
	-----------------------------

	-- El procedimiento Prueba se encarga de probar un caso
	-- de los subprogramas Suma_Filas y Mayor:
	--    M: matriz de prueba,
	--    V: resultado que debe dar la suma de las filas de M,
	--    E: resultado de la búsqueda del mayor y su posición en V.
	procedure Prueba(M: in Matriz; V: in Vector; E: in TMayor) is
		Vec: Vector(M'range(2));
		Max: TMayor;
	begin
		Vec := Suma_Filas(M);
		if Vec /= V then
			Put_Line(">>> Error en la suma");
		else
			Max := Mayor(Vec);
			if Max /= E then
				Put_Line(">>> Error al determinar el mayor");
			else
				Put_Line(">>> Terminada sin errores");
			end if;
		end If;
	end Prueba;

	-----------------------------------------
	-- Variables necesarias para la prueba --
	-----------------------------------------
	
	-- Se declaran trios (Matriz/Vector/TMayor) para probar
	-- los subprogramas. El Vector debe representar el valor 
	-- correcto de la suma de las filas de la matriz, y el TMayor
	-- debe representar el valor correcto para la búsqueda del mayor
	-- elemento y su posición en el vector.
	-- Este trio prueba el funcionamiento "normal" de los subprogramas.
	M1 : Matriz(1..3, 1..4) :=
		(
		 ( 12,-21, 20, 99),
		 (  3, 40, 19,  0),
 		 (  8, 10,-15, 23)
		);
	V1 : Vector(1..4) := (23, 29, 24, 122);
	E1 : TMayor := (122, 4);

	-- Este trio sirve para para provocar la excepción Error_Suma.
	M2 : Matriz(1..3, 1..4) :=
		(
		 ( 12,-21, 20, 99),
		 (  3, 40, 19,128),
 		 (  8, 10,-15, 23)
		);
	V2 : Vector(1..4) := (23, 29, 24, 122); -- incorrecto
	E2 : TMayor := (122, 4);                -- incorrecto

	-- Se pueden hacer más pruebas definiendo otros trios
	-- (Matriz/Vector/TMayor) y llamando con ellos al procedimiento
	-- Prueba. 

begin  -- Practica_3
	Put_Line("*************************************************************");
	Put_Line("* Programa de prueba de los subprogramas Suma_Filas y Mayor *");
	Put_Line("*************************************************************");

	Put_Line("Prueba 1");
	Prueba(M1, V1, E1);

	-- La prueba 2 comprueba si la excepción Error_Suma se produce cuando debe
	Put_Line("Prueba 2");
	begin
		Prueba(M2, V2, E2);
		Put_Line(">>> Deberia haberse producido Error_Suma");
	exception
		when Error_Suma => Put_Line(">>> Error_suma OK, prueba correcta");
		when others     => Put_Line(">>> Error inesperado"); raise;
	end;

	-- Se pueden hacer más pruebas definiendo otros trios
	-- (Matriz/Vector/TMayor) y llamando con ellos al procedimiento
	-- Prueba. 
end Practica_3;
