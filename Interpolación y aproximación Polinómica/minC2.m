% METODO DE MINIMOS CUADRADOS DE GRADO 2
% X: vector de puntos
% Y: vector de puntos
function [] = MC2(X,Y)  
  sumX = 0;
  sumY = 0;
  sumXY = 0;
  sumX2 = 0;
  sumX3 = 0;
  sumX4 = 0;
  sumX2Y = 0;
  
  for i=1:length(X)
    sumX = sumX + X(i);
    sumY = sumY + Y(i);
    sumXY = sumXY + X(i)*Y(i);
    sumX2 = sumX2 + X(i)^2;    
    sumX3 = sumX3 + X(i)^3; 
    sumX4 = sumX4 + X(i)^4; 
    sumX2Y = sumX2Y + ((X(i)^2)*Y(i)); 
  endfor
  
  disp('')
  sumX
  sumY
  sumXY
  sumX2
  sumX3
  sumX4
  sumX2Y
  
  disp('')
  A = [length(X),sumX,sumX2;sumX,sumX2,sumX3;sumX2,sumX3,sumX4]
  B = [sumY;sumXY;sumX2Y]
  
  x = inv(A)*B
  
  disp('')
  disp(['P2 = ',num2str(x(3)),'*x^2 + ',num2str(x(2)),'*x + ',num2str(x(1))])
endfunction