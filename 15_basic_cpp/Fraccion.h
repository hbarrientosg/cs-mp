#ifndef FRACCION
#define FRACCION

class Fraccion
{
	int num;
	int den;
 public:
/*A�ada el constructor o los constructores necesarios para crear
 una fracci�n pas�ndole el numerador y el denominador (en este orden),
 que permita conversiones autom�ticas de entero a Fraccion y que permita
 crear vectores de objetos Fraccion.*/
	Fraccion(int numer=0, int deno=1);
    int numerador();//Devuelve el numerador de la fracci�n
    int denominador();//Devuelve el denominador de la fracci�n
/*Devuelve el valor real (float) de la fracci�n. En caso de que el 
 denominador sea cero, el resultado de esta operaci�n ser� FLT_MAX.
 Para usar FLT_MAX hay que incluir*/
	float valor();
/*Funci�n que devuelve una fracci�n que sea resultado de la resta de la fracci�n
 actual menos una pasada por par�metro*/
	Fraccion operator -(const Fraccion frac);
    Fraccion operator /(const Fraccion frac);//An�logo a la resta
    Fraccion inversa();//Funci�n que devuelve la fracci�n inversa de la actual.
/*Para una fracci�n A/B el n�mero mixto se define como la terna (C,D,B) donde
  A/B=C+D/B siendo C  la parte entera del cociente entre A y B y D
  el resto. Escriba un procedimiento que devuelva en tres par�metros C, D y B,
  el n�mero mixto de la fracci�n*/
    void numeroMixto(int C,int D,int B);
/*Escriba una funci�n que pas�ndole un entero devuelva una fracci�n que sea
 el resultado de elevar la fracci�n a dicho entero*/
	void  elevadoA(int ent);
	//An�logo a la resta pero una funci�n no perteneciente a la clase;
    friend Fraccion operator +(const Fraccion frac1,const Fraccion frac2);
	//An�logo a la resta pero una funci�n no perteneciente a la clase;
	friend Fraccion operator *(const Fraccion frac1,const Fraccion frac2);

};
#endif
