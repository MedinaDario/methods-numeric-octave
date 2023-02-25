% METODO DE REGULA-FALSI
% F: función (x) f = @(x) ...
% LI: limite inferior
% LS: limite superior
% E: error
function [] = REGULAFALSI(F,LI,LS,E)  
  AUX = 0;
  flag = true;
  while (true)  
    Xm =  LS-F(LS)*((LS-LI)/(F(LS)-F(LI)));
    
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
    
    %F(LI) igual signo F(Xm)
    if(T>0)
      disp('TESTIGO (==)')
      LI = Xm;
    endif
    
    %F(LI) distinto signo F(Xm)
    if(T<0)
      disp('TESTIGO (!=)')
      LS = Xm;
    endif  
    
    AUX = Xm;
    disp('')
  endwhile
endfunction