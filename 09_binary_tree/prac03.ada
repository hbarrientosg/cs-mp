------------------------------------------------------------------------
-- Este programa sirve para probar el paquete "Conjunto_De_Palabras", --
-- mediante un men� que permite realizar inserciones y b�squedas.     --
-- �ltima revisi�n: 2 de Mayo de 2001.                                --
------------------------------------------------------------------------

with Text_Io,Conjunto_De_Palabras,Ada.Strings.Unbounded;
use Text_Io,Conjunto_De_Palabras,Ada.Strings.Unbounded;

procedure Prueba is
    package Entrada_Int is new Integer_Io(Natural);
    use Entrada_Int;
    D : Tdiccionario;  --Variable para almacenar las palabras.
    P : String(1..15); --Variable para leer palabras.
    L : Natural;       --Longitud de la palabra le�da.
    Op: Natural;       --Opci�n de men�.
begin
    loop   --Bulce de men�: Permite insertar palabras o buscarlas.
        Put_Line("Para insertar una palabra, teclee un..................... 1");
        Put_Line("Para ver si una palabra est"&Character'Val(160)&" en el diccionario, teclee un 2");
        Put_Line("Para terminar la ejecuci"&Character'Val(162)&"n, teclee un.................... 3");
        Put("Elija su opci"&Character'Val(162)&"n: ");Get(Op);Skip_Line;
        case Op is 
            when 1 =>  --Opci�n Insertar.
                Put("Palabra a insertar: ");Get_Line(P,L);
                Insertar(D,To_Unbounded_String(P(1..L)));
            when 2 =>  --Opci�n Buscar.
                Put("Palabra a buscar: ");Get_Line(P,L);
    			if not Est�(D,To_Unbounded_String(P(1..L))) then
        			Put("No, ");Put_Line(P(1..L));
    			else
        			Put("Si, ");Put_Line(P(1..L));
                end if;
            when 3 => exit;
            when others => null;
        end case;  
    end loop;
    -- Al terminar se informa del n�mero de palabras y del de caracteres que han sido almacenados.
    Put("N"&Character'Val(163)&"mero de palabras en el "&Character'Val(160)&"rbol  : "); Put(Palabras(D),0); New_Line;
    Put("N"&Character'Val(163)&"mero de caracteres en el "&Character'Val(160)&"rbol: "); Put(Caracteres(D),0); New_Line;
exception
    when E_No_Espacio =>  --Puede ocurrir al intentar Insertar si no hay memoria disponible.
        Put_Line("Insuficientes recursos para ejecutar el programa");
end Prueba;
