with Ada.Strings.Unbounded,Arbol_Bin;
use Ada.Strings.Unbounded;
package Conjunto_de_palabras is
	Type TDiccionario is Private;
		Procedure Insertar(D:in out TDiccionario;Palabra:in unbounded_string);
		--{Añade una palabra  a el arbol binario}
 	    --{Pre:Ninguna}
		--{Post:Modifica el arbol al isertar una palabra colocandla en orden}
		Function Está(D:TDiccionario;Palabra:Unbounded_string) return boolean;
		--{Devuelve verdadero si la palabra esta en el diccionario}
		--{Pre:Ninguna}
		--{Post:Palabras(D)=1}
		function Palabras(D:TDiccionario) return Natural;
		--{Devuelve el numero de palabras que hay}
		--{Pre:ninguna}
		--{Post:Cuenta el numero de palabras}
		Function Caracteres(D:TDiccionario) Return Natural;
		--{Devuelve el numero de caracteres que hay en el diccionario}
		--{Pre:Ninguno}
		--{Post:Cuenta el numero de caracteres}
		E_No_Espacio: exception;
	private
	package ArbolC is new Arbol_bin(unbounded_string);
	use ArbolC;
	Type TDiccionario is record
		Tree:ArbolC.Arbol;
		NPal:Natural:=0;
		NCarac:Natural:=0;
	end record;
end Conjunto_de_Palabras;