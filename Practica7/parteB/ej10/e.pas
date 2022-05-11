{
  Se desea programar un juego similar a la batalla naval. En dicho juego participan 2 jugadores, cada uno posee 5 barcos simples (de un casillero) ubicados en un tablero de 10x10. El juego consiste en tratar de descubrir en qué posiciones están los barcos del contrincante. Los jugadores dan alternadamente una posición del adversario y éste responde agua o hundido. Informar el nombre del ganador.
}
program e;
const
  tamanoTablero = 10;
  maxBarcos = 2;
type
  rango = 1..tamanoTablero;
  
  posiciones = array [1..2] of rango;
  posicionesBarcos = array[1..maxBarcos] of posiciones;
  
  jugadores = record
    nombre : string;
    barcos : posicionesBarcos;
  end;

  tableroBase = array [1..tamanoTablero,1..tamanoTablero] of Boolean;

procedure limpiarTableros(var t1,t2 : tableroBase);
  var
    x, y : integer;
  begin
    for x := 1 to tamanoTablero do begin
      for y := 1 to tamanoTablero do begin
        t1[x,y] := False;
        t2[x,y] := False;
      end;
    end;  
  end;

function dentroRango(x, y : integer):Boolean;
  begin
    dentroRango := ( x <= tamanoTablero ) and ( y <= tamanoTablero ) and ( x >= 1 ) and ( y >= 1);
  end;

procedure posicionarBarcos(var t : tableroBase; var c : integer; j : string);
  var
    x,y : integer;
  begin
    c := 0;
    while ( c < maxBarcos ) do begin
      WriteLn('ingrese posicion "x y" de barco, ', j);
      Read(x);
      Read(y);
      if dentroRango(x,y) and ( not t[x,y] ) then begin
        t[x,y] := True;
        c := c + 1;
      end else WriteLn('Posicion ocupada o fuera de rango;');
    end;
  end;


procedure ataqueBarco (var t : tableroBase;var c : integer; j : String);
  var
    x,y : integer;
  begin
    WriteLn(j,' Ingresa posicion de ataque "x,y".');
    read(x);
    read(y);
    if dentroRango(x,y) then begin
      if t[x,y] then begin
        c := c - 1;
        t[x,y] := false;
        WriteLn('hundido');
      end else WriteLn('agua');
    end else WriteLn('posicion fura de ragno, pierde turno bor bobi');    
  end;

var
  jugador1, jugador2 : string;
  tablero1, tablero2 : tableroBase;
  cantBarcos1,cantBarcos2 : integer;

begin
  limpiarTableros(tablero1,tablero2);

  WriteLn('Ingresar nombre jugador1');
  readln(jugador1);
  WriteLn();
  WriteLn('Ingresar nombre jugador2');
  readln(jugador2);
  WriteLn();

  posicionarBarcos(tablero1,cantBarcos1,jugador1);
  posicionarBarcos(tablero2,cantBarcos2,jugador2);

  while ( cantBarcos1 > 0 ) and ( cantBarcos2 > 0 ) do begin
    ataqueBarco(tablero2,cantBarcos2,jugador1);
    ataqueBarco(tablero1,cantBarcos1,jugador2);
  end;

  WriteLn('Juego finalizado.');
  Write('Ganador: ');
  if ( cantBarcos1 > cantBarcos2 ) then Write(jugador1)
  else Write(jugador2);

end.