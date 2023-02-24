function SERVIDOR(aviones)
     TNA = -9999999;
     TND = 9999999;
     TNE = 0;
     
     LQ = 0;
     NEE = 1;
     NES = 0;
     TQT = 0;
     
     CLOCK = aviones(NEE,1);
     SERVER = -1;
     QUEUE = [];
     
     WAIT = 0;        #Tiempo en tierra
     TWAIT = 0;       #Total de tiempo en tierra
     TS = 0;          #Tiempo de uso del servidor
     SS = [CLOCK,1];  #Registro del sistema unidad a unidad
     LAST = [-1,1];   #Arribo mas reciente
     UAS = 0;         #Ultimo arribo al servidor 
     TA = 0;          #Tiempo de arribo
     
     SERVER = aviones(NEE,1);
     TNA = aviones(NEE+1,1);
     TND = CLOCK + aviones(NEE,2);
     IE = CLOCK;      #Instante de entrada al servidor
     
     if(TNA <= TND)
      TNE = TNA;
     else
      TNE = TND;
     endif
     
     disp(['']);
     disp(['CLOCK = ',num2str(CLOCK),'; EVENT = A; SERVER = ',num2str(SERVER)]);
     disp(['TNA = ',num2str(TNA),'; TND = ',num2str(TND),'; TNE = ',num2str(TNE)]);
     disp(['LQ = ',num2str(LQ),'; NEE = ',num2str(NEE),'; NES = ',num2str(NES),'; TQT = ',num2str(TQT)]); 
     disp([num2str(QUEUE)]); 

     FLAG = "";     
     
     while(NES!=size(aviones)(1,1))
        
        if(TNA < TND)
          if(LQ<999999999999)    
            #Arriba un avion          
            FLAG = "A";
            CLOCK = TNE;
            
            NEE = NEE + 1;
            
            TA = TA + CLOCK - UAS;
            UAS = CLOCK;
            
            try           
              TNA = aviones(NEE+1,1);
            catch
              TNA = 999999;
            end_try_catch
            
            if((NEE-1)== NES)
              #Entra al servidor
              SERVER = aviones(NEE,1);
              TND = SERVER + aviones(NEE,2); 
              
              IE = CLOCK;
            else
              #Chequeo si entra a la cola segun tiempo de espera
              TW = TND-CLOCK;
              for z=1:size(QUEUE)(1,1)
                TW = TW + QUEUE(z,2);
              endfor
              if(TW<=999999999999999)
                #Entra a la cola
                QUEUE = [QUEUE; aviones(NEE,1), aviones(NEE,2)];             
                LQ = LQ + 1;
              else
                NES = NES + 1;                
              endif
            endif
            
          else
            #No encola por limite
            CLOCK = TNE;
            NEE = NEE + 1;
            try           
              TNA = aviones(NEE+1,1);
            catch
              TNA = 999999;
            end_try_catch 
            NES = NES + 1;  
          endif
          
        else  
          #Parte un avion 
          FLAG = "D";
          CLOCK = TNE;  
          
          WAIT = CLOCK - SERVER;
          TWAIT = TWAIT + WAIT;
          #disp(['']);
          #disp(['ENTRY = ',num2str(SERVER),'; WAIT = ',num2str(WAIT)]);
          
          if(LQ > 0)  
            #Se va del servidor y trae de la cola              
            SERVER = QUEUE(1,1);         
            TND = CLOCK + QUEUE(1,2);            
            TQT = TQT + CLOCK - SERVER;
            QUEUE(1,:) = []; 
            LQ = LQ - 1; 
          else
            #Se va del servidor y no trae de la cola
            SERVER = -1;
            TND = 999999;
          endif
          
          TS = TS + CLOCK - IE;
          IE = CLOCK;         
          
          NES = NES + 1;    
        endif
        
        if(TNA <= TND)          
          TNE = TNA;
        else
          TNE = TND;
        endif
        
        #Registro del sistema unidad a unidad
        if(size(SS)(1,1) <= CLOCK)           
          if(SS(size(SS)(1,1),1) >= LAST(1,1))
            MAX = SS(size(SS)(1,1),2);
          else
            MAX = LAST(1,2);
          endif
            
          for y=size(SS)(1,1):CLOCK-1
            SS = [SS;y,MAX];
          endfor
          SS = [SS;CLOCK,NEE-NES];           
        endif
        LAST = [CLOCK, NEE-NES];        

        disp(['']);
        disp(['CLOCK = ',num2str(CLOCK),'; EVENT = ',FLAG,'; SERVER = ',num2str(SERVER)]);
        disp(['TNA = ',num2str(TNA),'; TND = ',num2str(TND),'; TNE = ',num2str(TNE)]);
        disp(['LQ = ',num2str(LQ),'; NEE = ',num2str(NEE),'; NES = ',num2str(NES),'; TQT = ',num2str(TQT)]);         
        disp([num2str(QUEUE)]); 
            
     endwhile  
     disp(['']);
     disp(['Tiempo total en tierra = ',num2str(TWAIT)]);
     #disp(['TQT_P = ',num2str(TQT/NES)]);  %Tiempo en cola promedio
     disp(['Tiempo de uso del servidor = ', num2str(TS)]); 
     #disp(['TS_P = ',num2str(TS*100/CLOCK)]);   %Tiempo de uso de servidor promedio
     #disp(['TA = ',num2str(TA)]);  %Tiempo entre arribos  
     #disp(['TA_P = ',num2str(TA/NES)]);  %Tiempo entre arribos promedio
     plot(SS(:,1),SS(:,2));
endfunction