generic
	type elemento is private;
    num_elementos:positive:=50;
Package Colas_restringidas is
	type Cola is limited private;
	Procedure Insertar(C: in out Cola;E: in elemento);
	--{A�ade un elemento al final de la cola ya existente}
	--{Pre:Ninguna}
	--{Post:(EsVac�a(C')=falso) and (Tama�o(C')= Tama�o(C) + 1) and (Examinar(P') = E)}
	procedure Extraer(C:in out Cola);
	--{Extrae un elemento al principio de la cola}
	--{Pre:si Es_vacia(P) => salta E_Cola_Vac�a}
	--{Post:si C = Q'(insertar(Q,E)) and tama�o(Q')=1 => C' = Q}
	Function Es_vac�a(C:cola) return Boolean;
	--{indica si la cola esta vacia}
	--{Pre:Ninguna}
	--{Post:Tama�o(C)=0 => EsVac�a(C) = verdadero}
	--{Si C=Q'(Insertar(Q,E)) => EsVac�a(C) = falso}
	Function Examinar(C:cola) return elemento;
	--{Devuelve el primer elemento de la cola}
	--{Pre:no(EsVac�a(P))}
	--{Post:si (C = Q'(Insertar(Q,E)) and (Tama�o(Q')=1 => Examinar(C) = E}}
	function Tama�o(C:cola) return natural;
	--{Devuelve el numero de elementos que hay en la cola}
	--{Pre:ninguna }
	--{Post:si P = Q'(Apilar(Q,E)) => Tama�o(P) = Tama�o(Q) + 1}
    E_Cola_Llena, E_Cola_Vac�a:exception;
Private
	type Tcola is array(positive range <>)of elemento;
	type cola is record
		Tail:Tcola(1..num_elementos);
		numero:natural:=0;
	end record;	
end Colas_restringidas;
