----------------------------------------------------------------------------
-- Este fichero contiene un procedimiento de prueba para el tad Racional. --
-- Autor: Zenón Hernández Figueroa.    Fecha última revisión: 20/02/2002. --
----------------------------------------------------------------------------

with Text_Io, Ada.Integer_Text_Io, Numeros_Racionales;
use  Text_Io, Ada.Integer_Text_Io, Numeros_Racionales;

procedure Prac01 is

    R,R1,R2 : Racional;
	N, D    : Integer;
	Seguir  : Character;
begin
	--Saludos
	Put_Line("Programa de prueba de números racionales");
    Put_Line("----------------------------------------");
	New_Line;

	loop
		--entrada de datos
		Put("Numerador del 1er racional..: ");Get(N);
		Put("Denominador del 1er racional: ");Get(D);
		R1 := N / D;
		New_Line;
		Put("Numerador del 2o racional..: ");Get(N);
		Put("Denominador del 2o racional: ");Get(D);
		New_Line;
		R2 := N / D;
		--prueba de igualdad
		if R1 = R2 then
			Put_Line("iguales");
		else
			Put_Line("distintos");
		end if;
		--prueba de suma
		R := R1 + R2;
		Put("suma     = ");
		Put("(");Put(Numerador(R),0);Put("/");Put(Denominador(R),0);Put(")");
		New_Line;
		--prueba de resta
		R := R1 - R2;
		Put("resta    = ");
		Put("(");Put(Numerador(R),0);Put("/");Put(Denominador(R),0);Put(")");
		New_Line;
		--prueba de producto
		R := R1 * R2;
		Put("producto = ");
		Put("(");Put(Numerador(R),0);Put("/");Put(Denominador(R),0);Put(")");
		New_Line;
		--prueba de división
		R := R1 / R2;
		Put("division = ");
		Put("(");Put(Numerador(R),0);Put("/");Put(Denominador(R),0);Put(")");
		New_Line;
		New_Line;
		--¿continuamos?
		Put("Desea realizar otra prueba (S/N):");
		Get(Seguir);
		exit when (Seguir /= 'S');
	end loop;
	New_Line;
	Put_Line("Gracias por utilizar este programa");
end Prac01;

