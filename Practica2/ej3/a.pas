program a;
{
  a) se leen 10 numeros enteros. determinar para cada uno de ellos la suma de sus cifras hasta expresarlas en una sola unidad e informar
  b) modificar a para imprimir en letras la cifra resultante
}
var
i, numero, digito, suma : Integer;
begin
{  for i := 1 to 10 do begin
  suma := 0;
  WriteLn('ingresar numero entero');
  ReadLn(numero);
  while numero <> 0 do begin
    digito := numero MOD 10;
    suma := suma + digito;
    numero := numero DIV 10;
    if (numero = 0 ) and (suma >= 10) then begin
      numero := suma;
      suma := 0;
    end;
  end;
  WriteLn(suma);
  end;}

  for i := 1 to 10 do begin
  suma := 0;
  WriteLn('ingresar numero entero');
  ReadLn(numero);
  while numero <> 0 do begin
    digito := numero MOD 10;
    suma := suma + digito;
    numero := numero DIV 10;
    if (numero = 0 ) and (suma >= 10) then begin
      numero := suma;
      suma := 0;
    end;
  end;
  WriteLn(suma);
  case (suma) of 
    1: WriteLn('uno');
    2: WriteLn('dos');
    3: WriteLn('tres');
    4: WriteLn('cuatro');
    5: WriteLn('cinco');
    6: WriteLn('seis');
    7: WriteLn('siete');
    8: WriteLn('ocho');
    9: WriteLn('nueve');
   else WriteLn('cero');
   end;
  end;
end.