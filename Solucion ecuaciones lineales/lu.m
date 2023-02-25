% METODO DE FACTORIZACION L-U
% A: matriz de coeficientes
% B: vector de terminos independientes
function [] = LU(A,B)
  
  [L,U] = lu(A)
  
  disp('L*D=B')
  D = inv(L)*B
  
  disp('U*X=D')
  X = inv(U)*D
  
endfunction
