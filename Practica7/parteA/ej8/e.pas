{
  Implementar 2 versiones de un módulo que cuente la cantidad de palabras que hay en un arreglo de caracteres con un máximo de 150 caracteres:
  a) Implementar una versión del módulo que tenga en cuenta una dimensión lógica para indicar la posición del último carácter.
  b) Implementar una versión del módulo que asuma que el último carácter es punto.
  Nota: en ambos casos, por seguridad, realice las verificaciones para no pasarse de la longitud máxima.
}

program e;

const
  dimF = 150;

type
  rango = 1 .. dimF;
  vector = array [rango] of char;

procedure moduloDimL (v : vector; dimL : integer; var cantPalabras: integer; var ultChar : integer);
  var
    i : rango;
  begin
    cantPalabras := 0;
    for i := 1 to dimL do begin
      if (v[i] <> '') and (v[i] = ' ') and (v[i-1] <> ' ') and (i <= dimF) then begin
        cantPalabras := cantPalabras + 1;
        ultChar := i - 1;
      end;  
    end;
  end;

procedure moduloPunto (v : vector; var cantPalabras : integer);
  var 
    i : rango;
  begin
    cantPalabras := 0;
    i := 1;
    while (i <= dimF) and (v[i] <> '.') and (v[i] <> '') do begin
      if (v[i] = ' ') and (v[i-1] <> ' ') then cantPalabras := cantPalabras + 1;
    end;
  end;

begin  
end.