function Ja=Jacobi(A,B,e,n)
%A Matriz de terminos de coeficientes
%B vector de terminos independientes
%e Error tolerable
%n Número máximo de iteraciones

f=length(A);
bb=length(B);
cont=0;
X=zeros(f,1);
Xk=zeros(f,1);
Xant=zeros(f,1);
	if f~=bb
   	disp('Error: puede que la matriz de coeficientes no sea cuadrada, o falten datos al vector de terminos independientes') 
       
      
     elseif det(A)==0
   	disp('Error: La matriz es singular, su determinante es igual a cero')
   	det(A)==0
      
      
   else
    for t=1:n
		for i=1:f
			d=0;
			for j=1:f
				if j~=i
					d=d+A(i,j)*Xk(j);
				end
			end
			Xk(i)=X(i);
			X(i)=(B(i)-d)/A(i,i);
		end
        err=norm(X-Xk,inf);
      	if err<=e
            z = [' Salida por diferencia de norma ',num2str(t)];            
            disp(X)
		    break
		end
       
    end
    z = ['Salida por cantidad de Iteracion ',num2str(t)];
    disp(z);
    disp(X)
    Ja=X; 
	end
