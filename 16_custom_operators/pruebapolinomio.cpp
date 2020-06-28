#include "polinomio.h"
#include <iostream>

using namespace std;

int main()
{
Polinomio paco(6);
Polinomio jorge(5);
jorge[0]= 3;
jorge[1]= 4;
jorge[2]= -5;
jorge[3]= 6;
float echo = jorge[0];
cout << paco[0] << " " << echo << "\n";
cout << paco.grado() << " " << jorge.grado() << "\n";
paco.muestra();
jorge.muestra();
cout << "\n";
cout << jorge.valor(2) << "\n";
system("Pause");
}
