function [ ret ] = pivparcial (A,b)

  n=size(b);
  mataum=[A b]
  for i=1:n-1
     mayorpiv=abs(mataum(i,i));
     filamayor=i;
     for f=i+1:n
       if abs(mataum(f,i))>mayorpiv
       mayorpiv=abs(mataum(f,i));
       filamayor=f;
       end
     end
     mayorpiv

     if filamayor~=i
       temporal=mataum(filamayor,:);
       mataum(filamayor,:)=mataum(i,:);
       mataum(i,:)=temporal;
     end

     mataum

     for f=i+1:n
       multiplicador=-mataum(f,i)/mataum(i,i)
       for j=1:n+1
          mataum(f,j)=mataum(f,j)+multiplicador*mataum(i,j);
       end
     end
     mataum
  end
endfunction