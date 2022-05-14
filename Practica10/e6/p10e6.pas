program p10e6;
const
  cantidadCajas = 6;

type  
  numero_cajas = 1 .. cantidadCajas;

  tickets = record
    numero_caja : numero_cajas;
    numero_tickets : integer;
    monto: integer; // deberia ser real, pero me es mas comodo en intetger
  end;

  lista_tickets = ^ nodo_tickets;

  nodo_tickets = record
    datos : tickets;
    sig : lista_tickets;
  end;

procedure agregarItemLista(var l : lista_tickets; t : tickets);
  var
    nue : lista_tickets;
  begin
    new(nue);
    nue^.datos := t;
    nue^.sig := l;
    l := nue;
  end;

procedure generarNuevaLista(l1 : lista_tickets; var l2: lista_tickets);
  var
    act : lista_tickets;
  begin
    act := l1;
    while (act <> nil) do begin 
      if (act^.datos.monto < 1000) then agregarItemLista(l2, act^.datos);
      act := act^.sig;
    end; 
  end;

procedure calcularMontoPromedio(l : lista_tickets);
  var
    act : lista_tickets;
    monto_total : real;
  begin
    act := l;
    monto_total := 0;
    while (act <> nil) do begin
      monto_total := monto_total + 1;
      act := act^.sig;
    end;
    writeln('el monto promedio de todas las cajas es de ', monto_total / cantidadCajas);
  end;

procedure calcularRecaudacionEspecial(l : lista_tickets; var l2 : lista_tickets);
  var
    act : lista_tickets;
  begin
    act := l;
    while ( act <> nil ) do begin
      if ( act^.datos.monto * act^.datos.numero_tickets > 12000 ) and (act^.datos.numero_tickets < 100) then writeln(' la caja ',act^.datos.numero_caja,' recaudo mas de 12000$ con menos de 100 tickets');
      act := act^.sig;
    end;

    act := l;
    while ( act <> nil ) do begin
      if ( act^.datos.monto * act^.datos.numero_tickets > 12000 ) and (act^.datos.numero_tickets < 100) then agregarItemLista(l2,act^.datos);
      act := act^.sig;
    end;
  end;

var
  lista_origen, lista_menoresMontos, lista_montoTickets : lista_tickets;

begin
  
  lista_origen := nil; 
  lista_menoresMontos := nil; 
  lista_montoTickets := nil;
  
  cargarLista(lista_origen);

  generarNuevaLista(lista_origen, lista_menoresMontos);
  calcularMontoPromedio(lista_origen);
  calcularRecaudacionEspecial(lista_origen, lista_montoTickets);

end.

{
  Un cine dispone de una lista con la información de los tickets del día (Nro. Caja, nro ticket, monto) correspondientes a sus 6 cajas. Escribir un programa que procese dicha lista y permita:
  a) Genere una nueva lista con los tickets con montos menores a $1000.
  b) Calcular e informar el monto promedio recaudado por caja.
  c) Calcular que cajas que recaudaron más de $12000 con menos de 100 tickets. Luego vuelva a recorrer la lista para generar una nueva con los tickets pertenecientes a las cajas que cumplan dicha condición. Recuerde usar un conjunto para mejorar la eficiencia.
}
