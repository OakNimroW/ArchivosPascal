program p4e5;
type
  cadena25 = string[25];
  dias = 1 .. 31;
  meses = 1 .. 12;
  anos = 0 .. 2022;
  horas = 0 .. 23;
  minutos = 0 .. 59;

  fecha = record
    ano : anos;
    mes : meses;
    dia : dias;
  end;
  
  reloj = record
    hora : horas;
    minuto : minutos;
  end;

  paciente = record
    nombre : cadena25;
    doctor : cadena25;
    fechaAtencion : fecha;
    llegada : reloj;
    salida : reloj;
  end;

procedure ingresarPaciente(var paciente : paciente);
  
  procedure ingresarFecha(var fecha : fecha);
  begin
    Write('Ingresar dia:');
    ReadLn(fecha.dia);
    Write('Ingresar mes:');
    ReadLn(fecha.mes);
    Write('Ingresar ano:');
    ReadLn(fecha.ano);
  end;

  procedure ingresarHora(var horario : reloj);
  begin
    Write('Ingresar hora: ');
    ReadLn(horario.hora);
    Write('Ingresar minuto: ');
    ReadLn(horario.minuto);
  end;

begin
  Write('  Ingresar nombre: ');
  ReadLn(paciente.nombre);
  Write('  Ingresar doctor: ');
  ReadLn(paciente.doctor);
  WriteLn('  Ingresar fecha: ');
  ingresarFecha(paciente.fechaAtencion);
  WriteLn('  Ingresar hora llegada: ');
  ingresarHora(paciente.llegada);
  WriteLn('  Ingresar hora salida: ');
  ingresarHora(paciente.salida);
end;

procedure mayorTiempo(paciente1 : paciente ; var nombre : cadena25 ; var tiempoAtencion : reloj );
var
  nuevoTiempoAtencion : integer;
  actualTiempoAtencion : Integer;
begin
  nuevoTiempoAtencion := paciente1.salida.hora * 60 + paciente1.salida.minuto - (paciente1.llegada.hora * 60 + paciente1.llegada.minuto);
  actualTiempoAtencion := tiempoAtencion.hora * 60 + tiempoAtencion.minuto;

  if nuevoTiempoAtencion > actualTiempoAtencion then begin
    tiempoAtencion.hora := nuevoTiempoAtencion div 60;
    tiempoAtencion.minuto := nuevoTiempoAtencion mod 60;
    nombre := paciente1.nombre;
  end;
end;

var
  nuevoPaciente : paciente;
  mayorTiempoAtencion : reloj;
  nombrePacienteMayorTiempo : cadena25;
  cantidadPacientesAgosto : integer;
begin
  ingresarPaciente(nuevoPaciente);
  nombrePacienteMayorTiempo := ' -> Variable original <- ';
  cantidadPacientesAgosto := 0;
  while nuevoPaciente.fechaAtencion.ano <> 0 do begin
    WriteLn('');
    WriteLn('Nueva Iteracion.');
    WriteLn('');
    mayorTiempo(nuevoPaciente, nombrePacienteMayorTiempo, mayorTiempoAtencion);
    if nuevoPaciente.fechaAtencion.mes = 8 then cantidadPacientesAgosto := cantidadPacientesAgosto + 1;
    ingresarPaciente(nuevoPaciente);
  end;
  WriteLn('Paciente con mayor tiempo en ser atendido: ', nombrePacienteMayorTiempo);
  WriteLn('Cantidad de pacientes que asistieorn en agosto: ', cantidadPacientesAgosto);
end.