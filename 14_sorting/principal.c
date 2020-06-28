#include<stdio.h>
#include"compvect.h"
#include"metodo1.h"
#include"metodo2.h"
#define ALEATORIO 2 
#define INVERSA 1

   int main(){
      int i,j,v1[32000],compara1,movimient1,compara2,movimient2,Ecomp,Emov;
      float tempo1,tempo2,Etempo,aux1,aux2;
   /*--------------Metodo 1 Shell----------------------------------------------------*/
      printf("                        METODO DE SHELL                             \n");
      printf("         Vector inversamente             Vector aleatorio           \n");
      printf("       Comparaciones Movimientos Tiempo Comparaciones Movimientos Tiempo \n");
      for(i=1000;i<64000;i*=2){
      /*bucle para comprovar todas los tamaños del vector*/
         InicializaVector(v1,i,INVERSA);
         Metodo1(v1,i,&compara1,&movimient1,&tempo1);
         CompruebaVector(v1,i);
         Ecomp = Emov = Etempo =0;
      /*inicializo las variables sumadoras*/
         for(j=0;j<10;j++){
         /*Comprueba el sumatorio de las 10 pruebas del vector en aleatorio*/
            InicializaVector(v1,i,ALEATORIO);
            Metodo1(v1,i,&compara2,&movimient2,&tempo2);
            CompruebaVector(v1,i);
            Ecomp += compara2;
            Emov += movimient2;
            Etempo += tempo2; 
         }
         printf(" %6i   %7i   %7i     %1.4f     %7i    %7i    %1.4f\n",i,compara1,movimient1,tempo1,
               Ecomp/10,Emov/10,Etempo/10);
      }
   
   /*--------------Metodo 1 insercion lineal----------------------------------------------------*/
      printf("             METODO DE INSERCION LINEAL CON INTERCAMBIO             \n");
      printf("         Vector inversamente             Vector aleatorio           \n");
      printf("       Comparaciones Movimientos Tiempo Comparaciones Movimientos Tiempo \n");
      for(i=1000;i<64000;i*=2){
      /*bucle para comprovar todas los tamaños del vector*/
         InicializaVector(v1,i,INVERSA);
         Metodo2(v1,i,&compara1,&movimient1,&tempo1);
         CompruebaVector(v1,i);
         aux2 = aux1 = Etempo =0;
      /*inicializo las variables sumadoras*/
         for(j=0;j<10;j++){
         /*Comprueba el sumatorio de las 10 pruebas del vector en aleatorio*/
            InicializaVector(v1,i,ALEATORIO);
            Metodo2(v1,i,&compara2,&movimient2,&tempo2);
            CompruebaVector(v1,i);
            aux1 += compara2;
            aux2 += movimient2;
            Etempo += tempo2; 
         }
         printf(" %6i  %9i   %9i    %1.4f    %9.0f  %9.0f   %1.4f\n",i,compara1,movimient1,tempo1,
               aux1/10,aux2/10,Etempo/10);
      }
      getchar();
      return 0;
   }
