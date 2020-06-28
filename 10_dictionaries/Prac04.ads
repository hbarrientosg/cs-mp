package Conjunto_De_Palabras.Adicional is
		Procedure Extraer(t:in out TDiccionario;Palabra:in unbounded_string);
		--{Realiza la extraccion de una palabra del diccionario}
		--{Pre:El TDiccionario no este vacío}
		--{Post:Devuelve el arbol sin la palabra}
		function "="(t,A:TDiccionario) return Boolean;
		--{Dice si dos Diccionarios Son iguales}
		--{Pre:ninguna}
		--{Post:Devuelve verdadero si son iguales}
end Conjunto_De_Palabras.Adicional;
