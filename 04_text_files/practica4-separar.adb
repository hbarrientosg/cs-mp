separate(practica4)--funcion para saber que esta separado
--del fichero de prueba
procedure Separar(R_Total: in  Unbounded_String;
					  R_Letra: out Unbounded_String;
					  R_numer: out Unbounded_String) is
Todo:constant string:=" ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
--Es la ristra que se va a comparar para las subristras
s,N:Natural;
carac:Unbounded_string;
begin
	s:=length(r_total);--Aqui va la longitud de la ristra r_total	
	for i in 1..s loop
		carac:=to_unbounded_string(slice(r_total,i,i));
		N:=index(to_unbounded_string(todo),to_string(carac));
		if N > 1 and N < 53 then-- si esta en el rango entonces es un caracter de letra
			r_Letra:=r_Letra & carac;
		else
			if N > 52 then-- si no es el caracter letra es un caracter numero que se encuentra a
			-- partir de la posicion 53 y lo concateno en la ristra de numeros
				r_numer:=r_numer & carac;
			else-- si no es ninguno de los dos casos entonces el index vale 1 y es el caracter espacio
				--en blanco y lo concateno en las dos ristras
				if n=1 then
					r_numer:=r_numer & carac;
					r_Letra:=r_Letra & carac;
				end if;
			end if;--en caso de que el caracter no sea los que estan en la ristra se deshechara
		end if;
	end loop; 
	return;
end separar;
	

