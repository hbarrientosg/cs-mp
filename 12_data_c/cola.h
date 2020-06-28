#ifndef LACOLITA
#define LACOLITA
/* Esta es la estructura del nodo para la cola doblemente encadenada*/
   struct NodoCola {
      int info;
      struct NodoCola *sig,*ant;
   };
/*Renombra la estructura nodocola como un Tnodocola*/
   typedef struct NodoCola TNodoCola, *PNodoCola;
/*Defino la esructura cola con un puntero a tnodocola y numero como el numero de
elementos en la cola(P es el iterador)*/
   struct Cola {
      PNodoCola Iterador,C;
      int Numero;
   };
/*Renombra la estructura cola como un Tcola*/ 
   typedef struct Cola TCola, *PCola;

   void inicializa(PCola cola);
/*Este es el procedimiento para inicializar la cola*/
   int inserta(PCola cola,int t);
/*Se inserta al final de la cola un entero t*/
/*Devuelve un 1 si se ha realizado la insercion sino 
un cero*/
   int extrae(PCola cola);
/*Extrae de la cola un elemento al principio*/
/*Devuelve un 1 si se ha realizado la extracion sino 
un cero*/
   int tamano(PCola cola);
/*devuelve el numero de datos de la cola*/
   void copia(PCola destino, PCola origen);
/*Realiza la copia de una cola completa*/
   void destruye(PCola cola);
/*Destruye todos los nodos de la cola*/
   int examina(PCola cola);
/*Devuelve el entero que señala el iterador
si no lo devuelve retorna 0*/
   int inicio(PCola cola);
/*Pone el interador al principio de la cola*/
   int fin(PCola cola);
/*Pone el iterador al final de la cola*/
   int avanza(PCola cola);
/*Se avanza el iterador al siguiente elemento de la cola.
La función devuelve 1 si se ha realizado la operación
 y 0 en caso contrario*/
   int retrocede(PCola cola);
/*Se retrocede el iterador  al anterior elemento de la cola.
La función devuelve 1 si se ha realizado la operación
y 0 en caso contrario*/
#endif
