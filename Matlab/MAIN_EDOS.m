clc

%% Variables

t0 = 1;
tf = 2*365.25*24*3600;
nbodys = 3;
n = 25000;

%% Body of Cauchy Problem

for i=0:n
    t =  t0 + (tf-t0) * i / n;
end

%% Condiciones iniciales para sistema Tierra-Luna-Satélite

U0 = [ 0. ,0. , ...             %POSICIÓN X-Y DE LA TIERRA          
           3.84e8 , 0. , ...        %POSICIÓN X-Y DE LA LUNA
           0.  , - 5e7 , ...        %POSICIÓN X-Y DEL SATÉLITE
           0. , -10. , ...          %VELOCIDAD EN X-Y DE LA TIERRA
           0. , 1e3 , ...           %VELOCIDAD EN X-Y DE LA LUNA
           3.e3, 0. ];              %VELOCIDAD EN X-Y DEL SATÉLITE

%% Condiciones iniciales para sistema Sol-Tierra-Luna-Marte

% U(0.,:) = [ 1.5e11 ,0. , ...         %POSICIÓN X-Y DE LA TIERRA
%             1.5e11 , -3.84e8 , ...   %POSICIÓN X-Y DE LA LUNA
%             2.3e11 , 0. , ...        %POSICIÓN X-Y DE MARTE
%             0. , 0. , ...            %POSICIÓN X-Y DEL SOL
%             0. , 30.e3 , ...         %VELOCIDAD EN X-Y DE LA TIERRA
%             1.e3 , 30.e3 , ...       %VELOCIDAD EN X-Y DE LA LUNA
%             0. , 24.e3 , ...         %VELOCIDAD EN X-Y DE MARTE
%             0., 0. ];                %VELOCIDAD EN X-Y DEL SOL
    
%% Llamada a Cauchy_Problem

Cauchy(U0, @N_bodys2D, @Runge_Kutta2, @Time_Domain, t, n) 

%% Plots para sistema Tierra-Luna-Satélite

plot (U(:,3)/1.E6, U(:,4)/1.E6, R )
hold on
plot (U(:,1)/1.E6, U(:,2)/1.E6, C)
hold on
plot (U(:,5)/1.E6, U(:,6)/1.E6, W)
xlabel('X 10^6')
ylabel('Y 10^6')
title('POSICION DE LA TIERRA-LUNA-SATELITE')
legend (['POSICION LUNA', 'POSICION TIERRA', 'POSICION SATELITE'])
plot (t,U(:,8))
plot (t,U(:,11))

%% Plots para sistema Sol-Tierra-Luna-Marte

% plot (U(:,5)/1.E6, U(:,6)/1.E6, R) 
% hold on
% plot (U(:,1)/1.E6, U(:,2)/1.E6, C) 
% hold on
% plot (U(:,3)/1.E6, U(:,4)/1.E6, W) 
% hold on
% plot (U(:,7)/1.E6, U(:,8)/1.E6, Y) 
% xlabel('X 10^6')
% ylabel('Y 10^6')
% title('POSICION DE LA TIERRA-LUNA-MARTE-SOL')
% legend (['POSICION MARTE', 'POSICION TIERRA', 'POSICION LUNA', 'POSICION SOL'])

