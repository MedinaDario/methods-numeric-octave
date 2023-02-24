% METODO DE NEWTON DE 2do ORDEN
% F: funci�n (x) f = @(x) ...
% D: derivada 1RA (x) f = @(x) ...
% DD: dericada 2DA (x) f = @(x) ...
% P: punto inicial
% E: error
function [] = NEWTON2ORDEN(F,D,DD,P,E)  

  while (true)  
    Xm =  P-(F(P)/(D(P)-(F(P)/(2*D(P)))*DD(P)));    
 
    disp(['Xm = ', num2str(P), '; Xm+1 = ', num2str(Xm)])
    
    if(F(Xm) == 0)
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