function result=ALEATORIO(n)
  result = [0,(randi([1,6])/2)];
  for i=1:n-1
    if(randi([0,1])==1)
      result = [result;i,(randi([10,60])/2)];  
    endif
  endfor 
   
endfunction