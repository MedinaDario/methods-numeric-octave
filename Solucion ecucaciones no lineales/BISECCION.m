% METODO DE BISECCION
% F: funci�n (x) f = @(x) ...
% LI: limite inferior
% LS: limite superior
% E: error
function [] = BISECCION(F,LI,LS,E)  
  AUX = 0;
  flag = true;
  while (true)  
    Xm = (LI+LS)/2;
    
    disp(['LI = ', num2str(LI), '; LS = ', num2str(LS), '; Xm = ', num2str(Xm)])
    
    if(F(Xm) == 0)
      disp(['RAIZ = ', num2str(Xm)]) 
      break     
    endif
    
    ERROR = abs((AUX - Xm));
    disp(['ERROR = ', num2str(ERROR)])    
    
    if(ERROR<E)    
      disp('')
      disp(['RESULTADO = ', num2str(Xm)])    
      break
    endif    
    
    T = F(LI) * F(Xm);  
    
    if(T>0)
      disp(['TESTIGO = ', '+'])
      LI = Xm;
    endif
    
    if(T<0)
      disp(['TESTIGO = ', '-'])
      LS = Xm;
    endif  
    
    AUX = Xm;
    disp('')
  endwhile
endfunction
