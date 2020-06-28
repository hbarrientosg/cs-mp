#include<time.h>
#include "metodo1.h"

   void Metodo1(int vec[], int n, int *ncomp, int *nmov, float *tiempo)
   {
      int dist,i,j,aux;
      double timeini;
      timeini = clock();
   /*Guardo el tiempo cuando empieza el programa */
      (*ncomp) = 0;
      (*nmov) = 0;
      dist = n/2;
   /*Guarda en"dist" la distancia de la mitad del vector*/
      while (dist > 0){
         for(i=0;i<n-dist;i++){/*Este para se mueve hasta la mitad del vector*/
            j = i+dist;
            while(((j+1) > dist) && (vec[j] < vec[j-dist])){
            /* El bucle compara el de la posicion i (que es la diferencia j-dist,el cual empieza al principio del vector)
            y el de la posicion j(que va desde la mitad hasta el final) siempre que j+1 sea mayor que la mitad*/
            /*Es j+1 porque el vector en c enpieza en la posicion 0*/
               (*ncomp)++;
            /*ademas hace una primera comparacion en el bucle*/          
               aux = vec[j];
               vec[j] = vec[j-dist];
               vec[j-dist]= aux;
            /*Asignacion doble entre los elementos del vector*/
               (*nmov)+= 2;
            /* Son dos movimientos por una asignacion doble*/
               j = j-dist;
            }
         /*Se compara   los elementos del vector en el "while" si no entra*/
            (*ncomp)++;
         }
         dist = dist/2;
      }
      (*tiempo) =((float)clock()-timeini)/CLOCKS_PER_SEC;
   /* se calcula el tiempo con la diferencia de los pulsos iniciales y los finales
   divididos entre CLOCKS_PER_SEC para calcularlos en segundos y un cast porque el clock
   devuelve un double*/
      return;
   }

