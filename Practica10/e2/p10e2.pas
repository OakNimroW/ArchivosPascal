program p10e2;
const
  fin = 0;

type
  dato = integer;

  lista = ^ nodo;
  nodo = record
    datos : dato;
    sig : lista;
  end;

procedure agregarNumeroLista( var l : lista; n : integer);
  var
    nuevoNodo : lista;
  begin
    New(nuevoNodo);
    nuevoNodo^.datos := n;
    nuevoNodo^.sig := l;
    l := nuevoNodo;
  end;

function cantNumConDigImpar(n : integer): boolean;
  var
    cantDig : integer;
  begin
    cantDig := 0;
    while (n <> 0) do begin
      cantDig := cantDig + 1;
      n := n DIV 10;
    end;
    cantNumConDigImpar := cantDig MOD 2 <> 0;
  end;

procedure ultimosNumerosPar( l : lista; var ultimoNumero , prevUltimoNumero : integer);
  var
    act : lista;
  begin
    act := l;
    ultimoNumero  := 0;
    prevUltimoNumero := 0;
    while (act <> nil) do begin
      if (act^.datos MOD 2 = 0) then begin
        ultimoNumero  := prevUltimoNumero;
        prevUltimoNumero := act^.datos;
      end;
      act := act^.sig;
    end;
  end;

procedure borrarEspacioLista( var l : lista);
  var
    act, ant : lista;
  begin
    act := l;
    while (act <> nil) do begin
      ant := act;
      act := act^.sig;
      Dispose(ant);
    end;
    l := act;
  end;
 

var
  listaPri : lista;
  nuevoNumero : integer;
  mayorNumero : integer;
  cantNumDigImpar : integer;
  numeroParUltimo : integer;
  numeroParAnteUltimo : integer;

begin
  
  listaPri := nil;
  
  cantNumDigImpar := 0;
  WriteLn('ingresar numero para la lista');
  read(nuevoNumero);
  mayorNumero := nuevoNumero;

  while (nuevoNumero <> fin) do begin
    
    agregarNumeroLista(listaPri, nuevoNumero);
    if (nuevoNumero > mayorNumero) then mayorNumero := nuevoNumero;

    if (cantNumConDigImpar(nuevoNumero)) then cantNumDigImpar := cantNumDigImpar + 1;

    WriteLn('ingresar numero para la lista');
    read(nuevoNumero);
  
  end;

  ultimosNumerosPar(listaPri, numeroParUltimo, numeroParAnteUltimo);

  WriteLn('Mayor numero Leido: ', mayorNumero);
  WriteLn('Cantidad de numeros con cantidad de digitos es impar: ', cantNumDigImpar);
  WriteLn('Ultimos dos numeros pares de la lista ', numeroParUltimo, ' y ', numeroParAnteUltimo);

  borrarEspacioLista(listaPri);

end.

{
  Escribir un programa que lea una secuencia de n??meros enteros y genere una lista. La lectura finaliza cuando se lee el n??mero 0. Una vez generada la lista, informar:
  a) El mayor n??mero le??do.
  b) La cantidad de n??meros cuya cantidad de d??gitos es impar.
  c) Los 2 ??ltimos n??meros pares de la lista.
}
