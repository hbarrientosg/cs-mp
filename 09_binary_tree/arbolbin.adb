with Unchecked_Deallocation;

package body Arbol_Bin is
    
    procedure Libera is new Unchecked_Deallocation(Nodo,Arbol);

    procedure Elimina(T: in out Arbol) is
        T1:Arbol;
    begin
        if not(Es_Vacío(T)) then      --Se realiza un recorrido en
            T1 := Izquierdo(T);       --postorden para liberar todos
            Elimina(T1);              --los nodos del árbol.
            T1 := Derecho(T);
            Elimina(T1);
            Libera(T);
            T := Vacío;
        end if;
    end Elimina;

    function Vacío return Arbol is
    begin
        return null;        --Se crea un árbol vacío.
    end Vacío;

    procedure Vaciar(T: in out Arbol) is
    begin
        Elimina(T);         --Se vacía un árbol existente.
    end Vaciar;
             
    function Crear(E:Telemento;T1,T2:Arbol) return Arbol is
    begin  
        return new Nodo'(E,T1,T2);   --Se crea un árbol nuevo juntando E, T1 y T2
    exception
        when Storage_Error => raise Arbol_Lleno;
    end Crear;

    function Crear(T,T1,T2:Arbol) return Arbol is
    begin
        T.Hizq := T1;     --Se cambian los subárboles de T
        T.Hder := T2;
        return T;
    exception
        when Constraint_Error => raise Arbol_Vacío;
    end Crear;
    
    function Es_Vacío(T:Arbol) return Boolean is
    begin
        return T = null;  --Un árbol vacio es lo mismo que un puntero nulo
    end Es_Vacío;

    function Raíz(T:Arbol) return Telemento is
    begin
        return T.Info;
    exception
        when Constraint_Error => raise Arbol_Vacío;
    end;
    
    function Izquierdo(T:Arbol) return Arbol is
    begin
        return T.Hizq;
    exception
        when Constraint_Error => raise Arbol_Vacío;
    end Izquierdo;

    function Derecho(T:Arbol) return Arbol is
    begin
        return T.Hder;
    exception
        when Constraint_Error => raise Arbol_Vacío;
    end Derecho;

    function Copia(T:Arbol) return Arbol is
    begin
        if Es_Vacío(T) then     --La copia de un árbol vacío es un árbol vacío
            return Vacío;       --Para un árbol no vacío, la copia se hace copiando
        else                    --en postorden los subárboles y el valor de la raíz
            return Crear(Raíz(T),Copia(Izquierdo(T)),Copia(Derecho(T)));
        end if;
    end Copia;
                 
end Arbol_Bin;

