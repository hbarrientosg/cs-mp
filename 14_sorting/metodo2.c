#include<time.h>
#include "metodo2.h"

   void Metodo2(int vec[], int n, int *ncomp, int *nmov, float *tiempo){
      int secund,primaria,aux;
      double timeini;
      timeini = clock();
   /*Guardo los pulsos iniciales*/
      (*ncomp) = 0;
      (*nmov) = 0;
      for(primaria=0;primaria < n-1;primaria++){
      /*Comparacion entre los elementos del vector en el "if"*/
         (*ncomp)++;
         if (vec[primaria] > vec[primaria+1]){
            aux = vec[primaria];
            vec[primaria] = vec[primaria +1];
            vec[primaria+1] = aux;
         /*Asignacion doble entre elementos del Vector*/
            *nmov += 2;        
            secund = primaria -1;
            while((secund >=0)&&(vec[secund]>vec[secund +1])){
            /*Comparacion de los elementos del vector en el bucle mientras*/
               (*ncomp)++;
               aux = vec[secund];
               vec[secund]= vec[secund +1];
               vec[secund +1] = aux;
            /*Asignacion doble entre los elementos del vector*/
               (*nmov) += 2;
               secund = secund - 1;
            
            }
         /*Comparacion de los elementos del vector en el bucle mientras*/
            (*ncomp)++;
         }
      }
      *tiempo = ((float)clock() - timeini)/CLOCKS_PER_SEC;
   /* se calcula el tiempo con la diferencia de los pulsos iniciales y los finales
   divididos entre CLOCKS_PER_SEC para calcularlos en segundos y un cast porque el clock
   devuelve un double*/
      return;
   }


