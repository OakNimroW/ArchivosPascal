program ej11;
var 
	alfa, beta, gama, epsilon: integer; 
procedure calcular(alfa: integer; var gama: integer; var beta:integer; var epsilon: integer);
begin 
	alfa:= beta - 1 ; 
	beta:= alfa + 8; 
	gama:= beta + 15; 
	epsilon:= beta - gama; 
	writeln('Procedure Alfa ',alfa); 
	writeln('Procedure Beta ',beta); 
	writeln('Procedure Gama ',gama); 
	writeln('Procedure Epsilon ',epsilon); 
end; 

begin 
	alfa:= 6; 
	beta:= 13; 
	gama:= -6; 
	epsilon:= 2; 
	calcular(epsilon, alfa, beta, gama); 
	writeln('Codigo Main Alfa ',alfa); 
	writeln('Codigo Main Beta ',beta); 
	writeln('Codigo Main Gama ',gama); 
	writeln('Codigo Main Epsilon ',epsilon); 
end.