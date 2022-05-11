program p4e7;
const 
  REPRESENTANTES = 7;
  PAISES = 20;

type
  cadena25 = string[25];
  cadena2 = string[2];
  edades = 1 .. 99;

  platoPresentar = record
    nombre : cadena25;
    temperatura : char;
    ingrediente : cadena25;
  end;

  representantePais = record
    nombre : cadena25;
    apellido : cadena25;
    pais : cadena2;
    plato : platoPresentar;
    sexo : char;
    edad : edades;
  end;

procedure ingresarRepresentante (var r : representantePais);
  procedure ingresarPlato (var p : platoPresentar);
    begin
      WriteLn('    Ingresar Plato Nombre: ');
      ReadLn(p.nombre);
      WriteLn('    Ingresar Plato Temperatura: ');
      ReadLn(p.temperatura);
      WriteLn('    Ingresar Plato Ingrediente: ');
      ReadLn(p.ingrediente);
    end;
  begin
    WriteLn('  Ingresar Nombre: ');
    ReadLn(r.nombre);
    WriteLn('  Ingresar Apellido: ');
    ReadLn(r.apellido);
    WriteLn('  Ingresar Pais: ');
    ReadLn(r.pais);
    WriteLn('  Ingresar Plato: ');
    ingresarPlato(r.plato);
    WriteLn('  Ingresar Sexo: ');
    ReadLn(r.sexo);
    WriteLn('  Ingresar Edad: ');
    ReadLn(r.edad);
  end;

var
 r, p : integer;
 representante : representantePais;
 cantFemFrios : Integer;
 edadTotal: integer;
 cantidadParticipantes: integer;
 edadPromedio : Real;
begin
  cantFemFrios := 0;
  cantidadParticipantes := PAISES * REPRESENTANTES;
  edadTotal := 0;
  ingresarRepresentante(representante);
  for p := 0 to PAISES do begin
    for r := 0 to REPRESENTANTES do begin
      if (representante.sexo = 'f') and (representante.plato.temperatura = 'f') then cantFemFrios := cantFemFrios + 1;
      edadTotal := edadTotal + representante.edad;
      if (representante.plato.temperatura = 'c') and (representante.plato.ingrediente = 'pollo') then begin
        WriteLn('');
        WriteLn('Representante con plato de pollo caliente: ');
        WriteLn('  Nombre: ', representante.nombre);
        WriteLn('  Apellido: ', representante.apellido);
        WriteLn('  Pais: ', representante.pais);
        WriteLn('');
      end;
      ingresarRepresentante(representante);
    end;
  end;
  edadPromedio := edadTotal / cantidadParticipantes;
  WriteLn('');
  WriteLn('Cantidad de platos frios cocinados por mujeres: ', cantFemFrios);
  WriteLn('Edad promedio de los participantes: ', edadPromedio);
end.
{
  La ciudad de Bariloche es centro de un Congreso Internacional de Gastronomía, al cual asisten 7 representantes de cada uno de los 20 países intervinientes. De cada uno de ellos se conoce su nombre y apellido, país al que representa, plato a presentar, sexo y edad. A la vez de cada plato se conoce el nombre, si es frío o caliente y su ingrediente principal.
  Definir la estructura de datos más adecuada para almacenar la información descripta. Realizar un programa que procese la información y:
  a) Calcule el país con mayor cantidad de participantes femeninos que presentan platos fríos.
  b) Calcule la edad promedio de los participantes.
  c) Informe el nombre y apellido y el país de los participantes que presentan plato caliente con pollo como ingrediente principal.
}