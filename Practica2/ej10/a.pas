program a; {completar b, y c. usar variable texto, anterior y segundo anterior para confirmar los filtros}
{
  escriba un programa que lea una secuencia de caracteres terminada en # 
  contar la cantidad de palabras de longitud 6 que componen esa secuencia
  idem a pero ademas contando la cantidad de palabras que comienzan con P seguido de A
  Idem a y b pero ademas contando la cantidad de palabras que  finalizan con S seguido de A.
}

var
cantLetras, cantPalabras6: Integer;
text, anterior: char;
begin
cantPalabras6 := 0;
cantLetras := 0;
text := ' ';
anterior := ' ';
  repeat
    read(text);

    {Ejercicio a}  
    if text <> ' ' then begin
      cantLetras := cantLetras + 1;
    end 
    else 
    if anterior <> ' ' then begin
      if cantLetras = 6 then cantPalabras6 := cantPalabras6 + 1;
    end;
    
    if text = ' ' then cantLetras:= 0;
    
    anterior := text;
  
  until text = '#';

  WriteLn('cantidad de palabras con longitud de 6 caracteres: ', cantPalabras6);

end.