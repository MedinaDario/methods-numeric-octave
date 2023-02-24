% METODO DE GAUSS-SEIDEL
% A: matriz de coeficientes
% B: vector de terminos independientes
% V: vector con condiciones iniciales
% E: error maximo permitido
% Nm: numero maximo de iteraciones
function [] = GAUSSSEIDEL(A,B,V,E,Nm)
  N = tril(A);
  P = (triu(A));
  
  for i = 1 : size(P)(1)
    P(i,i) = 0;
  endfor
  
  disp('')
  disp('N = ')
  disp(N)
  
  disp('')
  disp('P = ')
  disp(P)
  
  disp('')
  disp('N^(-1)*B+N^(-1)*P*X^(K)')
  
  disp('')
  disp('N^-1*B')
  T1 = inv(N)*B
  
  disp('')
  disp('N^(-1)*P')
  T2 = inv(N)*P  
  
  T2 = T2 * (-1);
  
  for i=1:size(T2)(1,1)
    for j=1:size(T2)(1,2)
      if(T2(i,j)==-0)
        T2(i,j)=0;
      endif
    endfor  
  endfor
  
  disp('T1-T2')
  [T1, T2]   
  
  Ni = 1;
  while(Ni<=Nm)    
    disp('')
    disp(['ITERACION: ',num2str(Ni)])
    
    aux = V;
    for i=1:length(V)
       aux(i,1) = T1(i,1);
       for j=1:size(T2)(1,2) 
          %aux(i,1) = aux(i,1)+T2(i,j)*V(j); 
          aux(i,1) = aux(i,1)+T2(i,j)*aux(j); 
       endfor
    end
    
    aux
    
    cont = 0;
    for z=1:length(aux)
      error = abs(aux(z,1)-V(z,1))
      if(error <= E)
        cont = cont + 1;
      endif
    endfor
    
    if(cont == length(aux))
      return;
    endif
    
    
    V = aux;
    Ni = Ni+1;
    disp('')
    disp('---------------------------------------------')    
  endwhile
endfunction
