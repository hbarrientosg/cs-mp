#include<stdlib.h>
#include "cola.h"

/* la especificacion  estan expuestos en cola.h*/ 
   void inicializa(PCola cola){
      cola->C=NULL;
      cola->Iterador=NULL;/*inicializo la cola*/
      cola->Numero=0;
      return;
   }
/*----------------------------------------------------------------------------*/
   int extrae(PCola cola){
      PNodoCola Aux;
      if (cola->C == NULL) 
         return 0; /*extraigo un elemento de la cola*/
      Aux = cola->C;
      if(cola->Iterador==Aux)
      cola->Iterador = Aux->sig;
      cola->C = cola->C->sig;
      free(Aux);
      cola->Numero-=1;
      return 1;
   }
/*----------------------------------------------------------------------------*/
   int tamano(PCola cola){
      return cola->Numero;/*Numero de elementos de la cola*/
   }
/*----------------------------------------------------------------------------*/
   void destruye(PCola cola){
      while (cola->C != NULL){/*destruye la cola*/
         extrae(cola);
      }
      return;
   }
/*----------------------------------------------------------------------------*/
   void copia(PCola destino, PCola origen){
      PNodoCola Aux;
      while(destino->C!=NULL)
         extrae(destino);
      Aux=origen->C;
      while(Aux!=NULL){/*Copia una cola*/
         if(Aux==origen->Iterador)
            fin(destino);
         inserta(destino,Aux->info);
         Aux=Aux->sig;
      }
      destino->Numero=origen->Numero;
      return;
   }
/*----------------------------------------------------------------------------*/
   int examina(PCola cola){
      if(cola->Iterador!=NULL){
         return (cola->Iterador->info);
      }
      else{
         return 0;
      }
   }
/*----------------------------------------------------------------------------*/
   int inicio(PCola cola){
      if (cola->Iterador != NULL && cola->Iterador->ant != NULL){
         cola->Iterador=cola->C;
         return 1;
      }
      else{/*Pongo el iterador al principio de la cola*/
         return 0;
      }
   }
/*----------------------------------------------------------------------------*/
   int fin(PCola cola){
      if(cola->Iterador != NULL && cola->Iterador->sig != NULL){
         while ((cola->Iterador->sig)!= NULL){
            cola->Iterador=cola->Iterador->sig;
         }
         return 1;
      }
      else{/*Pone el iterador al final de la cola*/
         return 0;
      }
   }
/*----------------------------------------------------------------------------*/
   int avanza(PCola cola){
      if(cola->Iterador != NULL && cola->Iterador->sig != NULL){
         cola->Iterador = cola->Iterador->sig;/*avanzo el iterador*/
         return 1;
      }
      else{
         return 0;
      }
   }
/*----------------------------------------------------------------------------*/
   int retrocede(PCola cola){
      if (cola->Iterador != NULL && cola->Iterador->ant != NULL){
         cola->Iterador=cola->Iterador->ant;/*retrocedo el iterador*/
         return 1;
      }
      else{
         return 0;
      }
   }
/*----------------------------------------------------------------------------*/
   int inserta(PCola cola,int t){
      PNodoCola Aux,Aux1; /*declaro una variable auxiliar para apuntar al primer nodo de la cola*/
      Aux = cola->C;
      Aux1=(TNodoCola*)malloc(sizeof(TNodoCola));
      if (Aux1 == NULL) 
         return 0;
      if (Aux == NULL){
         cola->C = Aux1;
         cola->C->ant = NULL;
         cola->C->sig = NULL;/*Aqui inserto si es el primer nodo de la cola*/
         cola->Iterador = Aux1;
         cola->Numero +=1;
         cola->C->info = t;
      }
      else{
         while (Aux->sig != NULL)
            Aux = Aux->sig;
         Aux->sig = Aux1;
         Aux1->ant = Aux;
         Aux1->info = t;/*Aqui voy insertando al final de la cola*/
         Aux1->sig = NULL;
         cola->Numero+=1;
      }
      return 1;
   }

