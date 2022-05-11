program a;
{
  se lee una secuencia de caracteres terminada en '*' o '.'. 
  Contar la cantidad de palabras de al menos cinco caracteers 
  que empiezan y terminan con 's' y 
  en total tienen exactamente dos 'a'
}
var 
cantidadPalabras, cantidadLetras,cantidadA: Integer;
inicioS, finS: Boolean;
letra, letraPrevia:char;
begin
  cantidadPalabras := 0;
  cantidadA := 0;
  cantidadLetras := 0;
  letraPrevia := ' ';
  WriteLn('Ingresar texto:');
  repeat
    read(letra);
    {WriteLn('  Letra a analizar: ', letra);
    WriteLn('  Letra previa: ', letra);}
    if (letra = 's') and (letraPrevia = ' ') then begin
      inicioS := True; 
      {WriteLn('Palabra iniciada en S.');}
    end;
    if (letra = ' ') or (letra = '*') or ( letra = '.') and (letraPrevia = 's') then begin
      finS := True;
      {WriteLn('Palabra finalizada en S.');}
    end; 
    if letra = 'a' then cantidadA := cantidadA + 1;

    if inicioS and finS and (cantidadA = 2) and (cantidadLetras >= 5) then begin
      cantidadPalabras := cantidadPalabras + 1;
      {WriteLn('Se encontro una palabra bonita: ', cantidadPalabras);}
    end;

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