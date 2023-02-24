% METODO DE MINIMOS CUADRADOS DE GRADO 1
% X: vector de puntos
% Y: vector de puntos
function [] = MC1(X,Y)  
  sumX = 0;
  sumY = 0;
  sumXY = 0;
  sumX2 = 0;
  
  for i=1:length(X)
    sumX = sumX + X(i);
    sumY = sumY + Y(i);
    sumXY = sumXY + X(i)*Y(i);
    sumX2 = sumX2 + X(i)^2;    
  endfor
  
  disp('')
  sumX
  sumY
  sumXY
  sumX2
  
  disp('')
  m = (sumXY-((sumX*sumY)/length(X)))/(sumX2-(sumX^2/length(X)))
  
  disp('')
  b = ((sumY/length(X))-m*(sumX/length(X)))
  
  disp('')
  disp(['P1 = ',num2str(m),'*x + ',num2str(b)])
endfunction