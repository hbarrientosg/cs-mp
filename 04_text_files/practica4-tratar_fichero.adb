separate(Practica4)
function Tratar_Fichero(Nom_F_Ent: in Unbounded_String;
							Nom_F_Let: in Unbounded_String;
							Nom_F_Num: in Unbounded_String) return Natural is 
Fich1,fichL,fichN:file_type;
letra,Numero:Unbounded_string;
linea:string(1..125);
nume:natural;
begin
	open(fich1,in_file,name=>to_string(Nom_F_Ent));
	--Abro el fichero de que se van ha leer las lineas.
	create(fichL,out_file,to_string(Nom_f_let));
	--creo el fichero en modo escritura , de letras.
	create(fichN,out_file,to_string(Nom_f_num));
	--creo el fichero en modo lectura de numeros.
		loop
			letra:=null_unbounded_string;
			numero:=Null_unbounded_string;--vacio las ristras
			get_line(fich1,linea,nume);--leo una linea en el fichero
			separar(to_unbounded_string(linea(1..nume)),Letra,Numero);
			--los separo con la funcion separar
			put_line(fichL,to_string(Letra));--Y guardo las lineas en sus ficheros 
			--correspondientes
			put_line(fichN,to_string(Numero));
		exit when end_of_file(fich1);
		end loop;
	close(fich1);
	close(fichL);
	close(fichN);
	return 0;
exception
	when Name_error =>
			--salta cuando el nombre del fichero que se va a leer no existe
		return 1;
	when Mode_error =>
			-- si no puede crear los ficheros
		return 2;
	when others =>
			-- en otros casos retorna 3
		return 3;	
end Tratar_fichero;
