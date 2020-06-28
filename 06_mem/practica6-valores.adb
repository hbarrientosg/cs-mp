separate(Practica6)

function  Valores (L: in Lista) return Vector is
	aux:pnodo;
	V:Vector(1..l.Numelem);
	Lista_Vacía:exception;
begin
	aux:= l.inicio;
	if L.inicio = null and l.fin = null then
		raise Lista_Vacía;
	else
		
	for i in 1..l.numelem loop
		V(i):=Aux.info;		
		aux := aux.siguiente;
	end looP;
	-- Voy guardando en el vector todos los elementos 
	--desde el primero al ultimo
	end if;
return v;	
end valores;
