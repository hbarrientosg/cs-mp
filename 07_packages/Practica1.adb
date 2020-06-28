Package body Numeros_racionales is 
	function "/"(A,B:integer)return Racional is
		R1:Racional;
		D:integer;
	Begin
	if B/=0 then
	R1.Num := A/Max(abs(a),abs(B));
	R1.Dem:= B/Max(abs(a),abs(B));
	else
	raise Denominador_cero;
	end if;
    Return r1;
    End "/";

	Function "+"(X,Y:Racional)return Racional is
		Aux:Racional;
	Begin
		Aux.Num:=(X.num*Y.Dem)+(Y.Num*X.Dem);
		Aux.dem:=X.dem*Y.dem;
		aux.dem:=aux.Dem/Max(abs(aux.num),abs(aux.dem));
		aux.num:=aux.num/Max(abs(aux.num),abs(aux.dem));
	Return Aux;
	End "+";
	function "-"(X,Y:Racional)return Racional is
		Aux:Racional;
	begin
		Aux.num:=(X.num*Y.Dem)-(Y.num*X.dem);
		aux.Dem:=Y.dem*X.dem;
		aux.num:=aux.num/Max(abs(aux.num),abs(aux.dem));
		aux.dem:=aux.Dem/Max(abs(aux.num),abs(aux.dem));
	return Aux;
	end "-";
	function "*"(X,Y:racional)return Racional is
		Aux:racional;
	Begin
		Aux.Num:=X.num*Y.Num;
		Aux.Dem:=X.dem*Y.dem;
		aux.num:=aux.num/Max(abs(aux.num),abs(aux.dem));
		aux.dem:=aux.Dem/Max(abs(aux.num),abs(aux.dem));
	return Aux;
	End "*";
	Function "/"(X,Y:Racional)return Racional is
		Aux:Racional;
	begin
		Aux.Num:=X.num*Y.dem;
		Aux.dem:=X.dem*Y.dem;
		aux.num:=aux.num/Max(abs(aux.num),abs(aux.dem));
		aux.dem:=aux.Dem/Max(abs(aux.num),abs(aux.dem));
		return Aux;
	End "/";
	Function "="(X,Y:Racional)return Boolean Is
	Begin
		return (X.dem=Y.dem) and (X.num=Y.Num);
	end "=";
	function Absoluto(X:Racional)return Racional is
		A,B:integer;
	begin
		If X.Dem/=-X.dem then
			A:=x.Num;
 	    	B:=X.Dem;
		End if;
		Return X;
	end Absoluto;
	function Numerador(X:Racional)return Integer is
	begin	
		return X.num;
	end Numerador;
	Function Denominador(X:Racional)return Integer is
	begin
		return X.dem;
	end Denominador;

	function Max(X,Y:integer)return Integer is
		aux,aux2,aux3:Integer;
	begin			
	if X = 0 Then		
		return Y;
	else
		if x>=y then
			Aux:=x-y;
			aux3:=y;
			while aux/=0 loop
				if aux>=aux3 then
				  	Aux2:=aux;
				else
					aux2:=aux3;
					aux3:=aux;
				end if;
				aux:=aux2-aux3;
			end loop;
			return aux3;
		else
			Aux:=y-x;
			aux3:=x;
			while aux/=0 loop
				if aux>=aux3 then
				  	Aux2:=aux;
				else
					aux2:=aux3;
					aux3:=aux;
				end if;
				aux:=aux2-aux3;
			end loop;
			return aux3;
		end if;
	end if;
end max;
end Numeros_Racionales;
