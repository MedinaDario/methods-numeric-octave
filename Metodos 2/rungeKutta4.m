% METODO DE RANGE KUTTA ORDEN 4
% f: función (t,yi) f = @(t,y) ...
% ti, tf: intervalo
% y0: valor inicial
% h: tamaño de paso
function RK4(f,ti,tf,y0,h)
  yi = y0;
  t = ti;  
  i=1;
 
  while (t+h)<=tf;
    
    disp(['T = ',num2str(t+h)]);
    
    disp(['K1 = ', num2str(h), ' * f(',num2str(t),', ',num2str(yi),')']);
    k1 = h * feval(f,t,yi);    
    disp(['K1 = ',num2str(k1)]);    
    
    disp(['K2 = ', num2str(h), ' * f(',num2str(t),'+',num2str(h),'/2, ',num2str(yi),'+', num2str(k1),'/2)']);
    k2 = h * feval(f,t+h/2, yi+k1/2);
    disp(['K2 = ',num2str(k2)]);    
    
    disp(['K3 = ', num2str(h), ' * f(',num2str(t),'+',num2str(h),'/2, ',num2str(yi),'+', num2str(k2),'/2)']);
    k3 = h * feval(f,t+h/2,yi+k2/2);    
    disp(['K3 = ',num2str(k3)]);    
    
    disp(['K4 = ', num2str(h), ' * f(',num2str(t),'+',num2str(h),', ',num2str(yi),'+', num2str(k3),')']);
    k4 = h * feval(f,t+h, yi+k3);
    disp(['K4 = ',num2str(k4)]);    
    
    disp(['Y',num2str(i),' = ', num2str(yi), ' + 0.16 * (',num2str(k1),' + ',num2str(k2),' + ',num2str(k3),' + ',num2str(k4),')']);
    yi = yi + (1/6) * (k1+2*k2+2*k3+k4);
    disp(['Y',num2str(i),' = ', num2str(yi)]);
    

    disp("");
    
    t = t+h;
    i = i+1;    
  endwhile
endfunction