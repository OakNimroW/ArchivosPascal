program a;
{
  se lee una sucesion de numeros enteros que termina en 9999
  obtener e informar la suma de todas las unidades
  y los dos digitos mayores en cada numero
}
var
  unidad, sumaUnidades, numero, resto, mayorNumero, menorNumero, numeroOriginal: Integer;

begin
  sumaUnidades := 0;
  repeat
  read(numeroOriginal);
  
  numero := numeroOriginal;
  if numeroOriginal = 9999 then Break;

  mayorNumero := -1;
  menorNumero := 10;

  unidad := numero MOD 10;
  sumaUnidades := sumaUnidades + unidad;

  while numero <> 0 do begin
    resto := numero MOD 10;
    numero := numero DIV 10;
    if resto > mayorNumero then mayorNumero := resto;
    if resto < menorNumero then menorNumero := resto;
  end;

  WriteLn('Numero Escaneado: ', numeroOriginal);
  WriteLn('  MayorNumero: ', mayorNumero);
  WriteLn('  Menor Numero: ', menorNumero);
  WriteLn('  Unidad : ', unidad);
  WriteLn();

  until numeroOriginal = 9999;

  Write('suma de unidades: ', sumaUnidades);

end.