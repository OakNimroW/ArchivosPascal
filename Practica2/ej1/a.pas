program a; 
{
  a) realizar un programa que lea desde teclado un  numero entero e imprima los digitos multiplos de 3
  b) modificar a para informar el digito mas grande encontrado en el numero
  c) modificar a para leer desde teclado 80 numeros enteros a los que se les debera informar sus digitos pares
  d) modificar a para leer desde teclado numeros enteros hasta que se ingrese el numero -1, el cual no debe procesarse; para cada numero debe inforrmar sus digitos pares
  e) modificar a para leer desde teclado numeros enteros hasta que se  hayan procesado al menos 100 digitos (tenga en cuenta que el ultimo numero ingresado debe procesarse completo)
}
var
numero, digito, digitoMasGrande,i : Integer;
begin
{WriteLn('ingresar digito para punto a');
ReadLn(numero);
while (numero <> 0) do begin
  digito := numero MOD 10;
  if digito MOD 3 = 0 then WriteLn(digito);
  numero := numero DIV 10;
end;}
{WriteLn('ingresar digito para punto b');
ReadLn(numero);
digitoMasGrande := 0;
while (numero <> 0) do begin
  digito := numero MOD 10;
  if digito > digitoMasGrande then digitoMasGrande := digito;
  numero := numero DIV 10;
end;
WriteLn(digitoMasGrande);}
{WriteLn('ingresar digito para punto c');
ReadLn(numero);
for i := 1 to 80 do begin
WriteLn('ingresar digito para punto c');
ReadLn(numero);
  while (numero <> 0) do begin
  digito := numero MOD 10;
  if digito MOD 2 = 0 then WriteLn(digito);
  numero := numero DIV 10;
  end;
end;}
{numero := 0;
while (numero <> -1) do begin
  WriteLn('ingresar digito para punto d');
  ReadLn(numero);
  if numero = -1 then break;
  digito := numero MOD 10;
  if digito MOD 2 = 0 then WriteLn(digito);
  numero := numero DIV 10;
end;}
for i:= 1 to 100 do begin 
  WriteLn('ingresar digito para punto e');
  ReadLn(numero);
  WriteLn(numero);
end;
end.