separate(practica_3)
--Esta es la funcion que suma los elementos de la columna de una matriz y los guarda en un vector
function Suma_Filas(M:Matriz) return Vector is
	v:vector(M'range(2));
begin
for i in M'Range(2) loop
	v(I):=m(1,i);--en el vector guardo el primer elemento de la columna la matriz
	for j in 2..M'last loop
		v(I):=v(I)+ M(J,I);-- le sumo al vector el resto de los elemento de la columna
	end loop;
end loop;
return v;
exception
	when Constraint_error =>
	raise Error_Suma; --lanza error suma si existe un overflow en la suma ya que se sale del rango del tipo 
end suma_filas;
