with Unchecked_Deallocation;
Package body Colas_Din�micas is
	Procedure Liberador is new unchecked_deallocation(tcola,cola);
-------------------------------------------------------------------------------------------------------------
	Procedure insertar(C:in out cola;E:in elemento) is
	begin
	if C=null then
		C:= new TCola;
		c.Contenido:=E;
	else
		insertar(C.sig,E);
	end if;
	return;
	end insertar;
-------------------------------------------------------------------------------------------------------------
	Procedure Extraer(C:in out Cola) is
	aux:cola;
	begin
	aux:=c;
	C:=C.Sig;
	Liberador(Aux);
	Return;
	end Extraer;
-------------------------------------------------------------------------------------------------------------
	function Es_Vac�a(C:cola) return boolean is
	begin
	return C=null;
	end Es_Vac�a;
-------------------------------------------------------------------------------------------------------------
	function Examinar(C:cola)Return elemento is
	begin
	if Es_vac�a(C) then
		raise E_Cola_Vac�a;
	else
		return c.contenido;
	end if;
	end examinar;
-------------------------------------------------------------------------------------------------------------
	function Tama�o(C:Cola)Return natural is
	cont:integer:=0;
	aux:cola:=C;
	begin
	while aux /= null loop
		cont:= cont+1;
		aux:=aux.sig;
	end loop;
	return cont;
	end tama�o;
-------------------------------------------------------------------------------------------------------------
end Colas_Din�micas;
