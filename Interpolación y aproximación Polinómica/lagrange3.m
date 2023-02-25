% POLINOMIO INTERPOLANTE DE LAGRANGE DE 3er ORDEN
function [] = LAGRANGE3(x0,y0,x1,y1,x2,y2)  

  A = [1,x0,x0^2;1,x1,x1^2;1,x2,x2^2]
  B = [y0;y1;y2]
  
  X = inv(A)*B
  
  disp(['P2 = ',num2str(X(3,1)),'*x^2 + ',num2str(X(2,1)),'*x + ',num2str(X(1,1))])
  
endfunction