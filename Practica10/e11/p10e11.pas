program p10e11;
const
  cantMaratonistas = 50;

type

  rango_segundos = 1..59;

  tiempos_min_sec = record
    minutos : integer;
    segundos : rango_segundos;
  end;

  info_maraton = record
    numero_maraton : integer;
    tiempo_maraton : tiempos_min_sec;
  end;

  lista_maratones = ^ nodo_maratones;

  nodo_maratones = record
    dato : info_maraton;
    sig : lista_maratones;
  end;

  info_maratonistas = record
    nombre : string;
    apellido : string;
    genero : string;
    tiempo : lista_maratones;
  end;

  vectorMaratonistas = array [1 .. cantMaratonistas] of info_maratonistas;

procedure borrarLista (var l : lista_maratones);
  var
    act,ant : lista_maratones;
  begin
    act := l;
    ant := nil;
    while ( act <> nil ) do begin
      ant := act;
      act := act^.sig;
      dispose(ant);
    end;
  end;

procedure limpiarEspacio(var v : vectorMaratonistas);
  var 
    i : integer;
  begin
    for i := 1 to cantMaratonistas do borrarLista(v[i].tiempo);
  end;


procedure agregarLista (var l : lista_maratones; d : info_maraton);
  var
    nue : lista_maratones;
  begin
    new(nue);
    nue^.dato := d;
    nue^.sig := l;
    l := nue;
  end;

procedure cargarMaratonista (var m : info_maratonistas);
  var
    datos_maraton : info_maraton;
  begin
    WriteLn('  Ingresar Nombre:');
    ReadLn(m.nombre);
    WriteLn('  Ingresar Apellido:');
    ReadLn(m.apellido);
    WriteLn('  Ingresar Genero:');
    ReadLn(m.genero);

    WriteLn('  Ingresar Numero Maraton: ( Corte => -1 )');
    ReadLn(datos_maraton.numero_maraton);
    while (datos_maraton.numero_maraton <> -1) do begin
      WriteLn('  Ingresar Minutos de maraton numero ', m.tiempo^.dato.numero_maraton, ': ');
      ReadLn(datos_maraton.tiempo_maraton.minutos);
      WriteLn('  Ingresar Segundos de maraton numero ', m.tiempo^.dato.numero_maraton, ': ');
      ReadLn(datos_maraton.tiempo_maraton.segundos);
      agregarLista(m.tiempo, datos_maraton);
      WriteLn('  Ingresar Numero Maraton: ( Corte => -1 )');
      ReadLn(datos_maraton.numero_maraton);
    end;
  end;


procedure cargarInformacion (var v : vectorMaratonistas);
  var
    i : integer;
  begin
    write('cargar Informacion de Maratonistas');
    for i := 1 to cantMaratonistas do cargarMaratonista(v[i])
  end;

procedure mejoresTiempos(v : vectorMaratonistas);
  var
   i: integer;
   act : lista_maratones;
   mayor_tiempo, actual_tiempo : integer;

  begin
    for i := 1 to cantMaratonistas do begin
      act := v[i].tiempo;
      mayor_tiempo := 0;
      while (act <> nil) do begin
        actual_tiempo := act^.dato.tiempo_maraton.minutos * 60 + act^.dato.tiempo_maraton.segundos;
        if (actual_tiempo > mayor_tiempo) then mayor_tiempo := actual_tiempo;
        act := act^.sig;
      end;
      WriteLn('Mayor tiempo maratonista ', i, ': ', mayor_tiempo DIV 60, ':', mayor_tiempo MOD 60);
    end;
  end;

procedure promediosTiempos(v : vectorMaratonistas);
  var
    i : integer;
    act : lista_maratones;
    cantMaratones, tiempoTotal : integer;
  begin
    for i := 1 to cantMaratonistas do begin
      cantMaratones := 0;
      tiempoTotal := 0;
      act := v[i].tiempo;
      while (act <> nil) do begin
        tiempoTotal := tiempoTotal + act^.dato.tiempo_maraton.minutos * 60 + act^.dato.tiempo_maraton.segundos;
        cantMaratones := cantMaratones + 1;
        act := act^.sig;
      end;
      Write('Tiempo promedio del maratonista numero ',i,' es: ', tiempoTotal/cantMaratones);
    end;
  end;

var
  vecMaratonistas : vectorMaratonistas;

begin
  cargarInformacion(vecMaratonistas);
  mejoresTiempos(vecMaratonistas);
  promediosTiempos(vecMaratonistas);
  limpiarEspacio(vecMaratonistas);
end.

{
  Un deportólogo está realizando una investigación sobre el rendimiento de los maratonistas.
  - Se seleccionan 50 maratonistas para ser estudiados.
  - De cada uno se conoce el nombre, apellido, género, y el tiempo (minutos y segundos) registrado en cada maratón que ha corrido.

  El deportólogo necesita un programa para:
  a) Cargar la información de los 50 maratonistas. Para esto puede seleccionar el criterio que desee para cargar el tiempo de las maratones.
  b) Informar para cada maratonista, la maratón con el mejor tiempo de desempeño.
  c) Calcular el promedio de tiempo de cada maratonista.
}
