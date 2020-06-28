#ifndef FRACCION
#define FRACCION

class Fraccion
{
	int num;
	int den;
 public:
/*Añada el constructor o los constructores necesarios para crear
 una fracción pasándole el numerador y el denominador (en este orden),
 que permita conversiones automáticas de entero a Fraccion y que permita
 crear vectores de objetos Fraccion.*/
	Fraccion(int numer=0, int deno=1);
    int numerador();//Devuelve el numerador de la fracción
    int denominador();//Devuelve el denominador de la fracción
/*Devuelve el valor real (float) de la fracción. En caso de que el 
 denominador sea cero, el resultado de esta operación será FLT_MAX.
 Para usar FLT_MAX hay que incluir*/
	float valor();
/*Función que devuelve una fracción que sea resultado de la resta de la fracción
 actual menos una pasada por parámetro*/
	Fraccion operator -(const Fraccion frac);
    Fraccion operator /(const Fraccion frac);//Análogo a la resta
    Fraccion inversa();//Función que devuelve la fracción inversa de la actual.
/*Para una fracción A/B el número mixto se define como la terna (C,D,B) donde
  A/B=C+D/B siendo C  la parte entera del cociente entre A y B y D
  el resto. Escriba un procedimiento que devuelva en tres parámetros C, D y B,
  el número mixto de la fracción*/
    void numeroMixto(int C,int D,int B);
/*Escriba una función que pasándole un entero devuelva una fracción que sea
 el resultado de elevar la fracción a dicho entero*/
	void  elevadoA(int ent);
	//Análogo a la resta pero una función no perteneciente a la clase;
    friend Fraccion operator +(const Fraccion frac1,const Fraccion frac2);
	//Análogo a la resta pero una función no perteneciente a la clase;
	friend Fraccion operator *(const Fraccion frac1,const Fraccion frac2);

};
#endif
