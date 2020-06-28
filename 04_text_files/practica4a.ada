with Text_io, Ada.Strings.Unbounded;
use Text_io, Ada.Strings.Unbounded;

procedure Practica4 is
	---------------------------------------------------
	-- Subprograma a realizar en un fichero separado --
	---------------------------------------------------
	-- Separar obtiene dos ristras a partir de R_Total:
	--    En R_Letra están todas las letras de R_Total (menos
	--    las acentuadas y la eñe), y los espacios.
	--    En R_Numer están todos los número de R_Total
	--    y los espacios.
	procedure Separar(R_Total: in  Unbounded_String;
					  R_Letra: out Unbounded_String;
					  R_numer: out Unbounded_String) is separate;

	----------------------------------------------------
	-- Grupos de cosntantes para realizar las pruebas --
	----------------------------------------------------
	-- Cada grupo de prueba debe componerse de una ristra para 
	-- proporcionar al procedimiento, y dos con los resultados
	-- que deberían obtenerse.
	R1_T: constant string := "Hola, 243 has58ta 56ahora";
	R1_N: constant string := " 243 58 56";
	R1_L: constant string := "Hola  hasta ahora";

	-- Se pueden realizar más pruebas definiendo otros grupos

	----------------------------------------------------------------
	-- Variables para recoger la salida del procedimiento Separar --
	----------------------------------------------------------------
	N_Sal, L_Sal : Unbounded_String;

begin
	-- En cada prueba se invoca al procedimiento Separar y se 
	-- comprueban los resultados obtenidos.
	Put_Line("Prueba 1");
	Separar(To_Unbounded_String(R1_T), L_Sal, N_Sal);

	-- Comprobación de la ristra numérica
	if N_Sal /= R1_N then
		Put_Line(">>>Error en la ristra de números:");
		Put("----Debe ser: [");
		Put(R1_N);
		Put_Line("]");
		Put("----Es......: [");
		Put(To_String(N_Sal));
		Put_Line("]");
	end if;

	-- Comprobación de la ristra alfabética
	if L_Sal /= R1_L then
		Put_Line(">>>Error en la ristra de letras:");
		Put("----Debe ser: [");
		Put(R1_L);
		Put_Line("]");
		Put("----Es......: [");
		Put(To_String(L_Sal));
		Put_Line("]");
	end if;
	Put_Line("Prueba 1 terminada");
	-- Se pueden realizar más pruebas con otros grupos de prueba
end Practica4;
