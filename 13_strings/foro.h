#ifndef FORO
#define FORO

int creaForo(const char *nf);
/*Crea un fichero para almacenar el foro o lo 
vacia si ya existe*/
int ponMensaje(const char *nf, const char *autor, 
const char *titulo, const char *contenido, int ref); 
/*Se a�ade al final del fichero un nuevo mensaje.
La funci�n devuelve el identificador del mensaje o
 -1 en caso de no poderse realizar la operaci�n.*/
 
int leeMensaje(const char *nf, int ident, char *autor,
     char *titulo, char *contenido, int *ref);
/* Se lee un mensaje del foro rellenando los campos correspondientes
 con los valores le�dos. El par�metro ident, de entrada,
  establece el identificador del mensaje a leer.*/
/*Devuelve 1 si tiene �xito �
 0  en caso no poderse realizar
  la operaci�n o se intente leer un mensaje anulado.*/
 
int anulaMensaje(const char *nf, int ident);
/*Anula el mensaje cuyo identificador viene dado en el par�metro ident.
Devuelve 1 si tiene �xito � 0  en caso contrario.*/
 
int numeroMensajes(const char *nf);
/*Devuelve el n�mero de mensajes v�lidos
 en el foro o -1 en caso de error.*/ 
int identificadoresMensajes(const char *nf,
    int identificadores[], int maxid);
/* Rellena el vector identificadores,
 hasta un m�ximo indicado en el par�metro maxid,
 con los identificadores de los mensajes v�lidos,
  en el orden en que fueron insertados.
Devuelve el n�mero de datos almacenados
 en el vector identificadores o -1 en
  caso de no poderse completar la operaci�n.*/
 int buscaMensajes(const char *nf,
 const char *abuscar,  int identificadores[], int maxid); 
/*Rellena el vector identificadores,
 hasta un m�ximo indicado en el par�metro maxid, 
 con los identificadores de los mensajes v�lidos 
 que en su campo contenido aparezca la ristra del 
 par�metro abuscar. 
 La b�squeda es sensible a may�sculas y min�sculas. 
Devuelve el n�mero de datos almacenados en el vector
 identificadores o -1 en caso de no
  poderse completar la operaci�n.*/
#endif

