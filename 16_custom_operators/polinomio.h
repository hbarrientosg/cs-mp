
class Polinomio
{
int gra;
float *poli;
public:
/*Un constructor al que se le pase el grado del polinomio
 a almacenar. El constructor debe inicializar los coeficientes
 del polinomio a cero*/
Polinomio(int grad = 0);
/*Pas�ndole un entero i devuelve una referencia al coeficiente ai.
 Este operador ser� el �nico que nos permita modificar el valor de
  cada coeficiente.*/
float & operator [](int i);
/*Una funci�n que devuelva el grado del polinomio.*/ 
int grado();
/*Un procedimiento que muestra el polinomio con cout. 
No muestre los t�rminos con coeficiente cero. En caso de que todos los 
coeficientes sean cero, muestra debe mostrar un cero.*/
void muestra();
/*Una funci�n que pas�ndole un valor real  "v", nos devuelva el valor del
 polinomio para x=v.*/
float valor(float v);
/*Las que se consideren necesarias para el correcto funcionamiento de la clase
 en circunstancias normales, como poder asignar un polinomio a otro,
  pasarlo por valor a una funci�n, etc*/
Polinomio(const Polinomio &Pol);
Polinomio & operator=(const Polinomio &Pol);
/*Una funci�n que devuelve el polinomio suma de dos polinomios.*/
friend Polinomio operator +(const Polinomio Pol1,const Polinomio Pol2);
/*Una funci�n que devuelve el polinomio resta de dos polinomios.*/
friend Polinomio operator -(const Polinomio Pol1,const Polinomio Pol2);
/*Una funci�n que devuelve la negaci�n de un polinomio*/
friend Polinomio operator -(const Polinomio Pol);
/*Una funci�n que devuelve el polinomio multiplicaci�n de dos polinomios.*/
friend Polinomio operator *(const Polinomio Pol1,const Polinomio Pol2);
~Polinomio(); 
};
