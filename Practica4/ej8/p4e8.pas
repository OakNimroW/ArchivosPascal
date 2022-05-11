program p4e8;
const 
  CORTE = 'zzz';

type 
  puntajes = 0 .. 100;
  cadena25 = String[25];
  cadena2 = String[2];
  participantes = record
    nombre : cadena25;
    continente : cadena2;
    puntaje : puntajes;
  end;

procedure ingresarParticipante (var p : participantes);
  begin
    WriteLn('Ingresar Nombre: ');
    readln(p.nombre);  
    WriteLn('Ingresar Continente: ');
    readln(p.continente);  
    WriteLn('Ingresar Puntaje: ');
    readln(p.puntaje);  
  end;

var 
  participante : participantes;
  mejorCalificacion : integer;
  participanteMejorCalificacion : participantes;
  aprobadosEU, aprobadosAS, aprobadosAM, promocionadosEU, promocionadosAS, promocionadosAM : integer;
  estudiantesEuropeos: Integer;
  puntajeEuropeos, promedioEuropeos : Real;
begin
  ingresarParticipante(participante);
  mejorCalificacion := -1;
  aprobadosEU := 0;
  aprobadosAM := 0;
  aprobadosAS := 0;
  promocionadosEU := 0;
  promocionadosAM := 0;
  promocionadosAS := 0;
  puntajeEuropeos := 0;
  promedioEuropeos := 0;
  estudiantesEuropeos := 0;

  while participante.nombre <> CORTE do begin

    if participante.puntaje > mejorCalificacion then begin
      mejorCalificacion := participante.puntaje;
      participanteMejorCalificacion := participante;
    end;

    if (participante.puntaje >= 70) and (participante.puntaje < 90) then begin
      case participante.continente of
        'eu' : aprobadosEU := aprobadosEU + 1;
        'am' : aprobadosAM := aprobadosAM + 1;
        'as' : aprobadosAS := aprobadosAS + 1;
      end;
    end else if participante.puntaje >= 90 then begin
      case participante.continente of
        'eu' : promocionadosEU := promocionadosEU + 1;
        'am' : promocionadosAM := promocionadosAM + 1;
        'as' : promocionadosAS := promocionadosAS + 1;
      end;
    end;

    if participante.continente = 'eu' then begin
      puntajeEuropeos := puntajeEuropeos + participante.puntaje;
      estudiantesEuropeos := estudiantesEuropeos + 1;
    end; 
    WriteLn('ingresar nombre dentro de while');
    ingresarParticipante(participante);
  end;
  promedioEuropeos := puntajeEuropeos / estudiantesEuropeos;
  WriteLn('El participante ', participanteMejorCalificacion.nombre, ' de ', participanteMejorCalificacion.continente, ' tiene nota de ', participanteMejorCalificacion.puntaje, ' (La mayor nota);');
  WriteLn('Aprobados EU: ', aprobadosEU);
  WriteLn('Aprobados AM: ', aprobadosAM);
  WriteLn('Aprobados AS: ', aprobadosAS);
  WriteLn('Promocionados EU: ', promocionadosEU);
  WriteLn('Promocionados AM: ', promocionadosAM);
  WriteLn('Promocionados AS: ', promocionadosAS);
  WriteLn('Puntaje promedio de los europeos: ', promedioEuropeos:2:2);
end.
{
  En la ciudad de La Plata se llevó a cabo un importante concurso de Informática, en el cual se presentaron participantes europeos, asiáticos y americanos. Una vez finalizado el concurso, se evaluaron los exámenes. De cada examen se conoce el 
  nombre de la persona que lo realizó, 
  su continente de origen y 
  puntaje (de 0 a 100). 
  Defina la estructura de datos más adecuada para almacenar la información descripta. 
  Obtener e informar:
  a) Participante que obtuvo la mejor calificación.
  b) Por cada continente, cantidad de participantes que aprobaron (a partir de 70 puntos) y cantidad que promocionaron (a partir de 90).
  c) Puntaje promedio de los europeos.
  Nota: La información de los participantes de un continente se lee en forma consecutiva. Se procesarán exámenes hasta que llegue el examen con nombre de la persona igual a ‘zzz’.
}