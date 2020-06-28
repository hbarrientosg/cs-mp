Package numeros_racionales is
	type Racional is private;
	function "/" (A,B:integer)return racional;
	--{Crea un numero racional donde A numerador y B denominador}
	--{Pre:Ninguna}
	--{Post:Numerador(Crear(A,B))=A,Denominador(Crear(A,B))=B}
	function "+"(X,Y:Racional)return Racional;
	--{Pre:Ninguna}
	--{Post:Devuelve la esp.(a/b) + (c/d) = (a*d+b*c)/(b*d)} 
	function "-"(X,Y:Racional)return Racional;
	--{Pre:Ninguna}
	--{Post:Devuelve la esp. (a/b) - (c/d) = (a*d-b*c)/(b*d)}
    Function "*"(x,Y:Racional) return Racional;
	--{Pre:Ninguna}
	--{Post:Devuelve la esp.(a/b) * (c/d) = (a*c)/(b*d)}
	Function "/"(X,Y:Racional) return Racional;
	--{Pre:Ninguna}
	--{Post:Devuelve la esp.(a/b) / (c/d) = (a*d)/(b*c) }
	function Numerador(X:racional) return Integer;
	--{Pre:Ninguna}
	--{Post:Devuelve la esp. Numerador(x)= entero}
	function Denominador(X:racional) return Integer;
	--{Pre:Ninguna}
	--{Post:Devuelve la esp. Denominador(x)= entero}
    Function "=" (X,Y:Racional) return Boolean;
	--{Pre:Ninguna}
	--{Post:Determina si dos racionales son iguales}
	Denominador_cero:exception;
	--{excepcion para cuando el denominador es cero}
	Private
		function Max(X,Y:integer)return Integer;
		Type Racional is record
			Num,Dem:integer;
		end record;
	--{Tipo privado que es una estructura para guardar el numero racional}
end Numeros_racionales;
