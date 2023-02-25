% METODO DE PUNTO FIJO
% FG: función (x) g = @(x) ...
% P: punto inicial
% E: error
function [] = PUNTOFIJO(G,P,E)  

  while (true)  
    Xm =  G(P);    
 
    disp(['Xm = ', num2str(P), '; Xm+1 = ', num2str(Xm)])
    
    if(G(Xm) == 0)
      disp(['RAIZ = ', num2str(Xm)]) 
      break     
    endif
    
    ERROR = abs((Xm - P));
    disp(['ERROR = ', num2str(ERROR)])    
    
    if(ERROR<E)    
      disp('')
      disp(['RESULTADO = ', num2str(Xm)])    
      break
    endif
    
    P = Xm;
    disp('')    
  endwhile
endfunction