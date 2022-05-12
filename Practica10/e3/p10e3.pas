program p10e3;

const
  corte = 'fin';

type

  lugarTuristico = record
    nombre : string;
    pais : string;
  end;

  listaTuristicos = ^ nodoTuristicos;
  nodoTuristicos = record 
    datos : lugarTuristico;
    sig : listaTuristicos;
  end;


  nombresTuristicos = string;

  listaNombresTuristicos = ^ nodoNombresTuristicos;
  nodoNombresTuristicos = record
    datos : nombresTuristicos;
    sig : listaNombresTuristicos;
  end;

procedure cargarListaTuristicos(var l : listaTuristicos; pais : string);
  var
    nuevoNodo : listaTuristicos;
  begin
    new(nuevoNodo);
    nuevoNodo^.datos.pais := pais;
    Write('ingresar nombre lugar turistico: ');
    ReadLn(nuevoNodo^.datos.nombre);
    nuevoNodo^.sig := l;
    l := nuevoNodo;
  end;

procedure obtenerLongitudLista(l : listaTuristicos ; var longitud : integer);
  var
    act : listaTuristicos;
  begin
    act := l;
    longitud := 0;
    while (act <> nil) do begin
      longitud := longitud + 1;
      act := act^.sig;
    end;
  end;

procedure obtenerCantAparicionPais(l : listaTuristicos; pais : string; var cantApariciones : integer);
  var
    act : listaTuristicos;
  begin
    act := l;
    cantApariciones := 0;
    while (act <> nil) do begin
      if (act^.datos.pais = pais) then cantApariciones := cantApariciones + 1;
      act := act^.sig;
    end;
  end;
  
procedure cargarListaLug(var l : listaNombresTuristicos; n : string);
  var
    nuevoNodo : listaNombresTuristicos;
    ultimoNodo : listaNombresTuristicos;
  begin
    New(nuevoNodo);
    nuevoNodo^.datos := n;
    nuevoNodo^.sig := nil;
    if (l = nil) then l := nuevoNodo
    else begin
      ultimoNodo := l;
      while (ultimoNodo <> nil) do ultimoNodo := ultimoNodo^.sig;
      ultimoNodo^.sig := nuevoNodo;
    end;

  end;

procedure generarListaLugaresPais(lTur : listaTuristicos; pais : string; var lLug : listaNombresTuristicos);
  var
    actTur : listaTuristicos;
  begin
    actTur := lTur;
    while (actTur <> nil) do begin
      if (actTur^.datos.pais = pais) then cargarListaLug(lLug,actTur^.datos.nombre);
      actTur := actTur^.sig;
    end;
  end;

procedure vaciarListaTur(var l : listaTuristicos);
  var
    act, ant : listaTuristicos;
  begin
    act := l;
    ant := l;
    while (act <> nil) do begin
      ant := act;
      act := act^.sig;
      Dispose(ant);
    end;
    l := act;
  end;

procedure vaciarListaLug(var l : listaNombresTuristicos);
  var
    act, ant : listaNombresTuristicos;
  begin
    act := l;
    ant := l;
    while (act <> nil) do begin
      ant := act;
      act := act^.sig;
      Dispose(ant);
    end;
    l := act;
  end;

var
  listaTur : listaTuristicos;
  listaLug : listaNombresTuristicos;
  longitudListaTur : integer;
  cantAparicionesPais : integer;
  nombrePais : string;
  nombreLugarTuristico : string;

begin
  listaTur := nil;
  listaLug := nil;
  
  cantAparicionesPais := 0;
  
  WriteLn('Ingresar nombre de Pais, ingrese ', corte ,' para finalizar la carga');
  ReadLn(nombrePais);
  while (nombrePais <> corte) do begin
    cargarListaTuristicos(listaTur,nombrePais);
    WriteLn('Ingresar nombre de Pais, ingrese ', corte ,' para finalizar la carga');
    ReadLn(nombrePais);
  end;

  obtenerLongitudLista(listaTur,longitudListaTur);
  WriteLn('longitud de la lista de lugares turisticos: ', longitudListaTur);

  WriteLn('Ingresar nombre de pais para buscar cantidad aparicion');
  read(nombrePais);
  obtenerCantAparicionPais(listaTur,nombrePais,cantAparicionesPais);
  WriteLn('cantidad de veces que aparece ', nombrePais, ' en la lista es de: ', cantAparicionesPais);

  WriteLn('Ingresar nombre de pais para crear nueva lista');
  read(nombrePais);
  generarListaLugaresPais(listaTur, nombrePais, listaLug);

  WriteLn('ingresar nombre de lugar turistico en el pais ', nombrePais);
  ReadLn(nombreLugarTuristico);
  cargarListaLug(listaLug, nombreLugarTuristico);

  vaciarListaTur(listaTur);
  vaciarListaLug(listaLug);

end.

{
  Dada una lista de lugares turísticos identificados por nombre y país, definir una estructura de datos para almacenarlos y escribir un programa que implemente los siguientes módulos:
  a) Calcular la longitud de la lista.
  b) Calcular la cantidad de veces que aparece un país dado (un país puede aparecer más de una vez, ya que puede haber diferentes lugares turísticos).
  c) Dado un país, si existe, generar una nueva lista con los nombres de sus lugares turísticos.
  d) Agregar al final de la lista creada en c) un nuevo lugar turístico.
}
