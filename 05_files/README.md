# Práctica nº 5: Manejo de ficheros de componentes homogéneos.


# Objetivos operativos.

    Conocer las características de los ficheros uniformes.
    Diferenciar entre tratamiento secuencial y acceso directo.
    Aprender a utilizar las operaciones de manipulación de ficheros en los diferentes modos de tratamiento.

# Ejercicios.
Para esconder un mensaje se ha recurrido a un método consistente en utilizar dos ficheros, uno índice y otro de datos. El fichero índice está compuesto de números positivos, mientras que el de datos se compone de records con dos campos: el primero una string(1..15) y el segundo de tipo Natural. En el fichero de datos se representan palabras en el primer campo y se utiliza el segundo para indicar el número de caracteres de la palabra almacenada (no más de 15). La ocultación del mensaje se ha hecho de tal manera que si se recorre el fichero índice secuencialmente y  se van utilizando los números en él almacenados como indicadores de posición para acceder a los registros del fichero de datos se obtiene el mensaje correctamente ordenado. El mensaje puede estar compuesto por más de una línea de texto, de manera que, cuando una palabra acaba en un punto ('.') indica el final de una línea del mensaje.
 
Ejemplo:
El que no corre.
vuela
fichero índice 	fichero de datos
3               que 	3
1               vuela 	5
4               El 	2
5               no 	2
2               corre. 	6
	
    Desarrolle un programa que tome una pareja de ficheros como los descritos y reconstruya el mensaje en un fichero de texto en el que cada línea estará formada por las palabras correspondientes, colocadas en el orden adecuado, separadas por un espacio y sin espacios adicionales ni al principio ni al final. El programa pedirá al usuario, en primer lugar, el nombre del fichero índice, luego el del fichero de datos y por último el nombre del fichero de texto que se va a crear con el resultado.
    Incluya código en el procedimiento principal para controlar las excepciones que, razonablemente, puedan ocurrir al intentar operar con ficheros uniformes de modo que le dé al usuario un mensaje adecuado y acabe el programa.

Puede probar el programa utilizando los ficheros: Mensaje.ind y Mensaje.dat como fichero índice y fichero de datos respectivamente.

## A tener en cuenta.

    El parámetro From de la operación Read en los ficheros de acceso directo debe ser del tipo Positive_Count que está declarado en la instancia del paquete genérico correspondiente.
    Las excepciones relacionadas con operaciones sobre ficheros deben ir prefijadas con el nombre de la instancia del paquete correspondiente.
    El fichero a entregar como resultado de la práctica deberá llamarse practica5.adb. El procedimiento principal se llamará asimismo practica5. 





