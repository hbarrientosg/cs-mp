#include <stdio.h>
#include <stdlib.h>
/*----------------------------------------------------------------------------*/
   int A(int m, int n){
      if (m<0 || n<0){
         return 0;		/*aqui realizo la funcion de Ackermann*/
      }				/*la cual esta descrita en el guion de practicas*/
      else{
         if (m==0){
            return n+1;        
         }
         else{
            if(m>0 && n==0){
               return A(m-1,1);
            }
            else{
               if (m>0 && n>0){
                  return A(m-1, A(m, n-1));
               }
            }
         }
      }			
   }
/*----------------------------------------------------------------------------*/
   void divisionReal(int dividendo, int divisor, float *entera, float *decimal ){
      if (divisor == 0){
         *entera=0;		/*aqui hago el procedimiento de division real*/
         *decimal=2;
      }
      else{
         *entera=dividendo/divisor;
         *decimal=(((float)dividendo)/divisor)-(dividendo/divisor);   
      }		/*utilizo el operador cast para pasar a real*/
   
   }
/*----------------------------------------------------------------------------*/
   void secuenciaNegativos(int v[], int numero,int c[],int *n2){
      int i,j,cuenta,posicion,nelement,posicion1; 
      nelement=0;
      for(i=0;i<numero;i++){	/*aqui realizo el procedimeiento de secuencia de negativos*/
         cuenta=0;
         if(v[i]<0){     
            posicion=i;
            for(j=i;j<numero;j++){
               if (v[j]<0){/*en el cual realizo la busqueda del primer negativo y el numero de negativos que le precede*/
                  cuenta++;
               }
               else{
                  break;
               }
            }
         
         }
         if(cuenta>nelement){
            nelement=cuenta;
            posicion1=posicion;/*y si es una cadena de elementos negativos larga la guardo en las variables auxiliares y sigo buscando si hay otro vector*/
         }
         i+=cuenta;
      }
      *n2=nelement;
      for(i=0;i<nelement;i++){
         c[i]=v[posicion1];/*cuando lo he terminado  guardo en el vector de salida la secuencia mas larga*/
         posicion1++;
      }
   }
/*----------------------------------------------------------------------------*/
   int main()
   {
      int menu,m,n,res,numeroV,f[100],i,d[100];
      float res1, res2;
      do{
         printf("**-------------------------------------------------**\n");
         printf("*      1.-Para realizar la funcion de Ackermann     *\n");
         printf("*      2.-Para realizar la divicion real            *\n");
         printf("*      3.-Para realizar la secuencia de negativos   *\n");
         printf("*            0.-Terminar el Programa                *\n");
         printf("**-------------------------------------------------**\n");
         printf("Escriba una de las opciones:");
         scanf("%d",&menu);
         switch(menu){
            case 1:
               printf("Deme un valor entero:\n");
               scanf("%d",&m);
               printf("Deme otro valor entero:\n");
               scanf("%d",&n);
               res=A(m,n);/*la realizacion del procedimiento principal lo realizo con un menu */
               printf("El resultado es:");/*ya que a mi me parece mas optimo para corregirlos fallos que pudiera tener mi practica*/
               printf("%d\n",res);
               break;
            case 2:
               printf("Deme el valor del dividendo:\n");
               scanf("%d",&m);
               printf("Deme el valor del divisor:\n");
               scanf("%d",&n);
               divisionReal(m, n, &res1, &res2);
               printf("La parte entera es:\n");
               printf("%f\n",res1);
               printf("La parte decimal es:\n");
               printf("%f\n",res2);
            
               break;
            case 3:
               printf("Deme los el numero de elementos que va ser el vector:");
               scanf("%d",&numeroV);
               for (i=0;i<numeroV;i++){
                  printf("deme un valor para meter en el vector:\n");
                  scanf("%d",&m);
                  f[i]=m;
               }
               secuenciaNegativos(f,numeroV,d,&n);
               printf("El vector tiene:");
               printf("%d\n",n);
               printf("Los valores del vector son:\n");
               for (i=0;i<n;i++){
                  m=d[i];
                  printf("%d\n",m);
               }
               break;
            case 0:
               break;
            default:
               printf("Escriba un numero del 0 al 3\n");
         }
      }
      while(menu!=0);
      return 0;
   }
