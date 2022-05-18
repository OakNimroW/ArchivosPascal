program ejExtra;
const
  minimo_promedio = 6;
  minimo_materias = 5;

type
  cant_materias = 1..20;
  info_alumno = record 
    nombre : string;
    legajo : string;
    cant_aprobadas : cant_materias;
    nota_promedio : real;
  end;

  lista_alumnos = ^ nodo_alumnos;

  nodo_alumnos = record
    datos : info_alumno;
    sig : lista_alumnos;
  end;

procedure leerLista ( L : lista_alumnos);
  var
    act : lista_alumnos;
  begin
    act := L;
    WriteLn('[');
    while (act <> Nil) do begin
      Write(' ',act^.datos.nombre,' | ');
      Write(' ',act^.datos.legajo,' | ');
      Write(' ',act^.datos.cant_aprobadas,' | ');
      WriteLn(' ',act^.datos.nota_promedio :2:2,' , ');
      act := act^.sig;
    end;
    WriteLn('nil ]');
    WriteLn(); 
  end;

procedure eliminarLista ( var l : lista_alumnos ) ;
  var
    ant, act : lista_alumnos;
  begin
    act := l;
    ant := nil;
    while ( act <> nil ) do begin
      ant := act;
      act := act^.sig;
      dispose(ant);
    end;
    l := act;
  end;

procedure leerAlumno ( var a : info_alumno ) ;
  begin
    writeLn('Ingresar Nombre: ');
    readLn(a.nombre);
    if (a.nombre <> 'corte') then begin
      writeLn('Ingresar legajo: ');
      readLn(a.legajo);
      writeLn('Ingresar Materias Aprobadas: ');
      readLn(a.cant_aprobadas);
      writeLn('Ingresar Nota Promedio: ');
      readLn(a.nota_promedio);
    end;
  end;

procedure agregarListaOrdenada ( var l : lista_alumnos ; a : info_alumno ) ;
  var
    ant, act, nue : lista_alumnos;
  begin
    new(nue);
    nue^.datos := a;
    nue^.sig := nil;
    if ( l = nil ) then l := nue
    else begin
      ant := l;
      act := l;
      while ( act <> nil ) and ( nue^.datos.nombre > act^.datos.nombre ) do begin
        ant := act;
        act := act^.sig;
      end; 
      nue^.sig := act;
      if (ant <> act) then ant^.sig := nue
      else l := nue;
    end;
  end;

procedure filtrarLista ( var l : lista_alumnos ) ;
  var
    ant, act, aux : lista_alumnos;
  begin
    while (l^.datos.nota_promedio <= minimo_promedio) or (l^.datos.cant_aprobadas < minimo_materias) do begin
      aux := l;
      l := l^.sig;
      writeLn('Nodo Borrado');
      dispose(aux);
    end;
    writeLn('Nodos iniciales Borrados');
    act := l;
    ant := nil;
    while ( act <> nil ) do begin
      ant := act;
      act := ant^.sig;
      if (act^.datos.nota_promedio <= minimo_promedio) or (act^.datos.cant_aprobadas < minimo_materias) then begin
        aux := act;
        ant^.sig := act^.sig;
        act := ant^.sig;
        writeLn('Nodo Borrado');
        dispose(aux);
      end;
    end;
  end;

var
  alumno : info_alumno;
  lista : lista_alumnos;
begin
  lista := nil;
  leerLista(lista);
  leerAlumno(alumno);
  while (alumno.nombre <> 'corte') do begin
    agregarListaOrdenada(lista,alumno);
    leerLista(lista);
    leerAlumno(alumno);
  end;

  writeLn('Lista Completa: ');
  leerLista(lista);
  
  writeLn('Lista Filtrada: ');
  filtrarLista(lista);
  leerLista(lista);

  writeLn('Lista Borrada');
  eliminarLista(lista);
  leerLista(lista);
end.
