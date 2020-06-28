generic
	type elemento is private;
    num_elementos:positive:=50;
Package Colas_restringidas is
	type Cola is limited private;
	Procedure Insertar(C: in out Cola;E: in elemento);
	--{Añade un elemento al final de la cola ya existente}
	--{Pre:Ninguna}
	--{Post:(EsVacía(C')=falso) and (Tamaño(C')= Tamaño(C) + 1) and (Examinar(P') = E)}
	procedure Extraer(C:in out Cola);
	--{Extrae un elemento al principio de la cola}
	--{Pre:si Es_vacia(P) => salta E_Cola_Vacía}
	--{Post:si C = Q'(insertar(Q,E)) and tamaño(Q')=1 => C' = Q}
	Function Es_vacía(C:cola) return Boolean;
	--{indica si la cola esta vacia}
	--{Pre:Ninguna}
	--{Post:Tamaño(C)=0 => EsVacía(C) = verdadero}
	--{Si C=Q'(Insertar(Q,E)) => EsVacía(C) = falso}
	Function Examinar(C:cola) return elemento;
	--{Devuelve el primer elemento de la cola}
	--{Pre:no(EsVacía(P))}
	--{Post:si (C = Q'(Insertar(Q,E)) and (Tamaño(Q')=1 => Examinar(C) = E}}
	function Tamaño(C:cola) return natural;
	--{Devuelve el numero de elementos que hay en la cola}
	--{Pre:ninguna }
	--{Post:si P = Q'(Apilar(Q,E)) => Tamaño(P) = Tamaño(Q) + 1}
    E_Cola_Llena, E_Cola_Vacía:exception;
Private
	type Tcola is array(positive range <>)of elemento;
	type cola is record
		Tail:Tcola(1..num_elementos);
		numero:natural:=0;
	end record;	
end Colas_restringidas;
