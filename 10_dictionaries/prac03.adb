with Ada.Strings.Unbounded,Arbol_Bin;
use Ada.Strings.Unbounded;
Package body Conjunto_de_palabras is
------------------------------------------------------------------------------------------------------------------------
	procedure Coloca(palabra:in out unbounded_string)is
	begin
		append(palabra,to_unbounded_string("*"));
	return;
	end Coloca;
------------------------------------------------------------------------------------------------------------------------
	Function EstaEnArbol(Tree:Arbol;Palabra:unbounded_string)return Boolean is
	begin
	if not Es_vacío(Tree) then
		if length(palabra)/= 1 then			
			if Raíz(tree)=to_unbounded_string(slice(palabra,1,1))then
				return EstaEnArbol(izquierdo(Tree),to_unbounded_string(slice(palabra,2,length(palabra))));
			else
				if raíz(tree)< to_unbounded_string(slice(palabra,1,1))then
					return EstaEnArbol(Derecho(tree),to_unbounded_string(slice(palabra,1,length(palabra))));
				else
					return EstaEnArbol(izquierdo(tree),to_unbounded_string(slice(palabra,1,length(palabra))));
				end if;
			end if;
		else
			return raíz(tree)= to_unbounded_string("*");
		end if;
	else
		return false;		
	end if;
	end EstaEnArbol;
------------------------------------------------------------------------------------------------------------------
	Function Está(D:TDiccionario;Palabra:unbounded_String) return Boolean is
		nuevo:unbounded_string:=palabra;
	begin	
		coloca(nuevo);	
		return EstaEnArbol(D.tree,nuevo);
	end Está;
--------------------------------------------------------------------------------------------------------
	function Palabras(D:TDiccionario) return Natural is
	begin
		return d.NPal;
	end Palabras;
--------------------------------------------------------------------------------------------------------------------------------------------------------------
	Function Caracteres(D:TDiccionario) return Natural is
	begin
		return d.NCarac;
	end Caracteres;
--------------------------------------------------------------------------------------------------------------------------------------------------------------
	function insertaEnArbol(Tree:Arbol;Palabra:unbounded_string)return Arbol is
	begin
	if Es_Vacío(tree) then
		if length(palabra)/=0 then
			return crear(to_unbounded_string(slice(Palabra,1,1)),InsertaEnArbol(tree,To_unbounded_string(slice(palabra,2,length(palabra)))),Vacío);
		else
			return tree;
		end if;
	else
		if raíz(tree)= To_unbounded_string(slice(palabra,1,1)) then
			return crear(tree,insertaEnArbol(izquierdo(tree),To_unbounded_string(slice(palabra,2,length(palabra)))),derecho(tree));
		else
			if raíz(tree)< To_unbounded_string(slice(palabra,1,1))then
				return crear(tree,izquierdo(tree),InsertaEnArbol(derecho(tree),To_unbounded_string(slice(palabra,1,length(palabra)))));
			else
				return crear(to_unbounded_string(slice(palabra,1,1)),InsertaEnArbol(Vacío,To_unbounded_string(slice(palabra,2,length(palabra)))),copia(tree));	
			end if;
		end if;
	end if;
	end insertaEnArbol;
-----------------------------------------------------------------------------------------------
	Procedure insertar(D:in out TDiccionario;Palabra:in Unbounded_string)is
	nuevo:unbounded_string:=Palabra;
	begin
	if not está(d,Palabra) then
	coloca(Nuevo);
	 D.tree:=insertaEnArbol(D.tree,nuevo);
	 d.NPal:=D.NPal+1;
	 d.NCarac:=d.NCarac+length(palabra);
 	end if;
	exception
        when Arbol_Lleno|storage_error => raise E_No_Espacio;
	return;
	end insertar;

end Conjunto_de_Palabras;
