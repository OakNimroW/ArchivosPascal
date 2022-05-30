program p11e6; // 3 35 ; 3 55
const
    corte = 'zzz';
    cant_cursos = 10;

type

    subrango_cursos = 1 .. cant_cursos;

    info_inscrito = record
        dni : integer;
        apellido : string;
        nombre : string;
        edad : integer;
        curso : subrango_cursos;
    end;

    info_curso = record
        capacidad_maxima : integer;
        cantidad_inscritos : integer;
    end;

    vector_cursos = array [ 1 .. cant_cursos ] of info_curso;

procedure leerCurso (var c : info_curso);
    begin
        Read(c.capacidad_maxima);
        c.cantidad_inscritos := 0;
    end;

procedure cargarInformacionCursos (var v : vector_cursos);
    var 
        i : integer;
    begin
      for i := 0 to cant_cursos do leerCurso(v[i]);
    end;

procedure leerInscrito (var i : info_inscrito);
    begin
        read(i.apellido);
        if (i.apellido <> corte) then begin
          read(i.dni);
          read(i.nombre);
          read(i.edad);
          read(i.curso);
        end;
    end;

procedure inscribirAlumno (var v : vector_cursos; i : info_inscrito; var cant_inscritos_treinta_anos : Integer);
    begin
      if (v[i.curso].capacidad_maxima > v[i.curso].cantidad_inscritos) then v[i.curso].cantidad_inscritos := v[i.curso].cantidad_inscritos + 1
      else WriteLn('No se ha podido inscribir ya que el curso: ', i.curso ,' ya ha sido completado.'); 
      if (i.curso = 2) then if (i.edad >= 30) and ( i.edad <= 35) then cant_inscritos_treinta_anos := cant_inscritos_treinta_anos + 1;
    end;

procedure informarCursosNoCompletos (v : vector_cursos);
    var
        i : integer;
    begin
        for i := 0 to cant_cursos do if (v[i].capacidad_maxima > v[i].cantidad_inscritos) then WriteLn('El curso: ', i,' no ha sido completado');
    end;

var
    inscrito : info_inscrito;
    vector : vector_cursos;
    cant_inscritos_adultos: Integer;
begin
    cant_inscritos_adultos := 0;
    cargarInformacionCursos(vector);
    leerInscrito(inscrito);
    while (inscrito.apellido <> corte) do begin
      inscribirAlumno(vector, inscrito, cant_inscritos_adultos);
      leerInscrito(inscrito);
    end;
    informarCursosNoCompletos(vector);
    Write(cant_inscritos_adultos);
end.