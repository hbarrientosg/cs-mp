#include "polinomio.h"
#include <math.h>
#include <iostream>

using namespace std;
/******************************************************************************/
Polinomio::Polinomio(int grad)
{
    gra = grad;
    poli = new float[gra];
    for(int i=0;i<gra;i++)poli[i] = 0.;
}
/******************************************************************************/
float & Polinomio::operator[](int i)
{
    return poli[i];
}
/******************************************************************************/
int Polinomio::grado()
{
    return gra;
}
/******************************************************************************/
void Polinomio::muestra()
{
    int zero=0;
    for(int i=0;i<gra;i++)
    {
        if(poli[i]!= 0)
        {
                switch(i)
                {
                case 0:
                       cout << poli[i] << " ";
                       break;
                case 1:
                       cout << poli[i] << "x" << " ";
                       break;
                default:
                        cout << poli[i] << "x^" << i << " ";
                }
        }
        else
        {
        zero++;
        }
        
    }
    if(zero == gra)cout << 0 << "\n";
}
/******************************************************************************/
float Polinomio::valor(float v)
{
    float resultado=0;
    for(int i = 0;i<gra;i++)resultado += poli[i]*((float)pow(v,i));
    return resultado;
}
/******************************************************************************/
Polinomio::Polinomio(const Polinomio &Pol)
{
    gra = Pol.gra;
    poli = new float[gra];
    for(int i=0;i<gra;i++)poli[i] = Pol.poli[i];
}
/******************************************************************************/
Polinomio & Polinomio::operator =(const Polinomio &Pol)
{
    if(gra != Pol.gra)
    {
        gra = Pol.gra;
        delete []poli;
        poli = new float [gra];
    }
    for(int i=0;i<gra;i++)poli[i] = Pol.poli[i];
    return *this;
}
/******************************************************************************/
Polinomio operator +(const Polinomio Pol1,const Polinomio Pol2)
{
    if(Pol1.gra >= Pol2.gra)
    {
        for(int i=0;i<Pol1.gra;i++)Pol1.poli[i]+=Pol2.poli[i];
        return Pol1;
    }
    else
    {
        for(int i=0;i<Pol2.gra;i++)Pol2.poli[i]+=Pol1.poli[i];
        return Pol2;
    }
}
/******************************************************************************/
Polinomio operator -(const Polinomio Pol1,const Polinomio Pol2)
{
    if(Pol1.gra >= Pol2.gra)
    {
        for(int i=0;i<Pol1.gra;i++)Pol1.poli[i]-=Pol2.poli[i];
        return Pol1;
    }
    else
    {
        for(int i=0;i<Pol2.gra;i++)Pol2.poli[i]-=Pol1.poli[i];
        return Pol2;
    }
}
/******************************************************************************/
Polinomio operator -(const Polinomio Pol)
{
        for(int i=0;i<Pol.gra;i++)Pol.poli[i]*=(-1);
        return Pol;
}
/******************************************************************************/
Polinomio operator *(const Polinomio Pol1,const Polinomio Pol2)
{
    Polinomio Pol(Pol1.gra+Pol2.gra);
    for(int i=0;i<Pol1.gra;i++)
        for(int j=0;j<Pol2.gra;j++)
        {
                Pol.poli[i+j] += Pol1.poli[i]*Pol2.poli[j];
        }
    return Pol;
}
/******************************************************************************/
Polinomio::~Polinomio()
{
    delete []poli;
}
