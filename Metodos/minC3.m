% METODO DE MINIMOS CUADRADOS DE GRADO 3
% X: vector de puntos
% Y: vector de puntos
function [] = MC3(X,Y)  
  sumX = 0;
  sumY = 0;
  sumXY = 0;
  sumX2 = 0;
  sumX3 = 0;
  sumX4 = 0;
  sumX5 = 0;
  sumX6 = 0;
  sumX2Y = 0;
  sumX3Y = 0;
  
  for i=1:length(X)
    sumX = sumX + X(i);
    sumY = sumY + Y(i);
    sumXY = sumXY + X(i)*Y(i);
    sumX2 = sumX2 + X(i)^2;    
    sumX3 = sumX3 + X(i)^3; 
    sumX4 = sumX4 + X(i)^4; 
    sumX5 = sumX5 + X(i)^5;
    sumX6 = sumX6 + X(i)^6;
    sumX2Y = sumX2Y + ((X(i)^2)*Y(i)); 
    sumX3Y = sumX3Y + ((X(i)^3)*Y(i)); 
  endfor
  
  disp('')
  sumX
  sumY
  sumXY
  sumX2
  sumX3
  sumX4
  sumX5
  sumX6
  sumX2Y
  sumX3Y
  
  disp('')
  A = [length(X),sumX,sumX2,sumX3;sumX,sumX2,sumX3,sumX4;sumX2,sumX3,sumX4,sumX5;sumX3,sumX4,sumX5,sumX6]
  B = [sumY;sumXY;sumX2Y;sumX3Y]
  
  x = inv(A)*B
  
  disp('')
  disp(['P3 = ',num2str(x(4)),'*x^3 + ',num2str(x(3)),'*x^2 + ',num2str(x(2)),'*x + ',num2str(x(1))])
endfunction