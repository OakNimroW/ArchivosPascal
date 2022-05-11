program limpio;
var 
cantidadPalabras, cantidadLetras,cantidadA: Integer;
inicioS, finS: Boolean;
letra, letraPrevia:char;
begin
  cantidadPalabras := 0;
  cantidadA := 0;
  cantidadLetras := 0;
  letraPrevia := ' ';
  repeat
    read(letra);
    if (letra = 's') and (letraPrevia = ' ') then inicioS := True;
    if (letra = ' ') or (letra = '*') or ( letra = '.') and (letraPrevia = 's') then finS := True;
    if letra = 'a' then cantidadA := cantidadA + 1;
    if inicioS and finS and (cantidadA = 2) and (cantidadLetras >= 5) then cantidadPalabras := cantidadPalabras + 1;
    if (letra = ' ') or (letra = '*') or ( letra = '.') then begin
      inicioS := False;
      finS := False;
      cantidadA := 0;
      cantidadLetras := 0;
    end else cantidadLetras := cantidadLetras + 1;
    letraPrevia:= letra;
  until (letra = '*') or ( letra = '.');
  WriteLn('Cantidad de palabras encontradas: ', cantidadPalabras);
end.