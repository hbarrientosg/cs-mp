with Text_io, Ada.Strings.Unbounded;
use Text_io, Ada.Strings.Unbounded;

procedure Practica4 is
	----------------------------------------------------
	-- Subprogramas a realizar en un fichero separado --
	----------------------------------------------------
	-- Separar obtiene dos ristras a partir de R_Total:
	--    En R_Letra están todas las letras de R_Total (menos
	--    las acentuadas y la eñe), y los espacios.
	--    En R_Numer están todos los número de R_Total
	--    y los espacios.
	procedure Separar(R_Total: in  Unbounded_String;
					  R_Letra: out Unbounded_String;
					  R_numer: out Unbounded_String) is separate;

	-- Tratar_Fichero genera, ...
	function Tratar_Fichero(Nom_F_Ent: in Unbounded_String;
							Nom_F_Let: in Unbounded_String;
							Nom_F_Num: in Unbounded_String) return Natural
							is separate;

	----------------------------------------
	-- Fin de los subprogramas a realizar --
	----------------------------------------

	N_Ent, N_Let, N_num : String(1..255); -- Nombres de los ficheros a tratar
	L_Ent, L_Let, L_Num : Natural;        -- Longitudes de los nombres

	Res: Natural; -- Código resultante de Tratar_Fichero
begin
	-- Se obtienen los nombres de los ficheros con que se va a trabajar
	Put("Nombre del fichero a tratar: ");
	Get_line(N_Ent,L_Ent);

	Put("Nombre del fichero alfabético: ");
	Get_line(N_Let,L_Let);

	Put("Nombre del fichero numérico: ");
	Get_line(N_num,L_Num);

	-- Se generan los ficheros de letras y números a partir del original
	Res := Tratar_fichero(To_Unbounded_String(N_Ent(1..L_ent)),
						  To_Unbounded_String(N_Let(1..L_Let)),
						  To_Unbounded_String(N_Num(1..L_Num)));
end Practica4;
