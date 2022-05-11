program copia;
var 
contador, longPalabra, cantidadA: Integer;
c, ci, cf: char;
begin
  contador:= 0;
  repeat
    read(c);
  until c<> ' ';
  while (c<> '.') and (c <> '*') do
    begin
      longPalabra := 0;
      cantidadA:= 0;
      ci:=c;
      while (c<>' ')and (c<>'.') and (c<>'*') do
      begin
        cf := c;
        longPalabra := longPalabra +1;
        if (c = 'a') then cantidadA := cantidadA +1;
        read(c);
      end;
      if (ci = 's') and ( cf = 's') and (cantidadA = 2) then contador:= contador+1;
      while (c = ' ') do read(c);
    end;
    WriteLn('resultado: ', contador);
end.