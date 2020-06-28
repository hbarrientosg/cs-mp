#include "fraccion.h"
#include <stdlib.h>
#include <math.h>
#include <cfloat>
int Euclides(int m, int n)
{
	int t;
	while (m > 0)
	{
		t = n % m;
		n = m;
		m = t;
	}
	return n;
}
//----------------------------------------------------------------------------//
Fraccion::Fraccion(int numer, int deno)
{
	if(abs(deno) >= 1 && abs(numer) >= 0)
	{
		//controla la precondicion de la funcion euclides
		int Eucl = Euclides(abs(numer),abs(deno));
		while(Eucl != 1)
		{
			numer/= Eucl;
			deno/= Eucl;
			//si tienen factores en comun se dividen hasta que el 
			//unico factor en comun sea el uno
			Eucl = Euclides(abs(numer),abs(deno));
		}
	}
	if (deno < 0)
	{
		deno*=(-1);
		numer*=(-1);
	}
	num = numer;
	den = deno;

};
//----------------------------------------------------------------------------//
int Fraccion::numerador()
{
	return num;
};
//----------------------------------------------------------------------------//
int Fraccion::denominador()
{
	return den;
};
//----------------------------------------------------------------------------//
float Fraccion::valor()
{
	return (den == 0? FLT_MAX : (float)num/den);
};
//----------------------------------------------------------------------------//
Fraccion Fraccion::operator -(const Fraccion frac)
{
	return Fraccion(((num*frac.den)-(den*frac.num)),(den*frac.den));
}
//----------------------------------------------------------------------------//
Fraccion Fraccion::operator /(const Fraccion frac)
{
	return Fraccion((num*frac.den),(den*frac.num));
};
//----------------------------------------------------------------------------//
Fraccion Fraccion::inversa()
{
	return Fraccion(den, num);
};
//----------------------------------------------------------------------------//
void Fraccion::numeroMixto(int C,int D,int B)
{
    // floor da la parte entera de un numero real.
    C = (int)floor((double)num/den);
    D = num % den;
    B = den;
};
//----------------------------------------------------------------------------//
void  Fraccion::elevadoA(int ent)
{  
  //pow eleva un numero a otro.
  Fraccion((int)pow((double)num,(double)ent),(int)pow((double)den,(double)ent));
};
//----------------------------------------------------------------------------//
Fraccion operator +(const Fraccion frac1,const Fraccion frac2)
{
   return Fraccion(((frac1.num*frac2.den)-(frac1.den*frac2.num)),
                                                         (frac1.den*frac2.den));
};
//----------------------------------------------------------------------------//
Fraccion operator *(const Fraccion frac1,const Fraccion frac2)
{
    return Fraccion((frac1.num*frac2.num),(frac1.den*frac2.den));
};
//----------------------------------------------------------------------------//
