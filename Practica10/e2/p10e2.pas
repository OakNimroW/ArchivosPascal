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
    nuevoNodo^.dato := n;
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
    cantNumConDigImpar := cantDig DIV 2 <> 0;
  end;

procedure ultimosNumerosPar( l : lista; var n1, n2 : integer);
  var
    act : lista;
  begin
    act : lista;
    n1 := 0;
    n2 := 0;
    while (act <> nil) do begin
      if (act^.datos DIV 2) then begin
        n2 := n1;
        n1 := act^.datos;
      end;
      act := act^.sig;
    end;
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
  read(nuevoNumero);
  mayorNumero := nuevoNumero;

  while (nuevoNumero <> fin) do begin
    
    agregarNumeroLista(listaPri, nuevoNumero);
    if (nuevoNumero > mayorNumero) then mayorNumero := nuevoNumero;

    if (cantNumConDigImpar(nuevoNumero)) then cantNumDigImpar := cantNumDigImpar + 1;

    read(nuevoNumero);
  
  end;

  ultimosNumerosPar(listaPri, numeroParUltimo, numeroParAnteUltimo);

  WriteLn('Mayor numero Leido: ', mayorNumero);
  WriteLn('Cantidad de numeros con cantidad de digitos es impar: ', cantNumDigImpar);
  WriteLn('Ultimos dos numeros pares de la lista', numeroParUltimo, ' y ', numeroParAnteUltimo);

end.

{
  Escribir un programa que lea una secuencia de números enteros y genere una lista. La lectura finaliza cuando se lee el número 0. Una vez generada la lista, informar:
  a) El mayor número leído.
  b) La cantidad de números cuya cantidad de dígitos es impar.
  c) Los 2 últimos números pares de la lista.
}