-------------------------------------------------------------------
--Prueba_Colas: programa de prueba de los paquetes               --
--Colas_Dinámicas Y Colas_Restringidas                           --
--Autor: Zenón J. Hernández Figueroa                             --
--Última revisión: 21-03-2001                                    --
-------------------------------------------------------------------
with Text_Io,Colas_Dinámicas,Colas_Restringidas;
use Text_Io;

-------------------------------------------------------------------
--La prueba se realiza declarando una Cola de elementos de tipo  --
--integer. La prueba se divide en tres fases:                    --
--(1) Se insertan 100 elementos en la Cola en cada inserción se  --
--    comprueban las postcondiciones de Insertar.                --
--(2) Se extraen elementos de la Cola hasta que se produzca la   --
--    excepción E_Cola_Vacía. Se comprueba que la excepción se   --
--    produce cuando se han 100 elementos. En cada extracción se --
--    comprueba el tamaño y el frente de la cola.                --
--(3) Se combinan insersiones y extracciones para comprobar que  --
--    no se producen falsos overflow.                            --
-------------------------------------------------------------------
procedure Prueba_Colas is
    --excepciones relacionadas conla prueba
    Error_1, Error_2, Error_3, Error_4, Error_5,
    Error_6, Error_7, Error_8, Error_9,Error_10,Error_11,Error_12: exception;
    
    --instancia de los paquetes a probar
    Num_Elem : constant := 100;
    package Cola_Enteros is new Colas_Dinámicas(Integer);
    use Cola_Enteros;
    
    package Cola_Rest_Enteros is new Colas_Restringidas(Integer,Num_Elem);
    use Cola_Rest_Enteros;  

    --instancia para las operaciones de entrada/salida
    package Salida_Integer is new Integer_Io(Integer);
    use Salida_Integer;
    
    --Pd y Pd1 son las colas dinámicas que se prueban
    --Pr y Pr1 son las colas restringidas que se prueban
    --E sirve a la vez como elemento a insertar y como control de tamaño
    Pd,Pd1: Cola_Enteros.Cola;
    Pr,Pr1: Cola_Rest_Enteros.Cola;
    E,E1: Integer:= 1;
    
