% METODO DE EULER
% f: función (t,yi) f = @(t,y) ...
% ti, tf: intervalo
% y0: valor inicial
% h: tamaño de paso
function EULER(f,ti,tf,y0,h)
  yi = y0;
  t = ti;  
  i=1;
  disp('');
  disp(['Y0(',num2str(ti),') = ',num2str(y0)]);  
  disp('');
  while t<tf;
    aux = yi;
    disp(['Y',num2str(i),'(',num2str(t+h),') = ', num2str(yi),' + ',num2str(h),' * f(',num2str(t),', ',num2str(yi),')']);
    yi = yi + h * f(t,yi);
    disp(['Y',num2str(i),'(',num2str(t+h),') = ', num2str(yi)]);
    disp('');
    t = t+h;
    i=i+1;
  endwhile
endfunction