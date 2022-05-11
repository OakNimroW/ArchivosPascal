{
  Realizar un módulo que reciba un vector A y dos valores I, J. El módulo debe devolver el vector A del cual se suprimen las componentes que se encuentran entre las posiciones I y J (inclusive las componentes de dichas posiciones).
}

program ej2;
const
  dimF = 10;
  agregarItemsVector = dimF;
type
  vector = array[1..dimF] of integer;

procedure agregarItemVector(var v : vector; var dimL : integer ; nItem : integer; var exito : boolean);
  begin
    exito:= false;
    if dimL < dimF then begin
      dimL := dimL + 1;
      v[dimL] := nItem;
      exito := true;
    end else WriteLn('Vector Completo.');
  end;


procedure leerVector(v : vector; dimL : integer);
  var
    i : integer;
  begin
    for i := 1 to dimL do WriteLn('Item ', i, ' del vector: ' , v[i]);
    WriteLn();
  end;

procedure modulo (var v : vector; var dimL : integer; i,j : integer);
  var
    x,menor,mayor,diferencia : integer;
  begin
    if (i >= j) then begin
      menor := j;
      mayor := i;
    end else begin
      menor := i;
      mayor := j;
    end;

    diferencia := mayor - menor + 1;

    if (menor >= 1) and (mayor <= dimL) then begin
      x := 0;
      while (x < diferencia) do begin
        v[menor + x] := v[menor + diferencia + x];
        x := x + 1;
      end;
      dimL := dimL - diferencia;
    end;
  end;

var
  vec : vector;
  i : integer;
  dimL : integer;
  nuevoItem : integer;
  exito : boolean;

  valorA, valorB : integer;

begin
  dimL := 0;
  for i := 1 to agregarItemsVector do begin
    // Write('Nuevo Item (integer): ');
    // ReadLn(nuevoItem);
    // agregarItemVector(vec, dimL, nuevoItem, exito);
    agregarItemVector(vec, dimL, i, exito);
    // if (exito) then WriteLn('Adicion Exitosa.')
    // else WriteLn('Adicion Denegada');
  end; 
    WriteLn();
    WriteLn('Vector completo.');

  leerVector(vec,dimL);

  WriteLn();

  WriteLn('Ingresar primer valor (i): ');
  ReadLn(valorA);

  WriteLn('Ingresar primer valor (j): ');
  ReadLn(valorB);

  modulo(vec,dimL,valorA,valorB);

  leerVector(vec,dimL);

end.