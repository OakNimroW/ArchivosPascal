{
  Defina un tipo de dato que permita almacenar una secuencia de 64 valores binarios e implemente módulos que realicen las operaciones AND, OR y NOT (vistas en la práctica de operaciones lógicas), junto con dos operandos o uno, según corresponda.
}

program e;

const
  cantBits = 4;

type
  vector = array[1..cantBits] of boolean;
  rango = '0' .. '1';


procedure escribirVector (v : vector);
var 
  i : integer;
begin
  for i := 1 to cantBits do if v[i] then begin Write('1') end else write('0');
  WriteLn();
end;

procedure leerVector (var v : vector);
  var
    i : integer;
    c : char;
  begin
    for i := 1 to cantBits do begin
      read(c);
      v[i] := (c = '1');
    end;
  end;

procedure f_and(v1: vector ; v2 : vector ; var v3 : vector) ;
  var
    i : integer;
  begin
    for i := 1 to cantBits do
      v3[i] := (v1[i] and v2[i]);
  end;

procedure f_or(v1: vector ; v2 : vector ; var v3 : vector) ;
  var
    i : integer;
  begin
    for i := 1 to cantBits do v3[i] := (v1[i] or v2[i]);
  end;

procedure f_not(v1 : vector ; var v3 : vector) ;
  var
    i : integer;
  begin
    for i := 1 to cantBits do v3[i] := not v1[i];
  end;

var 
  vec1,vec2,vec3 : vector;
  x : integer;
begin
  // WriteLn('Vector1 : ');
  leerVector(vec1);
  // WriteLn('Vector2 : ');
  leerVector(vec2);
  f_and(vec1, vec2, vec3);
  WriteLn('');
  WriteLn('V1 AND V2');
  escribirVector(vec3);
  f_or(vec1, vec2, vec3);
  WriteLn('V1 OR V2: ');
  escribirVector(vec3);
  f_not(vec1, vec3);
  WriteLn('NOT V1: ');
  escribirVector(vec3);

  writeln('');

  for x := 1 to cantBits do begin
    if vec1[x] then begin writeln('v1[',x,']:=1');
    end else writeln('v1[',x,']:=0');
  end;

  writeln('');

  for x := 1 to cantBits do begin
    if vec2[x] then begin writeln('v2[',x,']:=1');
    end else writeln('v2[',x,']:=0');
  end;

end.


















{
procedure leerVector (var v : vector);
  var
    i : integer;
    c : char;
  begin
    for i := 1 to cantBits do begin
      read(c);
      v[i] := (c = '1');
    end;
  end;

var 
  vec1,vec2,vec3 : vector;
begin
  leerVector(vec1);
  leerVector(vec2);

  writeln('');
  for x := 1 to cantBits do begin
    if vec1[x] then begin writeln('v1[',x,']:=1');
    end else writeln('v1[',x,']:=0');
  end;
  writeln('');
  for x := 1 to cantBits do begin
    if vec2[x] then begin writeln('v2[',x,']:=1');
    end else writeln('v2[',x,']:=0');
  end;
end.
}
{
  cuando ingreso los bits de a 4 (estoy probando con 4 bits) el 2do vector no se carga bien (hay algunos valores que quedan en 0 aunque les meta un 1) pero si escribo los 8 seguidos los dos vectores se cargan 10/10. entiendo que el problema es el read y el enter. se puede arreglar de una manera o que joda nomas?
}