Package body Colas_Restringidas is
Procedure Insertar(C: in out Cola;E: in elemento)is
	N:Positive;
begin
	if c.numero=c.tail'length then
		raise e_cola_llena;
	else
		c.tail(C.numero+1):=E;
		C.Numero:=C.numero+1;
	end if;
	return;
end Insertar;
procedure Extraer(C:in out Cola)is
	N:positive;
	s:integer;
begin
	if C.numero=0 then
		raise E_cola_vacía;
	else
		for N in 1..C.numero loop
		if n < c.numero then
			c.tail(n):=C.tail(n+1);
		end if;
		end loop;
		c.numero:=C.numero-1;
	end if;
	return;
end Extraer;
Function Es_vacía(C:cola) return Boolean is
begin
	return C.numero=0;
end Es_Vacía;
Function Examinar(C:cola) return elemento is
begin
	If Es_Vacía(C) then
		raise E_cola_vacía;
    else
		return C.tail(1);
	end if;
end Examinar;
function Tamaño(C:cola) return natural is
begin
	return c.numero;
end Tamaño;
end Colas_Restringidas;
