# Práctica nº 3: Uso de tipos estructurados.
- Familiarizarse con las características generales de los sistemas de tipado y control de excepciones de Ada. 

## Objetivos generales.
Saber diferenciar y definir tipos escalares.
Saber usar y definir tipos estructurados homogéneos.
Saber usar y definir tipos estructurados heterogéneos.
Conocer y saber usar los mecanismos básicos de tratamiento de excepciones.

## Ejercicios
  Descargue el fichero practica_3.ada e inclúyalo en un proyecto nuevo. (En este fichero se definen, entre otras cosas, los tipos Matriz, Numero_Corto, Vector y TMayor, y la excepción Error_Suma de los que se habla en los siguientes apartados).
  Añada al proyecto un fichero llamado practica_3-suma_filas.adb en el que desarrollará:
      Una función llamada Suma_Filas separada de practica_3, a la que se le pasará un parámetro de tipo Matriz y que devolverá un valor de tipo Vector que representará la suma de todas las filas de la matriz representada por dicho parámetro. Sea M una matriz de F filas por C columnas, la suma de las filas de M es un vector, V, tal que: para todo i en el rango 1 .. C : V(i) = ∑M(j,i)desde j=1 hasta F.
      Si se intenta sumar dos valores y se produce un error porque se excede la capacidad del tipo Numero_Corto, se debe lanzar la excepción Error_Suma.
      La interfaz de la función se atendrá a la declaración que hay de la misma en el fichero practica_3.ada. 
  Añada al proyecto otro fichero llamado practica_3-mayor.adb en el que desarrollará:
      Una función de tipo TMayor separada de practica_3 llamada Mayor, con un parámetro de tipo Vector, que devolverá: el mayor valor almacenado en el parámetro de tipo Vector y su posición. Si el valor máximo se repite en el vector, la posición a devolver será la de su primera aparición.
      La interfaz de la función se atendrá a la declaración que hay de la misma en el fichero practica_3.ada. 
  Como resultado de la práctica se entregarán los ficheros practica_3-suma_filas.adb y practica_3-mayor.adb. 