function SERVIDOR_MULTIPLE_2(aviones)
  
     TNA = -9999999;
     TND = 9999999;
     TND_1 = 9999999;
     TND_2 = 9999999;
     TNE = 0;
     
     LQ_1 = 0;
     LQ_2 = 0;
     NEE = 1;
     NEE_1 = 0;
     NEE_2 = 0;
     NES = 0;
     NES_1 = 0;
     NES_2 = 0;
     TQT = 0;
     TQT_1 = 0;
     TQT_2 = 0;
     
     CLOCK = 0;
     SERVER_1 = -1;
     SERVER_2 = -1;
     
     QUEUE_1 = [];
     QUEUE_2 = [];
     
     WAIT = 0;      #Tiempo en tierra
     TWAIT = 0;     #Total de tiempo en tierra
     TS_1 = 0;      #Tiempo de uso del servidor 1
     TS_2 = 0;      #Tiempo de uso del servidor 2
     IE_1 = 0;      #Instante de entrada al servidor 1
     IE_2 = 0;      #Instante de entrada al servidor 2
     
     ########################
     #STOP_1 = 0;   #Detectar fallo y parar
     #STOP_2 = 0;   #Detectar fallo y parar
     
     #ARRANQUE     
     NEE = 1;
     NEE_1 = 1;
     CLOCK = aviones(NEE,1);
     
     SERVER_1 = aviones(NEE,1);
     
     TNA = aviones(NEE+1,1);
     TND_1 = CLOCK + aviones(NEE,2);
     TND = CLOCK + aviones(NEE,2);
     
     if(TNA <= TND)
      TNE = TNA;
     else
      TNE = TND;
     endif
     
     IE_1 = CLOCK;
     
    while(NES!=size(aviones)(1,1))
      
      if(TNA < TND)
        #Arriba un avion  
        CLOCK = TNE;        
        NEE = NEE + 1;
        
        try           
          TNA = aviones(NEE+1,1);
        catch
          TNA = 999999;
        end_try_catch
        
        ENTRY = 1;
        if(SERVER_1 == -1)
          ENTRY = 1;
        else
          if(SERVER_2 == -1)
            ENTRY = 0;
          else
            if(LQ_1 <= LQ_2)
              ENTRY = 1;
            else
               ENTRY = 0;
            endif
          endif          
        endif  
        
        if(ENTRY == 1)           
          #Aribo atendido por 1
          FLAG = "A1"; 
          NEE_1 = NEE_1 + 1;          
          
          if((NEE_1-1)== NES_1)                      
            #Entra al servidor 1
            SERVER_1 = aviones(NEE,1);
            TND_1 = SERVER_1 + aviones(NEE,2);  
            
            IE_1 = CLOCK;
            ##################################
            #if(aviones(NEE,2)==-1)
            #  STOP_1 = 1;
            #  TND_1 = 999999;
            #  LQ_1 = 999999;
            #endif
            
            if(TND_1 <= TND_2)
              #Establezco que el siguiente en salida en el servidor 1
              TND = TND_1;              
            endif            
          else
            #Entra a la cola 1
            QUEUE_1 = [QUEUE_1; aviones(NEE,1), aviones(NEE,2)];             
            LQ_1 = LQ_1 + 1;
          endif 
          
        else
          #Aribo atendido por 2   
          FLAG = "A2";      
          NEE_2 = NEE_2 + 1;          
          
          if((NEE_2-1)== NES_2)
            #Entra al servidor 2
            SERVER_2 = aviones(NEE,1);            
            TND_2 = SERVER_2 + aviones(NEE,2);  
  
            IE_2 = CLOCK;
            ##################################
            #if(aviones(NEE,2)==-1)
            #  STOP_2 = 1;
            #  TND_2 = 999999;
            #  LQ_2 = 999999;
            #endif  
            
            if(TND_2 <= TND_1)
              #Establezco que el siguiente en salida en el servidor 2
              TND = TND_2;
            endif            
          else
            #Entra a la cola 2
            QUEUE_2 = [QUEUE_2; aviones(NEE,1), aviones(NEE,2)];             
            LQ_2 = LQ_2 + 1;
          endif          
        endif
      else
        #Parte un avion 
        CLOCK = TNE;
        
        if(TND_1 <= TND_2)
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
            
            ##################################
            #if(QUEUE_1(1,2)==-1)
            #  STOP_1 = 1;
            #  TND_1 = 999999;
            #  LQ_1 = 999999;
            #endif
            
            QUEUE_1(1,:) = [];
            LQ_1 = LQ_1 - 1;   
            
            #Establezco la siguiente salida
            if(TND_1 <= TND_2)              
              TND = TND_1;
            else
              TND = TND_2;
            endif    
          else
            #Se va del servidor y no trae de la cola 2
            SERVER_1 = -1;
            TND_1 = 999999; 
            
            #Establezco la siguiente salida
            if(TND_2 <= TND_1)              
              TND = TND_2;
            else
              TND = TND_1;
            endif 
          endif
          
          NES_1 = NES_1 + 1;
          
          TS_1 = TS_1 + CLOCK - IE_1;
          IE_1 = CLOCK;
        else
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
            
            ##################################
            #if(QUEUE_2(1,2)==-1)
            #  STOP_2 = 1;
            #  TND_2 = 999999;
            #  LQ_2 = 999999;
            #endif
            
            QUEUE_2(1,:) = [];
            LQ_2 = LQ_2 - 1; 
            
            #Establezco que el siguiente en salida en el servidor 2
            if(TND_2 <= TND_1)              
              TND = TND_2;
            else
              TND = TND_1;
            endif    
          else
            #Se va del servidor y no trae de la cola 2   
            SERVER_2 = -1;
            TND_2 = 999999;            
            
            #Establezco la siguiente salida
            if(TND_1 <= TND_2)              
              TND = TND_1;
            else
              TND = TND_2;
            endif             
          endif
          
          NES_2 = NES_2 + 1;  
  
          TS_2 = TS_2 + CLOCK - IE_2;
          IE_2 = CLOCK;  
        endif
        
        NES = NES + 1;
      endif
      
      if(TNA <= TND)          
        TNE = TNA;
      else
        TNE = TND; 
      endif
      
      
      #####################
      #if(STOP_1 == 1 && STOP_2 == 1)
      #  disp(['']);
      #  disp(['EL SISTEMA SE DETUVO EN EL INSTANTE: ',num2str(CLOCK)]);
      #  return;
      #endif
      
      
      #disp(['']);
      #disp(['CLOCK = ',num2str(CLOCK),'; EVENT = ',FLAG,]);
      #disp(['TNA = ',num2str(TNA),'; TND = ',num2str(TND),'; TNE = ',num2str(TNE)]);
      #disp(['LQ = ',num2str(LQ_1),' - ',num2str(LQ_2),'; NEE = ',num2str(NEE),'; NES = ',num2str(NES),'; TQT = ',num2str(TQT)]);             
      #disp([num2str(QUEUE_1)]); 
      #disp(['-']);
      #disp([num2str(QUEUE_2)]);
      
    endwhile 
    disp(['']);
    disp(['TWAIT = ',num2str(TWAIT)]); 
    disp(['TS_1 = ',num2str(TS_1)]);
    disp(['TS_2 = ',num2str(TS_2)]);
endfunction