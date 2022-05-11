program ej1;
function potencia ( base: integer; exponente: integer) : Integer;
var
i : Integer;
begin
potencia:= 1;
for i:=1 to exponente do potencia := potencia * base;
end;

var 
i,n: integer;
begin
read(i);
read(n);

writeln(potencia(i,n));

writeln('ejercicio b');

writeln('cuadrado: ', potencia(i,2));
writeln('cubo: ', potencia(i,3));
writeln('enesima: ', potencia(i,2));

end.