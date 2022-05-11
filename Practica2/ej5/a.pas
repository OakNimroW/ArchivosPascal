program a;
{
  a) escribir un programa que lea una secuencia de caracteres terminada en puento '.' e informe la cantidad de caracteres leidos.
  b) idem a ) pero informando la cantidad de letras 'A' leidas
  c) idem a) pero informando la cantidad de letras 's' leidas seguidas por una letra 'a'.
  Ejemplo: hJytsasv$&m@Tsad.
  la cantidad de caracteres leidos es 16
  la cantidad de letras A leidas es 0
  La cantidad de letras s seguidas de una letra a es 2
}
var
cantText , letrasA, letritasA: Integer;
text : char;
letraS : Boolean;
begin
text := 'a';
cantText:= 0;
letrasA:= 0;
letraS := False;
letritasA := 0;
while text <> '.' do begin
  WriteLn('introducir caracter');
  ReadLn(text);
  if text = '.' then break;
  cantText:= cantText + 1;
  if text = 'A' then letrasA := letrasA +1;
  if (letraS) and (text = 'a') then letritasA := letritasA +1;
  if text = 's' then letraS:=True; 
end;
WriteLn('  la cantidad de caracteres leidos es de ', cantText);
WriteLn('  la cantidad de letras A leidas es de ', letrasA);
WriteLn('  la cantidad de letras s seguidas de una letra a es ', letritasA);
end.