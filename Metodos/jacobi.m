% METODO DE JACOBI
% A: matriz de coeficientes
% B: vector de terminos independientes
% V: vector con condiciones iniciales
% E: error maximo permitido
% Nm: numero maximo de iteraciones
function [] = JACOBI(A,B,V,E,Nm)
  D = diag(diag(A));
  U = triu(A);
  L = tril(A);
  
  for i = 1 : size(A)(1)
    U(i,i) = 0;
    L(i,i) = 0;
  endfor
  
  R = L+U;
  
  disp('D =')
  disp(D)
  disp('')
  disp('R =')
  disp(R)
  
  disp('')
  disp('D^(-1)*B-D^(-1)*(R)*X^(K)')
  
  disp('')
  disp('D^-1*B')
  T1 = inv(D)*B
  
  disp('')
  disp('D^(-1)*(R)')
  T2 = inv(D)*(R)  
  
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
          aux(i,1) = aux(i,1)+T2(i,j)*V(j); 
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
