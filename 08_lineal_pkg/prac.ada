-------------------------------------------------------------------
--Prueba_Colas: programa de prueba del paquete Colas_Restringidas--
--Autor: Zenón J. Hernández Figueroa                             --
--Última revisión: 21-03-2001                                    --
-------------------------------------------------------------------
with Text_Io,Colas_Restringidas;
use Text_Io;

-------------------------------------------------------------------
--La prueba se realiza declarando una Cola de elementos de tipo  --
--integer. El tamaño de la Cola viene determinado por Num_elem   --
--La prueba se divide en tres fases:                             --
--(1) Se insertan elementos en la Cola hasta que se produzca la  --
--    excepción E_Cola_Llena. Se comprueba que la excepción se   --
--    produce cuando  se  han  insertado Num_elem elementos. En  --
--    cada inserción se comprueban las postcondiciones de        --
--    Insertar.                                                  --
--(2) Se extraen elementos de  la Cola hasta que se produzca la  --
--    excepción E_Cola_Vacía. Se comprueba que la excepción se   --
--    produce cuando se han  extraído  Num_elem  elementos.  En  --
--    cada extracción se comprueba el tamaño y el frente de      --
--    la cola.                                                   --
--(3) Se combinan insersiones y extracciones para comprobar que  --
--    no se producen falsos overflow.                            --
-------------------------------------------------------------------
procedure Prueba_Colas is
    --excepciones relacionadas conla prueba
    Error_1, Error_2, Error_3, Error_4, Error_5,
    Error_6, Error_7, Error_8, Error_9,Error_10,Error_11,Error_12: exception;
    
    --instancia del paquete a probar
    Num_Elem : constant := 100;
    package Cola_Rest_Enteros is new Colas_Restringidas(Integer,Num_Elem);
    use Cola_Rest_Enteros;

    --instancia para las operaciones de entrada/salida
    package Salida_Integer is new Integer_Io(Integer);
    use Salida_Integer;
    
    --P y P1 son las colas que se prueban
    --E sirve a la vez como elemento a insertar y como control de tamaño
    P,P1: Cola_Rest_Enteros.Cola;
    E,E1: Integer:= 1;
    
begin
    --fase 1: prueba de inserción
    Put_Line("Prueba de Colas restringidas");
    Put_Line("Se insertan elementos hasta llenar la Cola");
    --la Cola tiene que estar vacía en este momento
	if not(Es_Vacía(P)) or Tamaño(P) /= 0 then
       raise Error_1;
    end if;
    
    loop
        begin       
			if not Es_Vacía(P) then 
                E1 := Examinar(P);
            else
                E1 := 0;
            end if;
             
            Insertar(P,E);
            
            --se comprueban las postcondiciones de Insertar
            if Tamaño(P) /= E then
                raise Error_2;
            end if;
            if E1 = 0 then
                if E /= Examinar(P) then
                    raise Error_3;
                end if;
            else
                if E1 /= Examinar(P) then
                    raise Error_4;
                end if;
            end if;
            E := E + 1;
            Put('.');              
        exception
            when E_Cola_Llena =>
                New_Line;
                Put("La Cola esta llena con ");
                Put(Tamaño(P),3);
                Put_Line(" elementos");
                --la prueba falla si la Cola está llena antes de tiempo
                if E <= Num_Elem or Tamaño(P) /= Num_Elem then
                    raise Error_5;
                else
                    exit;
                end if;      
        end;
    end loop;

    --prueba de consistencia: la Cola no puede estar vacía en este momento
	if Es_Vacía(P) or Tamaño(P) = 0 then
       raise Error_6;
    end if;
 
    --prueba de independencia
    Insertar(P1,10);
    if (Tamaño(P1) /= 1) or (10 /= Examinar(P1)) then
        raise Error_12;
    end if;
    
    --fase 2: prueba de extracción
    Put_Line("Se extraen elementos hasta vaciar la Cola");
    loop
		begin
   			E := E - 1;         
            E1 := Examinar(P);
            --se comprueba el frente de la cola
            if E1 /= 20 - E + 1 then
                raise Error_7;
            end if;
             
            Extraer(P); 
            --se comprueba el tamaño trás la extracción
            if Tamaño(P) /= (E - 1) then
                raise Error_8;
            end if;
            
            Put('.');
        exception
            when E_Cola_Vacía =>
                New_Line;
                Put("La Cola esta vac"&Character'Val(161)&"a con ");
                Put(Tamaño(P),3);
                Put_Line(" elementos");
                --la prueba falla si la Cola está vacía antes de tiempo
                if E > 0 or Tamaño(P)> 0 then
                    raise Error_9;
                else
                    exit;
                end if;      
        end;
    end loop;
    --la Cola tiene que estar vacía en este momento
	if not(Es_Vacía(P)) or Tamaño(P) /= 0 then
       raise Error_10;
    end if;
	--se prueba que no ocurren falsos overflow
    Put_Line("Combinando inserciones y extracciones");
    E := 0;
    Insertar(P,E);
    for I in 1..200 loop
        Insertar(P,I);
        Extraer(P);
        if Tamaño(P) /= 1 or Examinar(P) /= I then
            raise Error_11;
        end if;
        Put('.');
    end loop;
    New_Line;
     
    Put_Line("Prueba terminada con "&Character'Val(130)&"xito");
end Prueba_Colas;

