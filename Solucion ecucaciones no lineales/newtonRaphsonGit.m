clc;
fprintf ("***METODO DE NEWTON RAPSHON***\n");

#tambien se puede utilizar   f  = input("escribe la funcion", "s")
f = '3*x + sin(x)-e^(x)';
f = inline(f);

d = '3+cos(x)-e^(x)';
d = inline(d);

maximoIteracion = input("maximo de iteraciones: ")

xi=0;
vector = [];
i=1;
#funcion que retorna el error aproximado
function ea = errora(xa, xp)
    ea = abs(((xa - xp)/xa)*100);
end

if d(xi) == 0
     fprintf ('no se puede hallar una raiz');

     else
          
          xn = xi - ( f(xi)/d(xi) );
          fprintf ("____________________________________________\n");
          fprintf("%s\t\t %s\t\t  %s\n",'I','XN','|EA|  ');
          fprintf ("____________________________________________\n");
          
          while i < maximoIteracion
                fprintf('%.0f\t\t', i);
                fprintf('%.8f\t', xn);
                vector(i) = xn;
                fprintf('%.8f\t', errora(xn, xi));
                fprintf ("\n");
                xi = xn;
                xn = xi - ( f(xi)/d(xi) );
                i++;

          endwhile
                vector(i) = xn;
                fprintf('%.0f\t\t', i);
                fprintf('%.8f\t', xn);
                fprintf('%.8f\t', errora(xn, xi));
                fprintf ("\n");
              
                fprintf ("____________________________________________");
                fprintf('\nLA RAIZ APROXIMADA ES:  %.8f\n', xn);
                fprintf('\nf(x) =  %.4f\n', f(xn) );
                
              for i=1:length(vector)
                   fprintf('\n vector[%.0f]=  %.4f' ,i , vector(i))
                endfor
                fprintf ("\n");
endif

