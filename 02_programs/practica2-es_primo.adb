separate(Practica2)
function Es_primo(N:in natural) return Boolean is
begin
    if n=0 then
	return true;
    else	
 	if n=1 then 
 		return true;-- ya sabemos que el uno es primo asi que yo miro los  que son distintos de 1 en siguiente bucle
	else
		for i in 2..n loop
			if (n mod i)=0 and I=N then	-- aqui explico si el resto de la divicion de N/I es igual a cero y I es igual a N
 		    	return true;			--devolvera verdadero
			else
				if (n mod i)=0 and i/=n then
				    return false;
				end if;				
			end if;
		end loop;
		return false;
	end if;
    end if;
end;
