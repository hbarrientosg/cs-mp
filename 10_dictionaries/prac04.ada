------------------------------------------------------------------------
-- Este programa sirve para probar el paquete "Conjunto_De_Palabras", --
-- mediante un men� que permite realizar inserciones y b�squedas.     --
-- �ltima revisi�n: 5 de Junio de 2001.                               --
------------------------------------------------------------------------

with Text_Io,
     Conjunto_De_Palabras,Conjunto_De_Palabras.Adicional,
	 Ada.Strings.Unbounded;
use  Text_Io,
     Conjunto_De_Palabras,Conjunto_De_Palabras.Adicional,
	 Ada.Strings.Unbounded;

procedure Prueba is
    package Entrada_Int is new Integer_Io(Natural);
    use Entrada_Int;
    D, D1 : Tdiccionario;  --Variable para almacenar las palabras.
    P : String(1..15); --Variable para leer palabras.
    L : Natural;       --Longitud de la palabra le�da.
    Op: Natural;       --Opci�n de men�.
begin
    Put_Line("Se van a crear 2 diccionarios");
    loop   --Bucle de men�: Permite insertar palabras o buscarlas.
        Put_Line("Para insertar una palabra en el primer diccionario, teclee un.... 1");
        Put_Line("Para ver si una palabra est"&Character'Val(160)&" en el primer diccionario, teclee un. 2");
        Put_Line("Para extraer una palabra del primer diccionario, teclee un....... 3");
        New_Line;
        Put_Line("Para insertar una palabra en el segundo diccionario, teclee un... 4");
        Put_Line("Para ver si una palabra est"&Character'Val(160)&" en el segundo diccionario, teclee un 5");
        Put_Line("Para extraer una palabra del segundo diccionario, teclee un...... 6");
        New_Line;
        Put_Line("Para ver si ambos diccionarios son iguales, teclee un............ 7");
        Put_Line("Para terminar la ejecuci"&Character'Val(162)&"n, teclee un............................ 8");
        Put("Elija su opci"&Character'Val(162)&"n: ");Get(Op);Skip_Line;
        case Op is 
            when 1 =>  --Opci�n Insertar.
                Put("Palabra a insertar: ");Get_Line(P,L);
                Insertar(D,To_Unbounded_String(P(1..L)));
            when 2 =>  --Opci�n Buscar.
                Put("Palabra a buscar: ");Get_Line(P,L);
    			if not Est�(D,To_Unbounded_String(P(1..L))) then
        			Put(">>>No, ");Put_Line(P(1..L));
    			else
        			Put(">>>Si, ");Put_Line(P(1..L));
                end if;
            when 3 => --Opci�n extraer
                Put("Palabra a extraer: ");Get_Line(P,L);
                Extraer(D,To_Unbounded_String(P(1..L)));                 
            when 4 =>  --Opci�n Insertar.
                Put("Palabra a insertar: ");Get_Line(P,L);
                Insertar(D1,To_Unbounded_String(P(1..L)));
            when 5 =>  --Opci�n Buscar.
                Put("Palabra a buscar: ");Get_Line(P,L);
    			if not Est�(D1,To_Unbounded_String(P(1..L))) then
        			Put(">>>No, ");Put_Line(P(1..L));
    			else
        			Put(">>>Si, ");Put_Line(P(1..L));
                end if;
            when 6 => --Opci�n extraer
                Put("Palabra a extraer: ");Get_Line(P,L);
                Extraer(D1,To_Unbounded_String(P(1..L)));                 
            when 7 => --Opci�n igualdad
                --hay que cualificar el "=" porque no se ha declarado el Tdiccionario
                --como limited private y podr�a haber confusi�n con el operador de igualdad
                --est�ndar (en este caso igualdad de punteros).
                if Conjunto_De_Palabras.Adicional."="(D,D1) then
                    Put_Line(">>>Iguales");
                else
                    Put_Line(">>>Distintos");
                end if;
            when 8 => exit;
            when others => null;
        end case;  
    end loop;
exception
    when E_No_Espacio =>  --Puede ocurrir al intentar Insertar si no hay memoria disponible.
        Put_Line("Insuficientes recursos para ejecutar el programa");
end Prueba;
