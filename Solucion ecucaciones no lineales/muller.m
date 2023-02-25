% METODO DE MULLER
% F: funci�n (x) f = @(x) ...
% PA: punto xi
% PB: punto xi-1
% PC: punto xi-2
% E: error
function [] = MULLER(F,PA,PB,PC,E)
  
  xi0 = PA;
  xi1 = PB;
  xi2 = PC; 

  while (true)
    
    A = [xi0^2,xi0,1;xi1^2,xi1,1;xi2^2,xi2,1]
    B = [feval(F,xi0);feval(F,xi1);feval(F,xi2)]
    
    X = inv(A)*B;
    disp('') 
    disp(['X = A^-1*B'])
    disp(['a = ', num2str(X(1,1)),', b = ', num2str(X(2,1)), ', c = ', num2str(X(3,1))])

    R = roots(X);
    disp('')
    disp(['RESOLVENTE: xa = ', num2str(R(1,1)),', xb = ', num2str(R(2,1))])    
 
    Xm = 0;
    if(abs(feval(F,R(1,1)))>abs(feval(F,R(2,1))))
      Xm = R(1,2);
      disp('')
      disp(['|f(',num2str(R(1,1)),')| > |f(',num2str(R(2,1)),')|'])
      disp(['Xi+1 = ',num2str(Xm)])      
    else
      Xm = R(1,1);
      disp('')
      disp(['|f(',num2str(R(1,1)),')| <= |f(',num2str(R(2,1)),')|'])
      disp(['Xi+1 = ',num2str(Xm)]) 
    endif
    
    ERROR = abs((Xm - xi0));
    disp('')
    disp(['ERROR = ', num2str(ERROR)])    
    
    if(ERROR<E)    
      disp('')
      disp(['RESULTADO = ', num2str(Xm)])    
      break
    endif
    
    xi2 = xi1;
    xi1 = xi0;
    xi0 = Xm;
    
    disp('')
    disp(['xi = ', num2str(xi0),', xi-1 = ', num2str(xi1), ', xi-2 = ', num2str(xi2)])
    
    disp('')
    disp('-------------------------------------------------------------------')  
  endwhile
endfunction