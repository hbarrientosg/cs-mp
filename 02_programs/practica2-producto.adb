separate(Practica2)
procedure Producto(X:in integer;Y:out Integer) is
begin--El factorial en los bucles lo calcula bien pero si entran numeros mayores que el 12 
	 --puede haber un fallo de overflow
	y:=1;
	if X > 0 then
		for i in 1..x loop
			y:=y*I;--Aqui realizo elproducto de los positivos
		end loop;
	else
		if x < 0 then	
			for i in reverse x..-1 loop
				y:=Y*I;--Aqui realizo el producto del los negativos
			end loop;
		else
		    y:=0;-- si no entra en niguno de estos casos entoces es que es cero
	  	end if;
	end if;
end;
