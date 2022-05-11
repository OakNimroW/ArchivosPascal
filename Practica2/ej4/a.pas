program a;  { Escriba un programa que lea de teclado un numero entero e imprima el numero resultante de invertir la posicion de todos sus digitos. por ejemplo si lee el numero 1234 debera imprimirse en pantalla numero 4321}
var 
numero, reverso ,digito, i, copia: Integer;
begin
WriteLn('ingresar numero entero');
ReadLn(numero);
i:=1;
reverso := 0;
copia := numero;
while copia <> 0 do begin
  copia := copia DIV 10;  
  i := i * 10 ;
end;
i:=  i DIV 10;
while numero <> 0 do begin
digito := numero MOD 10;
reverso := reverso + (digito * i );
numero := numero DIV 10; 
i:= i DIV 10;
end;  
WriteLn(reverso)
end.