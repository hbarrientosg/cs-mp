separate(Practica6)
procedure Extraer (L: in out Lista; V: in Integer) is
aux:Pnodo;
begin
	aux := l.Inicio;
	while  Aux.info /= V loop
		Aux := aux.siguiente;
		if aux = null then
			return;-- si llega al final de la lista y no lo ha encontrado sale de procedimiento
		end if;
	end loop;
	-- si salgo es que encontrado elemento
	if aux /= null then
		if L.numelem = 1 then
		-- si es el unico elemento vacio los punteros
			L.inicio := null;
			L.fin := Null;
		else
			if l.inicio = Aux then
				--si es el primero el puntero inicio pasa al siguiente
				l.inicio := aux.siguiente;
				Aux.Anterior := null;
			else
				if l.fin = Aux then
					-- si es el ultimo el puntero fin pasa al penultimo
					l.fin := aux.Anterior;
					Aux.siguiente := null;
				else
					--si esta en medio de la lista pues el anterio tendra que
					--apuntar al siguiente que estoy apuntando
					--y el otro tiene que apuntar al anterior 
					Aux.anterior.siguiente := Aux.siguiente;
					Aux.siguiente.Anterior := aux.anterior;
				end if;
			end if;
		end if;
		l.NumElem := L.NumElem - 1;
		-- decremento
		liberar(Aux);
		-- libero el elemento encontrado
	end if;		
return;
end Extraer;
