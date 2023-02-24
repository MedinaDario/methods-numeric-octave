% METODO DE PREDICTOR CORRECTOR ORDEN 3
% f: función (t,yi) f = @(t,y) ...
% ti, tf: intervalo
% y_2: valor inicial
% h: tamaño de paso
function PC3(f,ti,tf,y_2,h)  
  
  function [v2] = RK4(f,ti,y0,h)
    yi = y0;
    t = ti; 
    
    v2 = [];
    for i=1:2
      
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
      
      v2 = [v2;yi];

      disp("");
      
      t = t+h;
    endfor
  endfunction

  disp('')
  disp('RUNGE KUTTA ORDEN 4')
  disp('')
  v2 = RK4(f,ti,y_2,h);
  
  y_1 = v2(1);
  y_0 = v2(2);
 
  disp('')
  disp('PREDICTOR-CORRECTOR ORDEN 3') 
  disp('')
  
  t = ti+2*h;  
  i=3;
 
  while (t+h)<tf;   
    disp(["T = ",num2str(t+h)]);
    
    disp(['W',num2str(i),' = ', num2str(y_0), ' + (',num2str(h),'/12) * (23 * f(',num2str(t),', ',num2str(y_0),') - 16 * f(',num2str(t-h),', ',num2str(y_1),') + 5 * f(',num2str(t-2*h),', ',num2str(y_2),'))']);
    wi = y_0 + (h/12) * (23*feval(f,t,y_0)-16*feval(f,t-h,y_1)+5*feval(f,t-2*h, y_2));
    disp(['W',num2str(i),' = ',num2str(wi)]); 
    
    disp(['y',num2str(i),' = ', num2str(y_0), ' + (',num2str(h),'/12) * (5 * f(',num2str(t+h),', ',num2str(wi),') + 8 * f(',num2str(t),', ',num2str(y_0),') - 1 * f(',num2str(t-h),', ',num2str(y_1),'))']);
    yi = y_0 + (h/12) * (5*feval(f,t+h,wi)+8*feval(f,t,y_0)-1*feval(f,t-h,y_1));
    disp(['Y',num2str(i),' = ',num2str(yi)]);
    
    disp("");
    
    y_2 = y_1;
    y_1 = y_0;
    y_0 = yi;
    
    t = t+h;
    i = i+1;    
  endwhile
endfunction