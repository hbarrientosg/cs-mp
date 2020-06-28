#include <stdio.h>
#include "cola.h"

   int main(){
      TCola tail,tailcopi;
      int i;
      printf("Se van ha insertar 100 elementos\n");
      inicializa(&tail);
      if(tamano(&tail)!=0 || examina(&tail)!=0)
         printf("la cola no ha sido iniciada\n");
      for(i=1;i<101;i++){
         inserta(&tail,i);
      /*se comprueban las poscondiciones*/
         if(tamano(&tail)!=i)
            printf("No se ha insertado elemento\n");
            
      }
      printf("La cola tiene ");
      printf("%d",tamano(&tail));
      printf("elementos\n");
      printf("inserto un elemento aparte\n");
      inserta(&tail,10);
      if ((tamano(&tail)!= 101)&&(10 != examina(&tail)))
         printf("No se ha insertado un elemento\n");
   /*Ahora utilizamos las operaciones del iterador*/
      if(!fin(&tail))
         printf("No esta al final de la cola\n");
      if(!avanza(&tail))
         printf("Esta al final de la cola\n");
      if(!inicio(&tail))
         printf("No esta al principio de la cola\n");
      if(!retrocede(&tail))
         printf("Esta al principio de la cola\n");
   /*ahora copio la cola  en otra*/
      copia(&tailcopi,&tail);
      if(tamano(&tailcopi)==tamano(&tail))
         printf("Tiene el mismo tamaño\n");
      if(examina(&tail)!=examina(&tailcopi))
         printf("los iteradores apuntan al mismo\n");
      inicio(&tail);
      inicio(&tailcopi);
      do{
         if(examina(&tail)!=examina(&tailcopi))
            break;
         avanza(&tailcopi);
      }
      while(avanza(&tail));
      printf("las copias son identicas\n");
   /*ahora extraigo los elementos*/
      printf("se van ha extraer elementos\n");
      /*Extraigo el elemento que inserte aparte*/
      printf("Se ha extraido el ultimo elemento\n");
      for(i=101;i>0;i--){
         extrae(&tail);
         if(tamano(&tail)!=(i-1))
            printf("no se extrajo elemneto\n");
      }
      if(tamano(&tail)==0 || examina(&tail)==0){
         printf("En la cola quedan ");
         printf("%d",tamano(&tail));
         printf("elementos\n");
      }
      destruye(&tailcopi);
      return 0;
     }
