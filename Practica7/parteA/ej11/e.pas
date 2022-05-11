{
  Construir un programa que lee desde teclado una secuencia de números reales hasta que se introduzca el 50. Informar los 7 números mayores de la secuencia.
  Nota: Implemente la solución sin almacenar TODOS los números leídos.
}
program e;
const
  dimF = 7;

type
  rango = 1..dimF;
  vector = array[rango] of Integer; 

procedure leerVector (v : vector; dimL : integer);
  var
    i : integer;
  begin 
    WriteLn('');
    for i := 1 to dimL do begin
      WriteLn('Numero numero ',i,': ',v[i]);
    end;
  end;

var
  num: integer;
  vec : vector;
  i : integer;
  dimL : rango;
  corte : boolean;
begin
  dimL:= 1;
  Readln(num);
  while (num <> 50) do begin
    if (dimL < dimF) then begin
      vec[dimL + 1] := num;
      dimL := dimL + 1;
    end else begin
      i := 1;
      corte := false;
      while (i <= dimL) and (not corte) do begin
        if (vec[i] < num) then begin
          vec[i] := num;
          corte := True;
        end; 
        i := i + 1;
      end;
    end;
    ReadLn(num);
  end;
 
  leerVector(vec,dimL);
end.