generic
    type Telemento is private;
package Arbol_Bin is
    type Arbol is private;
    --�la asignaci�n(:=) genera un alias!

    function Vac�o return Arbol;
    --La funci�n vac�o devuelve un �rbol vac�o. En combinaci�n con
    --Crear permite construir �rboles con sub�rboles vac�os.
    
    procedure Vaciar(T: in out Arbol);
    --Modifica T para representar un �rbol vac�o. El valor anterior de T 
    --es destruido de forma controlada.

    function Crear(E:Telemento;T1,T2:Arbol) return Arbol;
    --Crea un nuevo �rbol, usando E como ra�z y T1 y T2 como sub�rboles
    --izquierdo y derecho, respectivamente. No realiza copia de T1 y T2,
    --sino que los usa directamente.

    function Crear(T,T1,T2:Arbol) return Arbol;
    --Modifica el �rbol T cambiando sus sub�rboles izquierdo y derecho
    --por T1 y T2, respectivamente. No realiza copia de T1 ni de T2,
    --sino que los usa directamente. Tampoco destruye los anteriores
    --sub�rboles izquierdo y derecho de T, para permitir su reutilizaci�n.
    --T no puede ser un �rbol vac�o.

    function Es_Vac�o(T:Arbol) return Boolean;
    --Devuelve true si T es un �rbol vac�o y false en otro caso.
    
    function Ra�z(T:Arbol) return Telemento;
    --Devuelve la ra�z de T.
    --T no puede ser un �rbol vac�o.
    
    function Izquierdo(T:Arbol) return Arbol;
    --Devuelve el sub�rbol izquierdo de T.
    --T no puede ser un �rbol vac�o.
    
    function Derecho(T:Arbol) return Arbol;
    --Devuelve el sub�rbol derecho de T.
    --T no puede ser un �rbol vac�o.

    function Copia(T:Arbol) return Arbol;
    --Devuelve una copia de T.
    
    Arbol_Lleno, Arbol_Vac�o: exception;
    
private
    --Estructura de datos del tipo Arbol.
    type Nodo;
    type Arbol is access Nodo;
    type Nodo is record
        Info:Telemento;
        Hizq,Hder: Arbol;
    end record;
    
end Arbol_Bin;

