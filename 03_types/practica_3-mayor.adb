separate(practica_3)
function Mayor(V:Vector) return TMayor is
Mayor:tMayor;
begin
	mayor.elemento:=V(1);--inicializo la variable mayor con el primer elemento
	mayor.posi:=1;
	for i in 2..v'last loop
		if v(i)>mayor.elemento then
			mayor.elemento:=v(i);--busco si otro elemento del vector es mayor y si lo es 
			mayor.posi:=i;		--lo guardo en la variable
		end if;
	end loop;
	return mayor;
end Mayor;
