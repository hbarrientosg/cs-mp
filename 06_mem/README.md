
# Práctica nº 6: Manipulación de variables en memoria dinámica.

## Objetivos operativos.

    Conocer el tipo access.
    Saber crear y destruir variables dinámicamente.
    Saber acceder a variables creadas dinámicamente.

## Ejercicios.

    Descargue el fichero practica6.ada e inclúyalo en un proyecto nuevo. En este fichero se definen, entre otras cosas, los tipos necesarios para representar en memoria dinámica una lista doblemente encadenada conteniendo información de tipo Integer.
    Lista doblemente encadenada
    Desarrolle, en sus correspondientes ficheros, los subprogramas que se enumeran a continuación: 

    Ubicación: fichero "practica6-insertar.adb"
    Nombre: Insertar
    Clase: procedimiento
    Implementación: separate de practica6
    Parámetros:
        L, de tipo Lista
        V, de tipo Integer
    Descripción: Inserta el valor V como último elemento de la lista L. Si cuando se intenta insertar un elemento no hay memoria disponible, el elemento no se insertará y el subprograma acabará sin que se aprecie ningún otro efecto.

    Ubicación: fichero "practica6-extraer.adb"
    Nombre: Extraer
    Clase: procedimiento
    Implementación: separate de practica6
    Parámetros:
        L, de tipo Lista
        V, de tipo Integer
    Descripción: si en la lista L existen 1 o más nodos cuya información se corresponda con el parámetro V, extrae y elimina el primero de ellos. En caso de que el valor V no se encuentre en ningún nodo de la lista referenciada por L, no hace nada.

    Ubicación: fichero "practica6-valores.adb"
    Nombre: Valores
    Clase: función
    Implementación: separate de practica6
    Parámetros:
        L, de tipo Lista
    Resultado: de tipo Vector
    Descripción: devuelve un valor de tipo Vector conteniendo los campos de información de los nodos de la lista referenciada por L en el mismo orden en que se encuentran en dicha lista al recorrerla desde el nodo de inicio al nodo final. En el caso de que la lista esté vacía, lanza la excepción Lista_Vacía.

## A tener en cuenta.

    Siempre que sea necesario crear un nodo se utilizará la función Crear que se proporciona en el procedimiento Practica6 del fichero Practica6.ada.
    Siempre que sea necesario destruir un nodo se utilizará el procedimiento Liberar que se proporciona en el procedimiento Practica6 del fichero Practica6.ada. 

