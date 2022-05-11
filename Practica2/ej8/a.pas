program a;
{
  a) se lee una secuencia de caracteres que termina cuando se procesa el caracter numero 500 o se ingresa el caracter 'Z', el cual debe procesarse. Determinar la cantidad de palabras que componen la secuencia
  b) idem a) pero calculando la cantidad de palabras que comienzan con 'R'
  c) idem a) y b) pero calculando la cantidad de palabras que terminan con 'T'
  d) idem a), b) y c) pero calculando la cantidad de palabras que comienzan con 'R' y terminan con 'N'.
  e) idem a) a d) pero calculando la cantidad de palabras que tienen menos de 6 caracteres y exactamente dos 'p'.
  f) pussy el que no lo hace a papel.
}
var
{declaro variables a usar}
i, cantidadPalabras, cantidadPalabrasR, cantidadPalabrasT, cantidadPalabrasRN, cantidadCaracteres , cantidadP, cantidadPalabrasFiltradas: Integer;
text: char;
comienzaPalabra, comienzaPalabraR, terminaPalabraT, terminaPalabraN: Boolean;
begin
{ inicializo variables }
i:= 0;
cantidadPalabras:= 0;
cantidadPalabrasR:= 0;
cantidadPalabrasT:= 0;
cantidadPalabrasRN:= 0;
cantidadCaracteres:= 0;
cantidadP:= 0;
cantidadPalabrasFiltradas:= 0;
comienzaPalabra:= False;
comienzaPalabraR:= False;
terminaPalabraT:= False;
terminaPalabraN:= False;

{ bucle de maximo 500 iteraciones}

  for i := 1 to 500 do begin
    WriteLn('  ingresar caracteres a troche y moche');
    ReadLn(text);
    {si ingresan Z termina el codigo}
    if text = 'Z' then break;
    {si se escribe una letra comienza una palabra}
    if text <> ' ' then begin
      comienzaPalabra := True;
      {anoto si comienza con R}
      if text = 'R' then comienzaPalabraR :=True;
    end;
    { escaneo para palabra terminada en T}
    if (terminaPalabraT) and (text <> ' ') then terminaPalabraT := False;
    if text = 'T' then terminaPalabraT := True;
    { escaneo para palabra terminada en N}
    if (terminaPalabraN) and (text <> ' ') then terminaPalabraN := False;
    if text = 'N' then terminaPalabraN := True;
    { si se envia espacio termina la palabra }
    if (text = ' ') and (comienzaPalabra) then begin
      {contando palabras}
      cantidadPalabras := cantidadPalabras + 1;
      comienzaPalabra:= false;
      { escaneo palabra comienza con R}
      if comienzaPalabraR then begin
        comienzaPalabraR := false;
        cantidadPalabrasR:= cantidadPalabrasR + 1;
        { escaneo palabra finaliza en N al comenzar con R}
        if terminaPalabraN then begin
          terminaPalabraN := False;
          cantidadPalabrasRN := cantidadPalabrasRN + 1;
        end;
      end;
      { escaneo palabra finaliza en T}
      if terminaPalabraT then begin
        terminaPalabraT := False;
        cantidadPalabrasT := cantidadPalabrasT + 1;
      end;
      if (cantidadCaracteres = 6) and (cantidadP = 2) then cantidadPalabrasFiltradas := cantidadPalabrasFiltradas + 1;
      { limpieza de filtros }
      cantidadCaracteres := 0;
      cantidadP:= 0;
    end else begin {vida antes que muerte}
      {ajuste filtros}
      cantidadCaracteres := cantidadCaracteres + 1;
      if text = 'p' then cantidadP := cantidadP + 1;
    end;
  end;
  {informe de informacion}
  WriteLn('  la cantidad de palabras escritas es de: ', cantidadPalabras);
  WriteLn('  la cantidad de palabras escritas que comienzan con R es de: ', cantidadPalabrasR);
  WriteLn('  la cantidad de palabras escritas que terminan con T es de: ', cantidadPalabrasT);
  WriteLn('  la cantidad de palabras escritas que comienzan con R y terminan con N es de: ', cantidadPalabrasRN);
  WriteLn('  la cantidad de palabras escritas con seis caracteres y dos pes es de: ', cantidadPalabrasFiltradas);
end.