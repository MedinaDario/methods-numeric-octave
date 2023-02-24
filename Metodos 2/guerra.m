function GUERRA()
  DEAD_A = 0;
  DEAD_B = 0;
  DEAD_C = 0;
  
  x = -1;
  while(true)
    
    x = x + 1;
    disp(['CLOCK: ',num2str(x)]);   
    if(DEAD_A == 0)
      if(DEAD_B == 0 && DEAD_C == 0)
        if(randi([0,1])==0)
          if(randi([1,6])==1)
            DEAD_B = 1;
            disp(['A -> B (ACERTO)']);
          else
            disp(['A -> B (ERRO)']);
          endif
        else
          if(randi([1,6])==1)
            DEAD_C = 1;
            disp(['A -> C (ACERTO)']);
          else
            disp(['A -> C (ERRO)']);
          endif
        endif;      
      endif
      
      if(DEAD_B == 0 && DEAD_C == 1)
        if(randi([1,6])==1)
          DEAD_B = 1;
          disp(['A -> B (ACERTO)']);
        else
          disp(['A -> B (ERRO)']);
        endif  
      endif
    
      if(DEAD_B == 1 && DEAD_C == 0)
        if(randi([1,6])==1)
          DEAD_C = 1;
          disp(['A -> C (ACERTO)']);
        else
          disp(['A -> C (ERRO)']);
        endif
      endif
     
      if(DEAD_B == 1 && DEAD_C == 1)
        disp(['']);
        disp(['GANO A']);
        return;
      endif 
    endif
    
    ##############################
    
    x = x + 1;
    disp(['CLOCK: ',num2str(x)]);  
    if(DEAD_B == 0)            
      if(DEAD_A == 0 && DEAD_C == 0)
        if(randi([0,1])==0)
          if(randi([1,6])==1)
            DEAD_A = 1;
            disp(['B -> A (ACERTO)']);
          else
            disp(['B -> A (ERRO)']);
          endif
        else
          if(randi([1,6])==1)
            DEAD_C = 1;
            disp(['B -> C (ACERTO)']);
          else
            disp(['B -> C (ERRO)']);
          endif
        endif;      
      endif
      
      if(DEAD_A == 0 && DEAD_C == 1)
        if(randi([1,6])==1)
          DEAD_A = 1;
          disp(['B -> A (ACERTO)']);
        else
          disp(['B -> A (ERRO)']);
        endif  
      endif
    
      if(DEAD_A == 1 && DEAD_C == 0)
        if(randi([1,6])==1)
          DEAD_C = 1;
          disp(['B -> C (ACERTO)']);
        else
          disp(['B -> C (ERRO)']);
        endif
      endif
     
      if(DEAD_A == 1 && DEAD_C == 1)
        disp(['']);
        disp(['GANO B']);
        return;
      endif   
    endif
    
    ##############################
    
    x = x + 1;
    disp(['CLOCK: ',num2str(x)]);    
    if(DEAD_C == 0)
      if(DEAD_A == 0 && DEAD_B == 0)
        if(randi([0,1])==0)
          if(randi([1,6])==1)
            DEAD_A = 1;
            disp(['C -> A (ACERTO)']);
          else
            disp(['C -> A (ERRO)']);
          endif
        else
          if(randi([1,6])==1)
            DEAD_B = 1;
            disp(['C -> B (ACERTO)']);
          else
            disp(['C -> B (ERRO)']);
          endif
        endif;      
      endif
      
      if(DEAD_A == 0 && DEAD_B == 1)
        if(randi([1,6])==1)
          DEAD_A = 1;
          disp(['C -> A (ACERTO)']);
        else
          disp(['C -> A (ERRO)']);
        endif  
      endif
    
      if(DEAD_A == 1 && DEAD_B == 0)
        if(randi([1,6])==1)
          DEAD_B = 1;
          disp(['C -> B (ACERTO)']);
        else
          disp(['C -> B (ERRO)']);
        endif
      endif 
      
      if(DEAD_A == 1 && DEAD_B == 1)
        disp(['']);
        disp(['GANO C']);
        return;
      endif  
    endif
    
    x = x + 4;

  endwhile  
endfunction
