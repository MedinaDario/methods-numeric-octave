function SERVIDOR_MULTIPLE_3(aviones)
  
     TNA = -999999;
     TND = 999999;
     TND_1 = 999999;
     TND_2 = 999999;
     TND_3 = 999999;
     TNE = 0;
     
     LQ_1 = 0;
     LQ_2 = 0;
     LQ_3 = 0;
     NEE = 0;
     NEE_1 = 0;
     NEE_2 = 0;
     NEE_3 = 0;
     NES = 0;
     NES_1 = 0;
     NES_2 = 0;
     NES_3 = 0;
     TQT = 0;
     TQT_1 = 0;
     TQT_2 = 0;
     TQT_3 = 0;
     
     CLOCK = 0;
     SERVER_1 = -1;
     SERVER_2 = -1;
     SERVER_3 = -1;
     
     QUEUE_1 = [];
     QUEUE_2 = [];
     QUEUE_3 = [];
     
     WAIT = 0;
     TWAIT = 0;     
     
     #ARRANQUE
     NEE = 1;
     NEE_1 = 1;
     
     SERVER_1 = aviones(NEE,1);
     
     TNA = aviones(NEE+1,1);
     TND_1 = CLOCK + aviones(NEE,2);
     TND = CLOCK + aviones(NEE,2);
     
     if(TNA <= TND)
      TNE = TNA;
     else
      TNE = TND;
     endif
     
    while(NES!=size(aviones)(1,1))
      
      if(TNA < TND)
        #Arriba un avion                
        NEE = NEE + 1;
        
        try           
          TNA = aviones(NEE+1,1);
        catch
          TNA = 999999;
        end_try_catch
        
        ENTRY = 1;
        
        if(LQ_3 <= LQ_1 && LQ_3 <= LQ_2)
            ENTRY = 3;
        endif  
        if(LQ_2 <= LQ_1 && LQ_2 <= LQ_3)
            ENTRY = 2;
        endif  
        if(LQ_1 <= LQ_2 && LQ_1 <= LQ_3)
            ENTRY = 1;
        endif        
        if(SERVER_3 == -1)
            ENTRY = 3;
        endif         
        if(SERVER_2 == -1)
            ENTRY = 2;
        endif        
        if(SERVER_1 == -1)
            ENTRY = 1;
        endif
         
        if(ENTRY == 1) 
          #Aribo atendido por 1
          FLAG = "A1"; 
          NEE_1 = NEE_1 + 1;          
          
          if((NEE_1-1)== NES_1)
            #Entra al servidor 1
            SERVER_1 = aviones(NEE,1);
            TND_1 = SERVER_1 + aviones(NEE,2);            
            
            if(TND_1 <= TND_2 && TND_1 <= TND_3)
              #Establezco que el siguiente en salida en el servidor 1
              TND = TND_1;              
            endif            
          else
            #Entra a la cola 1
            QUEUE_1 = [QUEUE_1; aviones(NEE,1), aviones(NEE,2)];             
            LQ_1 = LQ_1 + 1;
          endif
        endif 
        if(ENTRY == 2)
          #Aribo atendido por 2   
          FLAG = "A2";      
          NEE_2 = NEE_2 + 1;          
          
          if((NEE_2-1)== NES_2)
            #Entra al servidor 2
            SERVER_2 = aviones(NEE,1);            
            TND_2 = SERVER_2 + aviones(NEE,2);            
            
            if(TND_2 <= TND_1 && TND_2 <= TND_3)
              #Establezco que el siguiente en salida en el servidor 2
              TND = TND_2;
            endif            
          else
            #Entra a la cola 2
            QUEUE_2 = [QUEUE_2; aviones(NEE,1), aviones(NEE,2)];             
            LQ_2 = LQ_2 + 1;
          endif
        endif
        if(ENTRY == 3)
          #Aribo atendido por 3   
          FLAG = "A3";      
          NEE_3 = NEE_3 + 1;          
          
          if((NEE_3-1)== NES_3)
            #Entra al servidor 3
            SERVER_3 = aviones(NEE,1);            
            TND_3 = SERVER_3 + aviones(NEE,2);            
            
            if(TND_3 <= TND_1 && TND_3 <= TND_2)
              #Establezco que el siguiente en salida en el servidor 2
              TND = TND_3;
            endif            
          else
            #Entra a la cola 2
            QUEUE_3 = [QUEUE_3; aviones(NEE,1), aviones(NEE,2)];             
            LQ_3 = LQ_3 + 1;
          endif
        endif
      
        CLOCK = TNE;
        
      else
        #Parte un avion 
        CLOCK = TNE;
        
        EXIT = 0;
        if(TND_3 <= TND_1 && TND_3 <= TND_2)
          EXIT = 3;
        endif;
        if(TND_2 <= TND_1 && TND_2 <= TND_3)
          EXIT = 2;
        endif
        if(TND_1 <= TND_2 && TND_1 <= TND_3)
          EXIT = 1;
        endif
        
        if(EXIT == 1)
          #Parte un avion del servidor 1
          FLAG = "D1"; 
          
          WAIT = CLOCK - SERVER_1;
          TWAIT = TWAIT + WAIT;
          disp(['']);
          disp(['ENTRY = ',num2str(SERVER_1),'; START = ',num2str(CLOCK-WAIT),'; END = ',num2str(CLOCK),'; WAIT = ',num2str(WAIT),'; (1)']);

          if(LQ_1 > 0)
            #Se va del servidor y trae de la cola 1
            SERVER_1 = QUEUE_1(1,1);
            TND_1 = CLOCK + QUEUE_1(1,2);
            TQT_1 = TQT_1 + CLOCK - SERVER_1;
            TQT = TQT + TQT_1; 
            QUEUE_1(1,:) = [];
            LQ_1 = LQ_1 - 1;
            
            #Establezco la proxima salida
            if(TND_1 <= TND_2 && TND_1 <= TND_3)
              TND = TND_1;
            else
              if(TND_2<=TND_3)
                TND = TND_2;
              else
                TND = TND_3;
              endif
            endif    
          else            
            #Se va del servidor y no trae de la cola 1
            SERVER_1 = -1;
            TND_1 = 999999;  
            
            if(TND_1 >= TND_2 || TND_1 >= TND_3)                      
              #Establezco la siguiente en salida
              if(TND_2 <= TND_3)              
                TND = TND_2;
              else
                TND = TND_3;
              endif              
            endif 
          endif
          
          NES_1 = NES_1 + 1;
        endif
        if(EXIT == 2)
          
          #Parte un avion del servidor 2
          FLAG = "D2"; 
          
          WAIT = CLOCK - SERVER_2;
          TWAIT = TWAIT + WAIT;
          disp(['']);
          disp(['ENTRY = ',num2str(SERVER_2),'; START = ',num2str(CLOCK-WAIT),'; END = ',num2str(CLOCK),'; WAIT = ',num2str(WAIT),'; (2)']);
          
          if(LQ_2 > 0)
            #Se va del servidor y trae de la cola 2
            SERVER_2 = QUEUE_2(1,1);
            TND_2 = CLOCK + QUEUE_2(1,2);
            TQT_2 = TQT_2 + CLOCK - SERVER_2;
            TQT = TQT + TQT_2;
            QUEUE_2(1,:) = [];
            LQ_2 = LQ_2 - 1;    
            
            #Establezco la proxima salida
            if(TND_2 <= TND_1 && TND_2 <= TND_3)                            
              TND = TND_2;
            else
              if(TND_1<=TND_3)
                TND = TND_1;
              else
                TND = TND_3;
              endif
            endif    
          else
            #Se va del servidor y no trae de la cola 2   
            SERVER_2 = -1;
            TND_2 = 999999;
            if(TND_2 >= TND_1 || TND_2 >= TND_3)
              #Establezco el siguiente en salida
              if(TND_1 <= TND_3)              
                TND = TND_1;
              else
                TND = TND_3;
              endif
            endif   
          endif
          
          NES_2 = NES_2 + 1;          
        endif
        if(EXIT == 3)
          #Parte un avion del servidor 3
          FLAG = "D3"; 
          
          WAIT = CLOCK - SERVER_3;
          TWAIT = TWAIT + WAIT;
          disp(['']);
          disp(['ENTRY = ',num2str(SERVER_3),'; START = ',num2str(CLOCK-WAIT),'; END = ',num2str(CLOCK),'; WAIT = ',num2str(WAIT),'; (3)']);
          
          if(LQ_3 > 0)
            #Se va del servidor y trae de la cola 3
            SERVER_3 = QUEUE_3(1,1);
            TND_3 = CLOCK + QUEUE_3(1,2);
            TQT_3 = TQT_3 + CLOCK - SERVER_3;
            TQT = TQT + TQT_3;
            QUEUE_3(1,:) = [];
            LQ_3 = LQ_3 - 1;            
            if(TND_3 <= TND_1 && TND_3 <= TND_2)
              #Establezco que el siguiente en salida en el servidor 3
              TND = TND_3;
            else
              if(TND_1<=TND_2)
                TND = TND_1;
              else
                TND = TND_2;
              endif
            endif    
          else
            #Se va del servidor y no trae de la cola 3   
            SERVER_3 = -1;
            TND_3 = 999999;
            if(TND_3 >= TND_1 || TND_3 >= TND_2)
              #Establezco el siguiente en salida
              if(TND_1 <= TND_2)              
                TND = TND_1;
              else
                TND = TND_2;
              endif
            endif   
          endif
          
          NES_3 = NES_3 + 1;          
        endif        
        
        NES = NES + 1;
      endif #Fin ARRIBO/DESPEGUE
      
      if(TNA <= TND)          
        TNE = TNA;
      else
        TNE = TND; 
      endif
      
      #disp(['']);
      #disp(['CLOCK = ',num2str(CLOCK),'; EVENT = ',FLAG,]);
      #disp(['TNA = ',num2str(TNA),'; TND = ',num2str(TND),'; TNE = ',num2str(TNE)]);
      #disp(['LQ = ',num2str(LQ_1),' - ',num2str(LQ_2),' - ',num2str(LQ_3),'; NEE = ',num2str(NEE),'; NES = ',num2str(NES),'; TQT = ',num2str(TQT)]);             
      #disp([num2str(QUEUE_1)]); 
      #disp(['-']);
      #disp([num2str(QUEUE_2)]);
      #disp(['-']);
      #disp([num2str(QUEUE_3)]);
      
    endwhile 
    
    disp(['']);
    disp(['TWAIT = ',num2str(TWAIT)]); 
endfunction