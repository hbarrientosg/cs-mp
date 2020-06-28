#include<stdlib.h>
#include<string.h>
#include<stdio.h>
#include "foro.h"
/*----------------------------------------------------------------------------*/
/*la estructura del foro*/
struct Tmensaje{
    char Autor[20];
    char Titulo[40];
    char Cont[1000];
    int anular;/*Tiene valor 1 si es activado y si esta desactivado sera -1*/
    int referencia;/*Si hace referencia a otro mensaje*/
};
typedef struct Tmensaje Mensaje;

/*----------------------------------------------------------------------------*/
int creaForo(const char *nf){
FILE *nuevo;
if ((nuevo=fopen(nf,"wb"))!=NULL){
	fclose(nuevo);
	return 1;/*crea un foro nuevo*/
}else{
	return 0;
}
}
/*----------------------------------------------------------------------------*/
int ponMensaje(const char *nf, const char *autor, 
			   const char *titulo, const char *contenido, int ref){
FILE *fichero;
Mensaje *Nuevo;/*nuevo es una variable para almasenar el mensaje*/
int i;
long longitud;
Nuevo=(Mensaje*)malloc(sizeof(Mensaje));
if(strlen(autor)>20 && strlen(titulo)>40 && strlen(contenido)>1000)
return -1;/*retorna menos uno porque la ristra de el nombre del autor es mas grande
 de lo que puede almacenar la variable autor o titulo o contenido*/
strcpy(Nuevo->Autor,autor);
strcpy(Nuevo->Titulo,titulo);
strcpy(Nuevo->Cont,contenido);
Nuevo->referencia=ref;
Nuevo->anular=1; 
if((fichero=fopen(nf,"ab"))==NULL)return -1;
if(!fwrite(Nuevo,sizeof(Mensaje),1,fichero)){
free(Nuevo);
fclose(fichero);
return -1;
}
fseek(fichero,0L,SEEK_END);
longitud=ftell(fichero);
i=(longitud/sizeof(Mensaje))-1;
/*en la variable i guardo el identificador,
el tamaño del fichero nunca sera menor que el numero de mensajes*/
free(Nuevo);
fclose(fichero);
return i;
}
/*------------------------------------------------------------------------------*/
int leeMensaje(const char *nf, int ident, char *autor,
                                char *titulo, char *contenido, int *ref){
FILE *fichero;
Mensaje *Nuevo;
Nuevo=(Mensaje*)malloc(sizeof(Mensaje));
if((fichero=fopen(nf,"rb"))==NULL)return 0;/*Abro el fichero en modo lectura*/
if(fseek(fichero,ident*sizeof(Mensaje),SEEK_SET)!=0){
fclose(fichero);
free(Nuevo);/*posiciono el puntero donde quiero leer*/
return 0;}
if(!fread(Nuevo,sizeof(Mensaje),1,fichero)){/*leo el mensaje*/
free(Nuevo);
fclose(fichero);
return 0;
}
if(Nuevo->anular==-1){
free(Nuevo);
fclose(fichero);
return 0;
}
strcpy(autor,Nuevo->Autor);/*Copio en la variables de salida las ristras que he leido*/
strcpy(titulo,Nuevo->Titulo);
strcpy(contenido,Nuevo->Cont);
*ref=Nuevo->referencia;
free(Nuevo);
fclose(fichero);
return 1;
}
/*----------------------------------------------------------------------------*/
int anulaMensaje(const char *nf, int ident){
FILE *fichero;
Mensaje *Nuevo;
Nuevo=(Mensaje*)malloc(sizeof(Mensaje));
if((fichero=fopen(nf,"r+b"))==NULL)return 0;/*abro el fichero*/
if(fseek(fichero,ident*(sizeof(Mensaje)),SEEK_SET)!=0){/*pongo el puntero en el mensaje que voy anular*/
free(Nuevo);
fclose(fichero);
return 0;}
if(!fread(Nuevo,sizeof(Mensaje),1,fichero)){
free(Nuevo);
fclose(fichero);
return 0;
}
if(Nuevo->anular==-1){free(Nuevo);fclose(fichero);return 0;}
Nuevo->anular=-1;
if(fseek(fichero,ident*sizeof(Mensaje),SEEK_SET)!=0){/*coloco el putero en donde voy a modificar*/
free(Nuevo);
fclose(fichero);
return 0;}
if(!fwrite(Nuevo,sizeof(Mensaje),1,fichero)){/*sobreescrib en el mensaje con los cambios*/
free(Nuevo);
fclose(fichero);
return 0;
}else{
free(Nuevo);
fclose(fichero);
return 1;
}
}
/*----------------------------------------------------------------------------*/
int numeroMensajes(const char *nf){
FILE *fichero;
Mensaje *Nuevo;
int i=0;
Nuevo=(Mensaje*)malloc(sizeof(Mensaje));
if((fichero=fopen(nf,"rb"))==NULL)return -1;/*Abro el fichero*/

while(fread(Nuevo,sizeof(Mensaje),1,fichero)){
if(Nuevo->anular!=-1)++i;/*cuenta el numero de mensajes no anulados*/
}
free(Nuevo);
fclose(fichero);
return i;
}
/*----------------------------------------------------------------------------*/
int identificadoresMensajes(const char *nf,
                                        int identificadores[], int maxid){
FILE *fichero;
Mensaje *Nuevo;
int i=0,zona=0;
Nuevo=(Mensaje*)malloc(sizeof(Mensaje));
if((fichero=fopen(nf,"rb"))==NULL)return -1;/*Abro el fichero en modo lectura*/
while((i<maxid)&& (fread(Nuevo,sizeof(Mensaje),1,fichero))){
if(Nuevo->anular!=-1){/*si el fichero esta anulado no lo cuenta*/
identificadores[i]=zona;/*zona guarda la posicion del puntero*/
++i;
}
++zona;
}
free(Nuevo);
fclose(fichero);
return i;
}
/*----------------------------------------------------------------------------*/
 int buscaMensajes(const char *nf,
                       const char *abuscar,  int identificadores[], int maxid){
 FILE *fichero;
 Mensaje *Nuevo;
 int i=0,zona=0;
 Nuevo=(Mensaje*)malloc(sizeof(Mensaje));
 if((fichero=fopen(nf,"rb"))==NULL)return -1;/*Abro en modo lectura*/
 while((i<maxid)&&(fread(Nuevo,sizeof(Mensaje),1,fichero))){/*mientras no se acabe el vector ni el fichero
	 entonces seguira mirando en el fichero*/
 if(Nuevo->anular!=-1){/*si el campo esta anulado pues entonces tampoco busca si esta la ristra*/
 if(strstr(Nuevo->Cont,abuscar)!=NULL){/*busca la ristra si la encuentra pues guarda en el vector de identificadores*/
 identificadores[i]=zona;
 ++i;
 }
 }
 ++zona;
 }
 fclose(fichero);
 free(Nuevo);
 return i;
 }

