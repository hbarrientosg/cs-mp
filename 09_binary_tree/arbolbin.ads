generic
    type Telemento is private;
package Arbol_Bin is
    type Arbol is private;
    --¡la asignación(:=) genera un alias!

    function Vacío return Arbol;
    --La función vacío devuelve un árbol vacío. En combinación con
    --Crear permite construir árboles con subárboles vacíos.
    
    procedure Vaciar(T: in out Arbol);
    --Modifica T para representar un árbol vacío. El valor anterior de T 
    --es destruido de forma controlada.

    function Crear(E:Telemento;T1,T2:Arbol) return Arbol;
    --Crea un nuevo árbol, usando E como raíz y T1 y T2 como subárboles
    --izquierdo y derecho, respectivamente. No realiza copia de T1 y T2,
    --sino que los usa directamente.

    function Crear(T,T1,T2:Arbol) return Arbol;
    --Modifica el árbol T cambiando sus subárboles izquierdo y derecho
    --por T1 y T2, respectivamente. No realiza copia de T1 ni de T2,
    --sino que los usa directamente. Tampoco destruye los anteriores
    --subárboles izquierdo y derecho de T, para permitir su reutilización.
    --T no puede ser un árbol vacío.

    function Es_Vacío(T:Arbol) return Boolean;
    --Devuelve true si T es un árbol vacío y false en otro caso.
    
    function Raíz(T:Arbol) return Telemento;
    --Devuelve la raíz de T.
    --T no puede ser un árbol vacío.
    
    function Izquierdo(T:Arbol) return Arbol;
    --Devuelve el subárbol izquierdo de T.
    --T no puede ser un árbol vacío.
    
    function Derecho(T:Arbol) return Arbol;
    --Devuelve el subárbol derecho de T.
    --T no puede ser un árbol vacío.

    function Copia(T:Arbol) return Arbol;
    --Devuelve una copia de T.
    
    Arbol_Lleno, Arbol_Vacío: exception;
    
private
    --Estructura de datos del tipo Arbol.
    type Nodo;
    type Arbol is access Nodo;
    type Nodo is record
        Info:Telemento;
        Hizq,Hder: Arbol;
    end record;
    
end Arbol_Bin;

