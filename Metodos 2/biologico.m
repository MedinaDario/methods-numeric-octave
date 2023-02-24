% SISTEMA DINAMICO BIOLOGICO
% r: Tasa de interaccion: naciemientos/muertes
% a: Coeficiente de crecimiento de presas
% S: Coeficiente de relacion de presa/depredador
% b: Coeficiente de crecimiento de depredadores
% x0: Poblacion inicial de presas
% y0: Poblacion inicial de depredador
% t: Tiempo de simulacion
% h: Tamaño de paso
function BIOLOGICO(r,a,S,b,x0,y0,t,h)
     T = [0];
     P = [x0];
     D = [y0];     
     
    function [eval] = f(t,x,y)
        eval = r*x-a*x*y;
    endfunction
    
    function [eval] = g(t,x,y)
        eval = -S*y+b*x*y;
    endfunction
    
    tf = t / h;
    t = h;
    xi = x0;
    yi = y0;
    
    Pmax = 0;
    Pmin = 999999;
    Dmax = 0;
    Dmin = 999999;
    
    while(t<=tf)   
      k1 = h * f(t,xi,yi);
      l1 = h * g(t,xi,yi);
      k2 = h * f(t+h/2,xi+k1/2,yi+l1/2);
      l2 = h * g(t+h/2,xi+k1/2,yi+l1/2);
      k3 = h * f(t+h/2,xi+k2/2,yi+l2/2);
      l3 = h * g(t+h/2,xi+k2/2,yi+l2/2);
      k4 = h * f(t+h,xi+k3,yi+l3);
      l4 = h * g(t+h,xi+k3,yi+l3);     
      
      xi = xi + (k1+2*k2+2*k3+k4)/6;
      yi = yi + (l1+2*l2+2*l3+l4)/6;
      
      T = [T, t];
      P = [P, xi];
      D = [D, yi]; 
      
      if(xi > Pmax)
          Pmax = xi;
      endif
    
      if(xi < Pmin)
        Pmin = xi;
      endif
    
      if(yi > Dmax)
        Dmax = yi;
      endif
    
      if(yi < Dmin)
        Dmin = yi;
      endif 
      
      t = t+h;
    endwhile
  
    disp(['PRESA_MAX = ',num2str(Pmax),'; PRESA_MIN = ',num2str(Pmin),'; DEPREDADOR_MAX = ',num2str(Dmax),'; DEPREDADOR_MIN = ',num2str(Dmin)]);
    hold on;
    plot(T,P);
    plot(T,D);
    hold off;  
endfunction
