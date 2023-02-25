% POLINOMIO INTERPOLANTE DE LAGRANGE DE 4to ORDEN
function [] = LAGRANGE4(x0,y0,x1,y1,x2,y2,x3,y3)  

  A = [1,x0,x0^2,x0^3;1,x1,x1^2,x1^3;1,x2,x2^2,x2^3;1,x3,x3^2,x3^3]
  B = [y0;y1;y2;y3]
  
  X = inv(A)*B
  
  disp(['P3 = ',num2str(X(4,1)),'*x^3 + ',num2str(X(3,1)),'*x^2 + ',num2str(X(2,1)),'*x + ',num2str(X(1,1))])
  
endfunction