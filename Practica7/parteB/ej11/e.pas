{
  Construir un programa que implemente y use:
  a) un módulo que reciba una matriz y un valor N, y que retorne dicha matriz en la que se ha eliminado la N-ésima fila.
  b) un módulo que reciba una matriz A, un vector B y un valor N, y que inserte el vector B como columna N-ésima de la matriz A.
  Nota: realizar las validaciones correspondientes.
}

program e;
const
  maxFilas = 3;
  maxColumnas = 3;

type 
  matrizes = array [1..maxFilas, 1..maxColumnas] of integer;
  vector = array[1..(maxColumnas+5)] of integer;

procedure leerMatriz(m : matrizes);
  var
    x, y : integer;
  begin
    for x := 1 to maxColumnas do begin
      for y := 1 to maxFilas do begin
        Write(m[x,y],' ');
      end;
      WriteLn();
    end;
  end;

procedure eliminarFila (m : matrizes; var r : matrizes; cFilas,cColumnas : integer);
  var
    x,y,n : integer;
  begin
    WriteLn('ingrese numero de fila a eliminar;');
    ReadLn(n);
    if (n <= cFilas) and ( n >= 1 ) then begin
      r := m;
      for x := n to cFilas do begin
        for y := 1 to cColumnas do begin
          r[x,y] := m[x+1,y];
        end;
      end;
      cColumnas := cColumnas - 1 ;
    end else WriteLn('no hay retorno, N fuera de rango');
  end;

procedure agregarFila(m : matrizes; var r : matrizes; v : vector; dimL, cFilas : integer; var cColumnas : integer);
  var
    x,y,n : integer;
  begin
    WriteLn('ingrese numero de columna donde agregar el vector;');
    ReadLn(n);
    if (dimL = cColumnas) and (n >= 1) and (n <= cColumnas) and (cColumnas < maxColumnas) then begin
      r := m;
      for x := 1 to cFilas do begin
        for y := n to cColumnas do begin
          r[x,y+1] := m[x,y];
        end;
      end;
      for x := 1 to cColumnas do begin
        r[x,n] := v[x];
      end;
    end else WriteLn('no hay retorno, N fuera de rango o no coinciden tamaños de matriz y vector')
  end;

var 
  matriz,matrizRetorno : matrizes;
  vec : vector;
  x,y,cantFilas,cantColumnas,dimL : integer;
begin
  for x := 1 to maxFilas do for y := 1 to maxColumnas do matriz[x,y] := ( ( x - 1 ) * 3 ) + y ;
  cantFilas := maxFilas;
  cantColumnas := maxColumnas;

  dimL := 0;

  for x := 1 to (maxColumnas+3) do begin
    vec[x] := x;
    dimL := dimL + 1;
  end; 

  leerMatriz(matriz);

  eliminarFila(matriz,matrizRetorno,cantFilas,cantColumnas);
  leerMatriz(matrizRetorno);
  
  agregarFila(matriz,matrizRetorno,vec,dimL,cantFilas,cantColumnas);
  leerMatriz(matrizRetorno);
  
  dimL := 0;
  for x := 1 to (cantColumnas) do begin
    vec[x] := x;
    dimL := dimL + 1;
  end; 

  agregarFila(matriz,matrizRetorno,vec,dimL,cantFilas,cantColumnas);
  leerMatriz(matrizRetorno);
  

end.