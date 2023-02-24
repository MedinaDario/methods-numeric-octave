function SiMec2()
disp('  -"SIMULACION DE UN SISTEMA MECANICO (Resorte-Amortiguador)-"-')
disp('---------------------------------------')
fprintf('\n');

%Ingreso de Datos
disp('  -"DATOS DE LA SIMULACION"-')
fprintf('\n');
A=input('Ingresar fuerza del resorte (parametro A): ');
B=input('Ingresar fuerza del amortiguador (parametro B): ');
   T(1)=0;
%M: Masa
P=1000;  %% Peso del cuerpo
M=P/9.8;     
h=0.5;  %% Paso de la simulacion
d=100 ; %% Duracion de la simulacion

dpos=0; %desplazamiento maximo
tdpos=0; %tiempo desplazamiento maximo
dneg=0; %desplazamiento minimo
tdneg=0; %momento desplazamineto minimo
vpos=0; %velocidad maxima
tvpos=0; %tiempo velocidad maxima
vneg=0; %velocidad negativa
tvneg=0; %momento velocidad minima
f=inline('x2','t','x1','x2');
g=inline('co1-co2*x2-co3*x1','t','x1','x2','co1','co2','co3');

ls=d/h;
x1=0;  %% desplazamiento inicial 
x2=0;  %%  velocidad inicial
Y(:,1)=[x1;x2];
wti=0;
fid=fopen('d:\mecanico.txt','w');
for  t=0:ls
   if t < 1 
       co1=5*9.8/P;
   else 
       co1=0; 
   endif
   
   co2=(B*9.8/P);
   co3=(A*9.8/P);

   k11=h*f(t,x1,x2);
   k21=h*g(t,x1,x2,co1,co2,co3);

   k12=h*f(t+h*.5,x1+k11/2,x2+k21*0.5);
   k22=h*g(t+h*.5,x1+k11/2,x2+k21*0.5,co1,co2,co3);

   k13=h*f(t+h*.5,x1+k12/2,x2+k22*0.5);
   k23=h*g(t+h*.5,x1+k12/2,x2+k22*0.5,co1,co2,co3);
    
   k14=h*f(t+h,x1+k13,x2+k23);
   k24=h*g(t+h,x1+k13,x2+k23,co1,co2,co3);

   x1=x1+(k11+2*k12+2*k13+k14)/6;
   x2=x2+(k21+2*k22+2*k23+k24)/6;
   
    if mod(t,10)==0
        %fprintf('T %3.1f  Desp: %3.4f      Vel:%3.4f',t/10 ,x1 ,x2)
        fprintf(fid,'%f\t%f\t%f\n',t,x1,x2);     
        fprintf('\n');    
        wti=wti+1;    
        Y(1,wti+1)=x1;
        Y(2,wti+1)=x2;
        T(wti+1)=wti;
    end
    
    #Instante 50 de tiempo
    if(t == 50)
      t
      x1
      x2
    endif
    
    if x1>dpos
       dpos=x1;
       tdpos=t/10;
    endif
    %%%% Desplazamiento Negativo
    if x1<dneg
       dneg =x1;
       tdneg=t/10;
    endif
    %%%  Velocidad Positiva
    if x2>vpos
       vpos=x2;
       tvpos=t/10;
    endif
    %%%  Velocidad Negativa
    if x2<vneg
       vneg=x2;
       tvneg=t/10;
    endif
endfor 
fclose(fid);

    %Presentacion de los resultados
fprintf('\n');
fprintf('\n');
disp(' -"RESULTADOS"- ');
fprintf('\n');
fprintf(' Desplazamiento maximo: %3.4f',dpos);
disp(' metros; ');
fprintf(' Producido a los: %3.1f',tdpos);
disp(' segundos ');
fprintf('\n');
fprintf('\n');
fprintf(' Desplazamiento minimo: %3.4f',dneg);
disp(' metros; ');
fprintf(' Producido a los: %3.1f',tdneg);
disp(' segundos ');
   fprintf('\n');
    fprintf('\n');
    fprintf(' Velocidad maxima: %3.4f',vpos);
    disp(' m/s; ');
    fprintf(' Producida a los: %3.1f',tvpos);
    disp(' segundos ');
    fprintf('\n');
    fprintf('\n');
    fprintf(' Velocidad minima: %3.4f',vneg);
    disp(' m/s; ');
    fprintf(' Producida a los: %3.1f',tvneg);
    disp(' segundos ');
    %Graficacion de resultados
    plot(T,Y(1,:),'-',T,Y(2,:),':');
    xlabel('Tiempo en segundos');ylabel('Desplazamiento y Velocidad');
   axis('auto');
    fprintf('\n');