program p10e1;
const 
  fin = 999;
type 
  informacion = integer;

  lista = ^ nodo;
  nodo = record
    datos : informacion;
    sig: lista;
  end;

procedure agregarItemLista ( var L : lista ; dato : integer);
  var
    nuevoNodo : lista;
  begin
    new(nuevoNodo);
    nuevoNodo^.datos := dato;
    nuevoNodo^.sig := L;
    L := nuevoNodo;
  end;

procedure leerLista ( L : lista);
  var
    act : lista;
  begin
    act := L;
    Write('[');
    while (act <> Nil) do begin
      Write(' ',act^.datos,', ');
      act := act^.sig;
    end;
    Write(']');
    WriteLn(); 
  end;

procedure retornarCant3Dig(L: lista; var retorno : integer);
  function tiene3Dig(num: integer):boolean;
    var
      cantN : integer;
    begin
      cantN := 0;
      while (num <> 0) do begin
        cantN := cantN + 1;
        num := num div 10;
      end;
      tiene3Dig := cantN = 3;
    end;

  var
    act : lista;
  begin
    act := L;
    retorno := 0;
    while (act <> nil) do begin
      if (tiene3Dig(act^.datos)) then retorno := retorno + 1;
      act := act^.sig;
    end;    
  end;

procedure encontrarNumero(L: lista; numero : integer; var encontrado : boolean);
  var
    act : lista;
  begin
    encontrado := false;
    act := L;
    while ( act <> nil) and (not encontrado) do 
      if (act^.datos = numero) then encontrado := true
      else act := act^.sig;
  end;

procedure liberarEspacio(var L:lista);
  var
    act,ant : lista;
  begin
    act := L;
    while (act <> Nil) do begin
      ant := act;
      act := act^.sig;
      Dispose(ant);
    end;
    L := act;
  end;

var
  L : lista;
  entero : integer;
  cantNum3Dig: integer;
  encontrado: boolean;
begin
  L := Nil;
  leerLista(L);

  WriteLn('Numero entero distinto de 999');
  read(entero);
  while (entero <> fin) do begin
    agregarItemLista(L, entero);
    leerLista(L);
    WriteLn('Numero entero distinto de 999');
    read(entero);
  end;
  retornarCant3Dig(L, cantNum3Dig);
  WriteLn('Cantidad de numeros con 3 digitos en la lista: ', cantNum3Dig);

  WriteLn('Ingresar numero para buscar.');
  ReadLn(entero);
  encontrarNumero(L,entero,encontrado);
  if (encontrado) then WriteLn('numero encontrado')
  else WriteLn('numero no encontrado');

  liberarEspacio(L);
  leerLista(L);

end.

{
  Escribir un programa que lea una secuencia de números enteros terminada en 999 y los almacene en una lista simple. Utilizando la lista creada implementar:
  a) un módulo que reciba la lista y devuelva como resultado la cantidad de números con 3 dígitos.
  b) un módulo que reciba la lista y un número y determine si dicho número está o no en la lista. La búsqueda debe terminar al encontrar la primera ocurrencia del número buscado.
  c) Un módulo que reciba la lista y libere la memoria reservada.
}