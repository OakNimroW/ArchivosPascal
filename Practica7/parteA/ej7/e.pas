{
  Simular el funcionamiento de un conjunto de caracteres de la ‘a’ a la ‘z’ utilizando un arreglo. 
  Defina un tipo de datos adecuado e implemente módulos que realicen las operaciones de unión y diferencia de dos conjuntos y una función que permite determinar si una letra pertenece al conjunto. 
  Nota: realice los chequeos correspondientes en cada módulo para procesar solo letras.
}
program e; 

type
  rango = 'a'..'z';
  vector = array[rango] of boolean;

procedure union(v1,v2: vector; var v3 : vector);
var
  i : rango;
begin
  for i := 'a' to 'z' do v3[i] := (v1[i] or v2[i]);
end;

procedure dif(v1,v2:vector ; var v3 : vector);
var 
  i : rango;
begin
  for i := 'a' to 'z' do v3[i] := (v1[i] and (not v2[i]));
end;

procedure pertenencia(c : char; v : vector; var result : boolean);
begin
  if (c >= 'a') and (c <= 'z') then result:=  v[c];
end;

var 
  vec1, vec2, vec3 : vector;
  x : integer;
begin
// cargar arrays y cargar codigo;
end.