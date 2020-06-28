#ifndef FORO
#define FORO

int creaForo(const char *nf);
/*Crea un fichero para almacenar el foro o lo 
vacia si ya existe*/
int ponMensaje(const char *nf, const char *autor, 
const char *titulo, const char *contenido, int ref); 
/*Se añade al final del fichero un nuevo mensaje.
La función devuelve el identificador del mensaje o
 -1 en caso de no poderse realizar la operación.*/
 
int leeMensaje(const char *nf, int ident, char *autor,
     char *titulo, char *contenido, int *ref);
/* Se lee un mensaje del foro rellenando los campos correspondientes
 con los valores leídos. El parámetro ident, de entrada,
  establece el identificador del mensaje a leer.*/
/*Devuelve 1 si tiene éxito ó
 0  en caso no poderse realizar
  la operación o se intente leer un mensaje anulado.*/
 
int anulaMensaje(const char *nf, int ident);
/*Anula el mensaje cuyo identificador viene dado en el parámetro ident.
Devuelve 1 si tiene éxito ó 0  en caso contrario.*/
 
int numeroMensajes(const char *nf);
/*Devuelve el número de mensajes válidos
 en el foro o -1 en caso de error.*/ 
int identificadoresMensajes(const char *nf,
    int identificadores[], int maxid);
/* Rellena el vector identificadores,
 hasta un máximo indicado en el parámetro maxid,
 con los identificadores de los mensajes válidos,
  en el orden en que fueron insertados.
Devuelve el número de datos almacenados
 en el vector identificadores o -1 en
  caso de no poderse completar la operación.*/
 int buscaMensajes(const char *nf,
 const char *abuscar,  int identificadores[], int maxid); 
/*Rellena el vector identificadores,
 hasta un máximo indicado en el parámetro maxid, 
 con los identificadores de los mensajes válidos 
 que en su campo contenido aparezca la ristra del 
 parámetro abuscar. 
 La búsqueda es sensible a mayúsculas y minúsculas. 
Devuelve el número de datos almacenados en el vector
 identificadores o -1 en caso de no
  poderse completar la operación.*/
#endif

