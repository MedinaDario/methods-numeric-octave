% METODO DE NEWTON-LAGRANGE
% F: funci�n (x) f = @(x) ...
% PA: punto xi
% PB: punto xi-1
% E: error
function [] = NEWTONLAGRANGE(F,PA,PB,E)  

  while (true)  
    
    Xm =  ((PB*F(PA)-PA*F(PB))/(F(PA)-F(PB)));    
 
    disp(['Xi-1 = ', num2str(PB), '; Xi = ', num2str(PA), ' Xi+1 = ', num2str(Xm)])
    
    if(F(Xm) == 0)
      disp(['RAIZ = ', num2str(Xm)]) 
      break     
    endif
    
    ERROR = abs((Xm - PA));
    disp(['ERROR = ', num2str(ERROR)])    
    
    if(ERROR<E)    
      disp('')
      disp(['RESULTADO = ', num2str(Xm)])    
      break
    endif
    
    PB = PA;
    PA = Xm;
    
    disp('')    
  endwhile
endfunction