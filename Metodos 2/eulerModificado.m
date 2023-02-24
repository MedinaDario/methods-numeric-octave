% METODO DE EULER
% f: función (t,yi) f = @(t,y) ...
% ti, tf: intervalo
% y0: valor inicial
% h: tamaño de paso
% m: cantidad de mejoras
function EULERM(f,ti,tf,y0,h,m)  
  format long;
  
  yi = y0;  
  t = ti;
  
  i = 1;
  while t<tf; 
    disp(['I',num2str(i),' = Y',num2str(i),'(',num2str(t+h),') = ', num2str(yi),' + ',num2str(h),' * f(',num2str(t),', ',num2str(yi),')']);
    ji = yi + h * feval(f,t,yi);
    disp(['I',num2str(i),' = Y',num2str(i),'(',num2str(t+h),') = ',num2str(ji)]);    
    
    for(j=1:m)
      disp(['J',num2str(j),' = Y',num2str(i),'(',num2str(t+h),') = ', num2str(yi),' + ',num2str(h),' * 0.5 * (f(',num2str(t),', ',num2str(yi),') + f(',num2str(t+h),', ',num2str(ji),'))']);
      ji = yi + h * 0.5 * (feval(f,t,yi) + feval(f,t+h,ji));
      disp(['J',num2str(j),' = Y',num2str(i),'(',num2str(t+h),') = ',num2str(ji)]);
    endfor  
    disp("");
    
    yi = ji;
    t = t+h;
    i= i+1;
  endwhile
endfunction