with Ada.Strings.Unbounded,Arbol_Bin;
use Ada.Strings.Unbounded;

package body Conjunto_De_Palabras.Adicional is
-----------------------------------------------------------------------------------------------------------
procedure Coloca(palabra:in out unbounded_string)is
	begin
		append(palabra,to_unbounded_string("*"));--Funcion que coloca el asterisco a la palabra;
	return;
	end Coloca;
-------------------------------------------------------------------------------------------------------------------------------------------
	function ExtraerPalabra(Tree:Arbol;Palabra:Unbounded_string)return Arbol is
		aux,aux1:Arbol;
	begin
		If Es_Vacío(Izquierdo(tree)) then--Funcion para extraer una palabra del arbol
			Aux:=tree;
			vaciar(aux);
			return copia(Derecho(tree));
		else
			if raíz(tree)= To_unbounded_string(slice(palabra,1,1)) then
			return crear(tree,ExtraerPalabra(izquierdo(tree),To_unbounded_string(slice(palabra,2,length(palabra)))),derecho(tree));
		else
			if raíz(tree)< To_unbounded_string(slice(palabra,1,1))then
				return crear(tree,izquierdo(tree),ExtraerPalabra(derecho(tree),To_unbounded_string(slice(palabra,1,length(palabra)))));
			else
				return tree;	
			end if;
		end if;	
	end if;
	end ExtraerPalabra;
-------------------------------------------------------------------------------------------------------------------------------------------
	Procedure Extraer(t:in out TDiccionario;Palabra:in unbounded_string) is
		nuevo:unbounded_string:=Palabra;
		Aux:TDiccionario;
	begin
		if Está(T,Palabra)then
			Coloca(Nuevo);
			T.tree:=ExtraerPalabra(T.tree,nuevo);
			T.NPal:=T.NPal-1;
			T.NCarac:=T.NCarac-length(Palabra);
		end if;
	return;
	end Extraer;
------------------------------------------------------------------------------------------------------------------------------
    function iguales(Arbol_1,Arbol_2:Arbol) return boolean is
	begin	
	if not Es_Vacío(Arbol_1)and  not Es_Vacío(Arbol_2)then	
		if raíz(Arbol_1)=Raíz(Arbol_2) then
			if  not Es_Vacío(Izquierdo(Arbol_1))and  not Es_Vacío(izquierdo(Arbol_2))then
				return Iguales(izquierdo(Arbol_1),Izquierdo(Arbol_2));
			else
				if not Es_Vacío(Derecho(Arbol_1))and  not Es_Vacío(Derecho(Arbol_2))then
					return Iguales(Derecho(Arbol_1),Derecho(Arbol_2));
				else
					return true; 
				end if;
			end if;
		else
			return False;--funcion para saber si dos arboles son iguales nodo a nodo;
		end if;
	else
		return true;		
	end if;
	end Iguales;
------------------------------------------------------------------------------------------------------------------------------------------------
	function "="(t,A:TDiccionario) return Boolean is
	begin
	return iguales(T.tree,A.tree)and T.NCarac=A.NCarac and T.NPal=A.NPal;
	end "=";
----------------------------------------------------------------------------------------------
end Conjunto_De_Palabras.Adicional;
