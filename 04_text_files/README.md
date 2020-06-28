# Práctica nº 4: Manejo de ristras de caracteres y de ficheros de texto.

## Objetivos operativos.

    Conocer las diferentes clases de ristras de caracteres que ofrece Ada 95 y saber operar con ellas. 

    Conocer la estructura y características de los ficheros de texto de Ada 95 y las operaciones que hay que efectuar cuando se utilizan.

## Ejercicios.

    Primera parte:
        Descargue el fichero practica4a.ada e inclúyalo en un proyecto nuevo.
        Añada al proyecto un fichero llamado practica4-separar.adb en el que desarrollará:
            Un procedimiento separado de Practica4 llamado Separar con tres parámetros: (1) R_Total, de entrada, una ristra dinámica, (2) R_Letra, de salida, una ristra dinámica que Separar construirá con todos los caracteres alfabéticos y los espacios de R_Total, en el mismo orden en que aparecen en aquella, y (3) R_Numer, de salida, una ristra dinámica que Separar construirá con todos los caracteres numéricos y los espacios de R_Total, en el mismo orden en que aparecen en aquella. Con los caracteres de R_Total que no sean espacios ni caracteres alfanuméricos no se hará nada.
            La interfaz del procedimiento Separar se atendrá a lo especificado en el fichero Practica4a.ada. 
    Segunda parte:
        Descargue el fichero practica4b.ada e inclúyalo en un proyecto nuevo.
        Añada al proyecto el fichero  practica4-separar.adb creado en la primera parte.
        Añada al proyecto un fichero llamado practica4-tratar_fichero.adb en el que desarrollará:
            Una función natural separada de Practica4 y llamada Tratar_Fichero que tendrá como parámetros tres ristras representando los nombres de tres ficheros de texto, el primero de los cuáles debe existir y estará formado por líneas de tamaño no superior a 125 caracteres. El segundo se creará con las ristras de caracteres alfabéticos y espacios resultantes de tratar cada línea del primero con el procedimiento Separar. El tercero se creará con las ristras de caracteres numéricos y espacios resultantes de tratar cada línea del primero con el procedimiento Separar. Ambos ficheros deben tener el mismo número de líneas que el primero, estando vacías las que no contengan caracteres adecuados.
            La función devolverá un 0 si termina correctamente su trabajo, un 1 si, por cualquier razón no puede abrir el fichero a tratar, un 2 si por alguna razón no puede crear los ficheros a generar y un 3 si ocurre algún otro problema que le impida terminar correctamente su ejecución. En todo caso, cualquier fichero que se haya podido abrir debe quedar cerrado, haya o no problemas.
            La interfaz de la función Tratar_Fichero se atendrá a lo especificado en el fichero Practica4b.ada.
            Puede probar el funcionamiento de Tratar_Fichero con el fichero prueba.txt, o cualquier otro que cree con un editor de textos.
## A tener en cuenta.

Cuando se utiliza "slice" con ristras de tamaño dinámico,  se debe tener en cuenta que lo que devuelve es de tipo string, aunque esté formada por un único carácter.