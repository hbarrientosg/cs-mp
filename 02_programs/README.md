# Práctica nº 2: Subprogramas.
- Conocer el manejo de subprogramas.  

## Objetivos generales.
- Conocer y distinguir procedimientos y funciones.
- Conocer los modos de paso de parámetros.
- Aprender a implementar procedimientos y funciones.
- Aprender a invocar cada clase de subprograma.
- Conocer los mecanismos de depuración relacionados con subprogramas (step into, locals, step out, call stack).

## Ejercicios
Descargue el fichero practica2.ada e inclúyalo en un proyecto nuevo.
Añada al proyecto un fichero llamado practica2-producto.adb en el que desarrollará:

    Un procedimiento separado de practica2 llamado Producto con dos parámetros enteros, el primero de entrada y el segundo de salida. El segundo parámetro retornará con:
        el producto de los valores positivos comprendidos entre 1 y el valor del primer parámetro (incluido), si el valor pasado como primer parámetro es mayor que 0;
        el producto de los valores negativos comprendidos entre -1 y el valor del primer parámetro (incluido), si el valor pasado como primer parámetro es menor que 0 (si el número es -1, el producto es -1);
        0 si el valor pasado como primer parámetro es 0. 
     La interfaz del procedimiento se atendrá a la declaración que hay del mismo en el fichero practica2.ada. 

Añada al proyecto otro fichero llamado practica2-es_primo.adb en el que desarrollará:

    Una función booleana separada de practica2 llamada Es_Primo con un parámetro natural que devolverá True si el valor pasado como parámetro es un número primo y False en caso contrario.
    La interfaz de la función se atendrá a la declaración que hay de la misma en el fichero practica2.ada.
    Definición: Un número natural es primo si y sólo si es divisible únicamente por sí mismo y por 1. 

Como resultado de la práctica se entregarán los ficheros practica2-producto.adb y practica2-es_primo.adb.