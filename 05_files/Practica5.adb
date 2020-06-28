with Text_Io,sequential_io,Direct_io;
with Ada.strings.unbounded;
use text_io;
use Ada.strings.unbounded;
procedure practica5 is
	Type TDatos is record
		Palabra:string(1..15);-- Este el tipo de dato que tiene el fichero de acceso directo
		numero:Natural;
	end record;
	package ficheroSec is new Sequential_Io(positive);-- Declaro los ficheros indice y secuencial y de que estructuras
	package ficheroInd is new Direct_io(TDatos);-- se componen ambos ficheros
	use FicheroSec,ficheroInd;
	-- declaro las variables que voy a  utilizar--
	Nombre_dat,nombre_ind,Nombre_txt:string(1..50);
	Lon_dat,lon_Ind,lon_txt:Natural;
	Fichero_dat:FicheroInd.File_type;
	fichero_Ind:FicheroSec.File_type;
	fichero_Txt:Text_io.File_type;
	Dato:Tdatos;
	N:Natural;
	Linea:unbounded_string:=null_unbounded_string;
begin
	-- Pido los nombres de los ficheros por pantalla
	put_line("Deme el Nombre del fichero con extencion .ind");
	get_line(Nombre_ind,Lon_ind);
	put_line("Deme el Nombre del Fichero con extencion .dat");
	get_line(Nombre_dat,Lon_dat);
	Put_line("Deme el nombre del fichero de texto destino");
	get_line(Nombre_txt,Lon_txt);
	-- Abro el fichero secuencial y el de acceso directo
	open(Fichero_Dat,in_file,Nombre_dat(1..lon_Dat));
	open(Fichero_Ind,in_file,Nombre_Ind(1..Lon_ind));
	Create(fichero_Txt,out_file,Nombre_Txt(1..lon_Txt));
	
	loop
		read(fichero_ind,N);
		-- leo en el fichero la posicion 
		Read(fichero_dat,Dato,Ficheroind.positive_count(N));
		-- leo el dato en la posicion que marac el fichero anterior
		if index(to_unbounded_string(Dato.Palabra(1..dato.Numero)),".")= dato.Numero then
			-- si la palabra tiene el punto al final lo concateno a linea  y lo escribo en el fichero
			Linea:=Linea & to_unbounded_string(Dato.Palabra(1..dato.Numero));
			put_line(Fichero_txt,To_string(Linea));
			linea:=null_unbounded_string;
		else
			--si no entoces lo concateno con un espacio a linea
			Linea:=Linea & to_unbounded_string(Dato.Palabra(1..dato.Numero)) & " ";
		end if;
		exit when end_of_File(fichero_ind);
	end loop;
	If Length(Linea)/=0 then-- si al final  no hay punto entoces le quito el espacio y
 		--lo 	escribo en el fichero
		Linea:=to_unbounded_string(slice(linea,1,Length(Linea)-1));
		put_line(Fichero_txt,To_string(Linea));
	end if;
	close(Fichero_ind);
	Close(Fichero_Dat);--Cierro los ficheros
	Close(Fichero_Txt);
exception
	when ficheroInd.Name_Error | FicheroSec.name_Error =>
		put_line("El nombre del archivo  no existe");
	when ficheroInd.End_Error | FicheroSec.End_Error =>
		put_line("No ha escrito la ruta del archivo");
	When FicheroInd.Device_Error | FicheroSec.Device_Error =>
		Put_line("No puede Escribir en el dispositivo");
	when Others =>
			Put_line("Error desconocido");
end Practica5;
