% METODO DE RANGE KUTTA ORDEN 2 SISTEMA
% f: función (t,yi,zi) f = @(t,y,z) ...
% g: función (t,yi,zi) g = @(t,y,z) ...
% ti, tf: intervalo
% y0, z0: valores iniciales
% h: tamaño de paso
function RK2SISTEMA(f,g,ti,tf,y0,z0,h)
  yi = y0;
  zi = z0;  
  t = ti;  
  i=1;
 
  while (t+h)<=tf;
    disp(['T = ',num2str(t+h)]);
    
    disp(['K1 = ', num2str(h), ' * f(',num2str(t),', ',num2str(yi),', ',num2str(zi),')']);
    k1 = h * feval(f,t,yi,zi);    
    disp(['K1 = ',num2str(k1)]);   
   
    disp(['L1 = ', num2str(h), ' * g(',num2str(t),', ',num2str(yi),', ',num2str(zi),')']);
    l1 = h * feval(g,t,yi,zi);    
    disp(['L1 = ',num2str(l1)]); 
    
    disp(['K2 = ', num2str(h), ' * f(',num2str(t),'+',num2str(h),', ',num2str(yi),'+', num2str(k1),', ',num2str(zi),'+', num2str(l1),')']);
    k2 = h * feval(f,t+h,yi+k1,zi+l1);
    disp(['K2 = ',num2str(k2)]);    
    
    disp(['L2 = ', num2str(h), ' * g(',num2str(t),'+',num2str(h),', ',num2str(yi),'+', num2str(k1),', ',num2str(zi),'+', num2str(l1),')']);
    l2 = h * feval(g,t+h,yi+k1,zi+l1);
    disp(['L2 = ',num2str(l2)]);
    
    disp(['Y',num2str(i),' = ', num2str(yi), ' + 0.5 * (',num2str(k1),' + ',num2str(k2),')']);
    yi = yi + 0.5 * (k1+k2);
    disp(['Y',num2str(i),' = ', num2str(yi)]);
    
    disp(['Z',num2str(i),' = ', num2str(zi), ' + 0.5 * (',num2str(l1),' + ',num2str(l2),')']);
    zi = zi + 0.5 * (l1+l2);
    disp(['Z',num2str(i),' = ', num2str(zi)]);
    
    disp("");
    
    t = t+h;
    i = i+1;    
  endwhile
endfunction