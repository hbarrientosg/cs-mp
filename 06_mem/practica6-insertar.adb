separate(Practica6)
procedure Insertar(L: in out Lista; V: in Integer) is
Aux:pnodo;
begin
	Aux := crear(V);
	if L.Numelem = 0 then
		L.inicio := aux;
		l.fin := aux;
		l.Numelem := 1;--inserto el primer elemento cuando la lista esta vacia
	else
		l.fin.siguiente := aux;
		aux.anterior := L.Fin;
		L.Fin := Aux;
		l.Numelem := L.Numelem + 1;
		--Aqui voy isertando al final de la lista
		--el resto de los elementos
	end if;
	return;
end insertar;
