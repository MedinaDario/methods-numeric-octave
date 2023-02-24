% METODO DE RANGE KUTTA ORDEN 2
% f: función (t,yi) f = @(t,y) ...
% ti, tf: intervalo
% y0: valor inicial
% h: tamaño de paso
function RK2(f,ti,tf,y0,h)
  yi = y0;
  t = ti;  
  i=1;
 
  while (t+h)<tf;
    disp(['T = ',num2str(t+h)]);
    
    disp(['K1 = ', num2str(h), ' * f(',num2str(t),', ',num2str(yi),')']);
    k1 = h * feval(f,t,yi);    
    disp(['K1 = ',num2str(k1)]);    
    
    disp(['K2 = ', num2str(h), ' * f(',num2str(t),'+',num2str(h),', ',num2str(yi),'+', num2str(k1),')']);
    k2 = h * feval(f,t+h, yi+k1);
    disp(['K2 = ',num2str(k2)]);    
    
    disp(['Y',num2str(i),' = ', num2str(yi), ' + 0.5 * (',num2str(k1),' + ',num2str(k2),')']);
    yi = yi + 0.5 * (k1+k2);
    disp(['Y',num2str(i),' = ', num2str(yi)]);
    
    disp("");
    
    t = t+h;
    i = i+1;    
  endwhile
endfunction