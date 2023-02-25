% POLINOMIO INTERPOLANTE DE LAGRANGE DE 2do ORDEN
function [] = LAGRANGE2(x0,y0,x1,y1)  

  disp(['P1 = ',num2str(y0),'+ ( (',num2str(y1),'-',num2str(y0),') / (',num2str(x1),'-',num2str(x0),') ) * ( x - ',num2str(x0),')'])
  disp(['P1 = ',num2str((y1-y0)/(x1-x0)),'*x + ',num2str((((y1-y0)/(x1-x0))*(-x0))+y0)])
  
endfunction