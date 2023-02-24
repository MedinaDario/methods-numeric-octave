% SISTEMA DINAMICO MECANICO
% a: Fuerza de resorte
% b: Fuerza de amortiguador
% P: Peso de la masa
% G: Fuerza gravitatoria (9.8)
% x01: Distancia inicial (0)
% x02: Velocidad inicial (0)
% t: Tiempo de simulacion
% h: Tamaño de paso
function MECANICO(a,b,P,G,x01,x02,t,h)
     
     T = [0];
     D = [x01];     #Distancia
     V = [x02];     #Velocidad
 
    ######U(t) A MODIFICAR#######
    function [eval] = U(t)
        if(t<1)
          eval = 10;
        else
          eval = 0;
        endif
    endfunction  
 
    function [eval] = f(t,x1,x2)        
        eval = x2;
    endfunction  
    
    function [eval] = g(t,x1,x2)        
        eval = (((U(t)*G)/P)-(((b*G)/P)*x2)-(((a*G)/P)*x1));
    endfunction 
        
    tf = t;
    t = h;
    x1i = x01;
    x2i = x02;   
    
    Dmax = -999999;
    Dmin = 999999;
    Vmax = -999999;
    Vmin = 999999;
    
    TDmax = 0;
    TDmin = 0;
    TVmax = 0;
    TVmin = 0;
    
    while(t<=tf)   
      k1 = h * f(t,x1i,x2i);
      l1 = h * g(t,x1i,x2i);
      k2 = h * f(t+h/2,x1i+k1/2,x2i+l1/2);
      l2 = h * g(t+h/2,x1i+k1/2,x2i+l1/2);
      k3 = h * f(t+h/2,x1i+k2/2,x2i+l2/2);
      l3 = h * g(t+h/2,x1i+k2/2,x2i+l2/2);
      k4 = h * f(t+h,x1i+k3,x2i+l3);
      l4 = h * g(t+h,x1i+k3,x2i+l3);     
      
      x1i = x1i + (k1+2*k2+2*k3+k4)/6;
      x2i = x2i + (l1+2*l2+2*l3+l4)/6;
      
      T = [T, t];
      D = [D, x1i];
      V = [V, x2i];       
      
      t
      x1i
      x2i
      
      if(x1i > Dmax)
        Dmax = x1i;
        TDmax = t;
      endif
    
      if(x1i < Dmin)
        Dmin = x1i;
        TDmin = t;
      endif
    
      if(x2i > Vmax)
        Vmax = x2i;
        TVmax = t;
      endif
    
      if(x2i < Vmin)
        Vmin = x2i;
        TVmin = t;
      endif 
      
      t = t+h;
    endwhile
  
    disp(['DMAX = ',num2str(Dmax),' (',num2str(TDmax),'); DMIN = ',num2str(Dmin),' (',num2str(TDmin),'); VMAX = ',num2str(Vmax),' (',num2str(TVmax),'); VMIN = ',num2str(Vmin),' (',num2str(TVmin),')']);
    hold on;
    plot(T,D);
    plot(T,V);
    hold off;  
endfunction