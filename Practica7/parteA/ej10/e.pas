{
  Se dispone de un módulo que carga un vector con a lo sumo 2000 nombres de personas, ordenadas de forma ascendente. Realice un programa que implemente módulos que reciban dicho vector y permitan:
  a) Buscar y devolver la posición en la que se encuentra una persona cuyo nombre se recibe como parámetro.
    Tener en cuenta que dicha persona puede no existir.
  b) Insertar un nombre recibido en el vector conservando su orden. Recuerde validar el espacio.
  c) Eliminar un nombre recibido del vector en caso de existir. Considere que no hay nombres repetidos.
  d) Modifique c) considerando ahora que puede haber repetidos.
}

program e;
const
  dimF = 5;
  cantNombresIniciales = 3;
type
  rango = 1 .. dimF;
  vector = array [rango] of string;


procedure escribirVector (v : vector; dimL : integer);
  var 
    i : rango;
  begin
    for i := 1 to (dimL-1) do WriteLn('Nombre numero ',i,': ', v[i]);
    WriteLn('');
  end;

procedure buscarIndiceNombre(v : vector;  dimL : integer; n : string; var exito : boolean; var pos : integer);
  var
    i : integer;
    corte : Boolean;
  begin
    i := 1;
    corte := false; 
    while ( i <= dimL) and (not corte) and (n <= v[i]) do begin
      if (v[i] = n) then begin
        WriteLn('Posicion: ',i);
        corte := true;
        pos := i
      end;
      i := i + 1;
    end; 
    if (not corte) then begin
      WriteLn('Nombre no encontrado'); 
      pos:= -1;
    end;
    exito := corte;
    WriteLn('');
  end;

procedure ingresarNombre(var v : vector; var dimL : integer; n : string; var exito : Boolean);
  var 
    i : rango;
  begin
    i := dimL;
    exito := false;
    if (dimL <= dimF) then begin
      while (n < v[i]) do begin
        v[i] := v[i-1];
        i:= i - 1;
      end; 
      v[i] := n;
      exito := true;
      dimL := dimL + 1;
    end else begin
      writeln('No hay espacio en el vector');
      exito := false;
    end;
  end;

procedure eliminarNombre(var v : vector; var dimL : integer; n : string; var exito : boolean);
  // c) Eliminar un nombre recibido del vector en caso de existir. Considere que no hay nombres repetidos.
  var
    i, pos : integer;
  begin
    buscarIndiceNombre(v,dimL, n, exito, pos);
    if (exito) then begin
        for i := pos + 1 to dimL do begin
          v[i-1] := v[i];
        end;
        dimL := dimL - 1;
    end else begin
      WriteLn('No se ha podido eliminar el nombre');
      exito := false;
    end;
  end;

procedure cargarVector (var v : vector; var dimL : integer; var exito : Boolean);
  var 
    i : rango;
    n : string;
  begin
    for i := 1 to cantNombresIniciales do begin
      write('Ingrese Nombre: ');
      ReadLn(n);
      ingresarNombre(v, dimL, n, exito);
    end;
    WriteLn('');
  end;

var
  vec1 : vector;
  dimL : integer;
  nombre : string;
  exito : Boolean;
  pos: integer;
begin
  dimL := 1;
  cargarVector(vec1, dimL, exito);
  WriteLn('');
  WriteLn('Ingresar nombre para agregar');
  ReadLn(nombre);
  ingresarNombre(vec1, dimL, nombre, exito);


  escribirVector(vec1, dimL);

  WriteLn('Ingresar nombre para buscar');
  ReadLn(nombre);
  buscarIndiceNombre(vec1,dimL,nombre,exito,pos);

  WriteLn('');
  WriteLn('Ingresar nombre para eliminar');
  ReadLn(nombre);
  eliminarNombre(vec1, dimL, nombre, exito);
  WriteLn('');


  escribirVector(vec1, dimL);
end.