program ej2;
function factorial ( n : integer ) : integer;
var 
i : integer;
begin
factorial:= 1;
for i:=1 to n do factorial:= factorial * i;
end;

function combinatorio ( m : integer; n : integer ) : real;
begin
combinatorio := (factorial(m)/((m-n)*factorial(n)));
end;

var 
numero, valorM : integer;
begin
read(numero);
read(valorM);
writeln(factorial(numero));

writeln('  Combinatorio');

writeln('[+] ', combinatorio(valorM,numero):0:2);

end.