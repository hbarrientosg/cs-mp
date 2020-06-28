--------------------------------------------------------------------
--------------------------------------------------------------------
----   Este fichero no debe ser modificado bajo ningún concepto   --
--------------------------------------------------------------------
--------------------------------------------------------------------

with Text_IO, Ada.Integer_Text_IO, Unchecked_Deallocation;
use  Text_Io, Ada.Integer_Text_IO;

procedure Practica6 is
	-- Tipos necesarios para implementar en el heap una lista doblemente
	-- encadenada de valores de tipo Integer
	type Nodo;                  -- Nodo de la lista
	type PNodo is access Nodo;  -- Puntero a los nodos de la lista
	type Nodo is record
		Info     : Integer;
		Anterior,
		Siguiente: PNodo; 
	end record; -- Nodo

	type Lista is record        -- Tipo para representar una lista
		Inicio,                 -- Acceso a la lista (por ambos extremos)
		Fin    : PNodo;
		NumElem: Natural := 0;  -- Nº de elementos
	end record; -- Lista

	-- Otros tipos
	type Vector is array(Positive range <>) of Integer;

	-- Excepciones
	Lista_Vacía: Exception;

	-- Operaciones para manipular listas doblemente encadenadas
	procedure Liberar is new Unchecked_Deallocation(Nodo,PNodo);

	function Crear(Info: in Integer) return PNodo is
	begin  -- Crear
		return new Nodo'(Info,null,null);
	end Crear;


	-- otras operaciones
	procedure Mostrar (V: Vector) is
	begin  -- Mostrar
		for I in V'range loop
			Put(V(I));
		end loop;
	end Mostrar;

	--------------------------------------------------------------------
	--------------------------------------------------------------------
	----    Estas son las operaciones que se deben implementar en     --
	----    sus respectivos ficheros.                                 --
	--------------------------------------------------------------------
	--------------------------------------------------------------------
	procedure Insertar(L: in out Lista; V: in Integer) is separate;
	procedure Extraer (L: in out Lista; V: in Integer) is separate;
	function  Valores (L: in Lista) return Vector      is separate;
	--------------------------------------------------------------------
	--------------------------------------------------------------------
	----    Aquí acaban las operaciones que se deben implementar.     --
	--------------------------------------------------------------------
	--------------------------------------------------------------------

	Mi_Lista : Lista := (null, null,0); -- Lista de prueba (inicialmente vacía)
	Opcion   : Integer range 0 .. 3;    -- Donde el usuario indica que opción
	                                    -- del menú quiere ejecutar
	Valor    : Integer;                 -- Valor a Insertar/Extraer
begin  -- Practica6
	loop
		put_Line("Pulse 0 para salir");
		put_Line("Pulse 1 para insertar");
		put_Line("Pulse 2 para extraer");
		put_Line("Pulse 3 para mostrar");
		Get(Opcion);
		case Opcion is
			when 0 => exit;
			when 1 =>
				Put("Deme el valor a insertar: ");
				get(Valor);
				Insertar(Mi_Lista,Valor);
			when 2 =>
				Put("Deme el valor a extraer: ");
				get(Valor);
				Extraer(Mi_Lista,Valor);
			when 3 =>
				Mostrar(Valores(Mi_Lista));
		end case;  -- Opcion
		new_line;
	end loop;
end Practica6;
