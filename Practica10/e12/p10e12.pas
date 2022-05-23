program p10e12;

type
  lista = ^ nodo;
  nodo = record
    dato : integer;
    sig : lista;
  end;


procedure agregarOrdenado (var l : lista; d : integer);
  var
    act,ant,nue : lista;
  begin
    new(nue);
    nue^.dato := d;
    nue^.sig := nil;
    act := l;
    ant := l;
    while(act <> nil) and (act^.dato > d) do begin
      ant := act;
      act := act^.sig;
    end;
    nue^.sig := act;
    if (l = nil) then l := nue
    else ant^.sig := nue; 
    
  end;

procedure unirListas (A,B : lista; var C: lista);
  var
    actA, actB : lista;
  begin
    actA := A;
    actB := B;
    while (actA <> nil) do begin
      agregarOrdenado(C,actA^.dato);
      actA := actA^.sig;
    end;
    while (actB <> nil) do begin
      agregarOrdenado(C,actB^.dato);
      actB := actB^.sig;
    end;
  end;

procedure expandirLista (var A : lista ; B : lista);
  var
    actB : lista;
  begin
    actB := B;
    while (actB <> nil) do begin
      agregarOrdenado(A,actB^.dato);
      actB := actB^.sig;
    end;
  end;

procedure purgarNumero (var A : lista; n : integer);
  var
    act, ant : lista;
  begin
    act := A;
    ant := nil;
    while ( act <> nil ) and ( act^.dato < n) do begin
      ant := act;
      act := act^.sig;
    end;
    while ( act <> nil ) and ( act^.dato = n) do begin
      ant := act;
      act := act^.sig;
      dispose(ant);
    end;
  end;
begin
  
end.

{
  Realice dos módulos que reciban dos listas ordenadas de enteros A y B y devuelvan:
  a) En el primer módulo: otra lista C ordenada que sea la resultante de unir las dos listas recibidas.
  b) En el segundo módulo: la lista A donde se inserten los elementos de la lista B, y la lista A continúa ordenada.
  Realice además un tercer módulo que reciba la lista A, y un número entero, y se eliminen todas las ocurrencias de ese número de la lista.
}