begin

    --prueba de colas dinámicas
    --fase 1: prueba de inserción
    Put_Line("Prueba de Colas din"&Character'Val(160)&"micas");
    Put_Line("Se insertan 100 elementos en la Cola");
    --la Cola tiene que estar vacía en este momento
	if not(Es_Vacía(Pd)) or Tamaño(Pd) /= 0 then
       raise Error_1;
    end if;
    
    loop
        begin       
			if not Es_Vacía(Pd) then 
                E1 := Examinar(Pd);
            else
                E1 := 0;
            end if;
             
            Insertar(Pd,E);
            
            --se comprueban las postcondiciones de Insertar
            if Tamaño(Pd) /= E then
                raise Error_2;
            end if;
            if E1 = 0 then
                if E /= Examinar(Pd) then
                    raise Error_3;
                end if;
            else
                if E1 /= Examinar(Pd) then
                    raise Error_4;
                end if;
            end if;
            E := E + 1;
            Put('.');              
        	exit when E = 101;
        end;
    end loop;
    New_Line;
    Put("La Cola tiene ");
    Put(Tamaño(Pd),3);
    Put_Line(" elementos");
    --la prueba falla si el número de elementos es incorrecto
    if E <= Num_Elem or Tamaño(Pd) /= Num_Elem then
       raise Error_5;
    end if;      

    --prueba de consistencia: la Cola no puede estar vacía en este momento
	if Es_Vacía(Pd) or Tamaño(Pd) = 0 then
       raise Error_6;
    end if;
 
    --prueba de independencia
    Insertar(Pd1,10);
    if (Tamaño(Pd1) /= 1) or (10 /= Examinar(Pd1)) then
        raise Error_12;
    end if;
    
    --fase 2: prueba de extracción
    Put_Line("Se extraen elementos hasta vaciar la Cola");
    loop
		begin
   			E := E - 1;         
            E1 := Examinar(Pd);
            --se comprueba el frente de la cola
            if E1 /= 100 - E + 1 then
                raise Error_7;
            end if;
             
            Extraer(Pd); 
            --se comprueba el tamaño trás la extracción
            if Tamaño(Pd) /= (E - 1) then
                raise Error_8;
            end if;
            
            Put('.');
        exception
            when Cola_Enteros.E_Cola_Vacía =>
                New_Line;
                Put("La Cola esta vac"&Character'Val(161)&"a con ");
                Put(Tamaño(Pd),3);
                Put_Line(" elementos");
                --la prueba falla si la Cola está vacía antes de tiempo
                if E > 0 or Tamaño(Pd)> 0 then
                    raise Error_9;
                else
                    exit;
                end if;      
        end;
    end loop;
    --la Cola tiene que estar vacía en este momento
	if not(Es_Vacía(Pd)) or Tamaño(Pd) /= 0 then
       raise Error_10;
    end if;
	--se prueba que no ocurren falsos overflow
    Put_Line("Combinando inserciones y extracciones");
    E := 0;
    Insertar(Pd,E);
    for I in 1..200 loop
        Insertar(Pd,I);
        Extraer(Pd);
        if Tamaño(Pd) /= 1 or Examinar(Pd) /= I then
            raise Error_11;
        end if;
        Put('.');
    end loop;
    New_Line(2);
    
    --prueba de colas restringidas
    E := 1;
    E1 := 1;
    --fase 1: prueba de inserción
    Put_Line("Prueba de Colas restringidas");
    Put_Line("Se insertan elementos hasta llenar la Cola");
    --la Cola tiene que estar vacía en este momento
	if not(Es_Vacía(Pr)) or Tamaño(Pr) /= 0 then
       raise Error_1;
    end if;
    
    loop
        begin       
			if not Es_Vacía(Pr) then 
                E1 := Examinar(Pr);
            else
                E1 := 0;
            end if;
             
            Insertar(Pr,E);
            
            --se comprueban las postcondiciones de Insertar
            if Tamaño(Pr) /= E then
                raise Error_2;
            end if;
            if E1 = 0 then
                if E /= Examinar(Pr) then
                    raise Error_3;
                end if;
            else
                if E1 /= Examinar(Pr) then
                    raise Error_4;
                end if;
            end if;
            E := E + 1;
            Put('.');              
        exception
            when Cola_Rest_Enteros.E_Cola_Llena =>
                New_Line;
                Put("La Cola esta llena con ");
                Put(Tamaño(Pr),3);
                Put_Line(" elementos");
                --la prueba falla si la Cola está llena antes de tiempo
                if E <= Num_Elem or Tamaño(Pr) /= Num_Elem then
                    raise Error_5;
                else
                    exit;
                end if;      
        end;
    end loop;

    --prueba de consistencia: la Cola no puede estar vacía en este momento
	if Es_Vacía(Pr) or Tamaño(Pr) = 0 then
       raise Error_6;
    end if;
 
    --prueba de independencia
    Insertar(Pr1,10);
    if (Tamaño(Pr1) /= 1) or (10 /= Examinar(Pr1)) then
        raise Error_12;
    end if;
    
    --fase 2: prueba de extracción
    Put_Line("Se extraen elementos hasta vaciar la Cola");
    loop
		begin
   			E := E - 1;         
            E1 := Examinar(Pr);
            --se comprueba el frente de la cola
            if E1 /= 100 - E + 1 then
                raise Error_7;
            end if;
             
            Extraer(Pr); 
            --se comprueba el tamaño trás la extracción
            if Tamaño(Pr) /= (E - 1) then
                raise Error_8;
            end if;
            
            Put('.');
        exception
            when Cola_Rest_Enteros.E_Cola_Vacía =>
                New_Line;
                Put("La Cola esta vac"&Character'Val(161)&"a con ");
                Put(Tamaño(Pr),3);
                Put_Line(" elementos");
                --la prueba falla si la Cola está vacía antes de tiempo
                if E > 0 or Tamaño(Pr)> 0 then
                    raise Error_9;
                else
                    exit;
                end if;      
        end;
    end loop;
    --la Cola tiene que estar vacía en este momento
	if not(Es_Vacía(Pr)) or Tamaño(Pr) /= 0 then
       raise Error_10;
    end if;
	--se prueba que no ocurren falsos overflow
    Put_Line("Combinando inserciones y extracciones");
    E := 0;
    Insertar(Pr,E);
    for I in 1..200 loop
        Insertar(Pr,I);
        Extraer(Pr);
        if Tamaño(Pr) /= 1 or Examinar(Pr) /= I then
            raise Error_11;
        end if;
        Put('.');
    end loop;

    New_Line;
    Put_Line("Prueba terminada con "&Character'Val(130)&"xito");
        
end Prueba_Colas;

