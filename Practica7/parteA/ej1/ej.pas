program ej;
{
  un programa que implemente y use:
  a) un módulo que cargue un vector con 50 números enteros y lo retorne.
  b) un módulo que reciba el vector generado en a) y retorne el promedio de sus valores y el porcentaje de números negativos y positivos.
  c) un módulo que reciba el vector generado en a) y dos valores enteros que representan un rango de valores y que retorne la cantidad de elementos del vector que estén dentro de ese rango.
  d) un módulo que reciba el vector generado en a) y retorne los dos valores máximos entre sus elementos junto con la posición donde se encuentran.
}
const 
  MAXCANT = 20;

type
  listas = array [1..MAXCANT] of integer;

procedure cargarLista(var l : listas);
  var 
    i : integer;
  begin
    for i := 1 to MAXCANT do begin
      WriteLn('Ingresar valor para el array en la posicion: ', i);
      ReadLn(l[i]);
    end;
  end;

procedure promedioLista(var l: listas; var prom : real; var porcNeg : real; var porcPos : real);
  var
    valorTotal , cantNeg , cantPos , i : integer;
  begin
    valorTotal := 0;
    cantNeg := 0;
    cantPos := 0;
    for i := 1 to MAXCANT do begin
      valorTotal := valorTotal + l[i];
      if l[i] > 0 then begin
        cantPos := cantPos + 1;
      end else if l[i] < 0 then
        cantNeg := cantNeg + 1;
    end;

    prom := valorTotal / MAXCANT;
    porcNeg := cantNeg / MAXCANT * 100;
    porcPos := porcPos / MAXCANT * 100;

  end;

function rangoLista(l : listas; v1 , v2 : integer): integer;
  var
    i : integer;
  begin
    rangoLista := 0;
    if (v1 < v2) and (v2 < MAXCANT) and (v1 >= 1) and (v2 > v1) then begin
      for i := v1 to v2 do 
        rangoLista := rangoLista + 1;
    end;
  end;

procedure maximosLista(var l : listas; var max : integer; var pos : integer);
  var 
    i : integer;
  begin
    max := l[1];
    pos := 1;
    for i := 1 to MAXCANT do begin
      if l[i] > max then begin
        max := l[i];
        pos := i;
      end;
    end;
  end;

var 
  lista : listas;
  promedio, porcentajeNegativo, porcentajePositivo : real;
  valor1, valor2 : Integer;
  maximo, posMaximo : integer;
begin

  maximo := -1;
  posMaximo := -1;

  cargarLista(lista);
  promedioLista(lista, promedio, porcentajeNegativo, porcentajePositivo);
  WriteLn('Ingresar Valor 1 ');
  ReadLn(valor1);
  WriteLn('Ingresar Valor 2 ');
  ReadLn(valor2);
  WriteLn('Cantidad de valores entre el indice ', valor1, ' y el indice ', valor2,' del vector.');
  WriteLn(rangoLista(lista, valor1, valor2));
  maximosLista(lista, maximo, posMaximo);
  WriteLn('Valor maximo del array: ',maximo);
  WriteLn('Posicion del valor maximo en el array: ', posMaximo);

end.