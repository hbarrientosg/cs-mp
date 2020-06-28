with Unchecked_Deallocation;

package body Arbol_Bin is
    
    procedure Libera is new Unchecked_Deallocation(Nodo,Arbol);

    procedure Elimina(T: in out Arbol) is
        T1:Arbol;
    begin
        if not(Es_Vac�o(T)) then      --Se realiza un recorrido en
            T1 := Izquierdo(T);       --postorden para liberar todos
            Elimina(T1);              --los nodos del �rbol.
            T1 := Derecho(T);
            Elimina(T1);
            Libera(T);
            T := Vac�o;
        end if;
    end Elimina;

    function Vac�o return Arbol is
    begin
        return null;        --Se crea un �rbol vac�o.
    end Vac�o;

    procedure Vaciar(T: in out Arbol) is
    begin
        Elimina(T);         --Se vac�a un �rbol existente.
    end Vaciar;
             
    function Crear(E:Telemento;T1,T2:Arbol) return Arbol is
    begin  
        return new Nodo'(E,T1,T2);   --Se crea un �rbol nuevo juntando E, T1 y T2
    exception
        when Storage_Error => raise Arbol_Lleno;
    end Crear;

    function Crear(T,T1,T2:Arbol) return Arbol is
    begin
        T.Hizq := T1;     --Se cambian los sub�rboles de T
        T.Hder := T2;
        return T;
    exception
        when Constraint_Error => raise Arbol_Vac�o;
    end Crear;
    
    function Es_Vac�o(T:Arbol) return Boolean is
    begin
        return T = null;  --Un �rbol vacio es lo mismo que un puntero nulo
    end Es_Vac�o;

    function Ra�z(T:Arbol) return Telemento is
    begin
        return T.Info;
    exception
        when Constraint_Error => raise Arbol_Vac�o;
    end;
    
    function Izquierdo(T:Arbol) return Arbol is
    begin
        return T.Hizq;
    exception
        when Constraint_Error => raise Arbol_Vac�o;
    end Izquierdo;

    function Derecho(T:Arbol) return Arbol is
    begin
        return T.Hder;
    exception
        when Constraint_Error => raise Arbol_Vac�o;
    end Derecho;

    function Copia(T:Arbol) return Arbol is
    begin
        if Es_Vac�o(T) then     --La copia de un �rbol vac�o es un �rbol vac�o
            return Vac�o;       --Para un �rbol no vac�o, la copia se hace copiando
        else                    --en postorden los sub�rboles y el valor de la ra�z
            return Crear(Ra�z(T),Copia(Izquierdo(T)),Copia(Derecho(T)));
        end if;
    end Copia;
                 
end Arbol_Bin;

