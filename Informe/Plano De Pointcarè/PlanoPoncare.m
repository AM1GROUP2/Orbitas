
%T

P1 = xlsread('PlanoPointcare.xlsx','B6:B6')
P2 = xlsread('PlanoPointcare.xlsx','C6:C6')

%2T

P3 = xlsread('PlanoPointcare.xlsx','B10:B12')
P4 = xlsread('PlanoPointcare.xlsx','C10:C12')

%5T

P5 = xlsread('PlanoPointcare.xlsx','B24:B32')
P6 = xlsread('PlanoPointcare.xlsx','C24:C32')

%10T

P7 = xlsread('PlanoPointcare.xlsx','F10:F28')
P8 = xlsread('PlanoPointcare.xlsx','G10:G28')

%100T

P9 = xlsread('PlanoPointcare.xlsx','F33:F227')
P10 = xlsread('PlanoPointcare.xlsx','G33:G227')

%500T

P11 = xlsread('PlanoPointcare.xlsx','I17:I1008')
P12 = xlsread('PlanoPointcare.xlsx','J17:J1008')

%800T

P13 = xlsread('PlanoPointcare.xlsx','L17:L1757')
P14 = xlsread('PlanoPointcare.xlsx','M17:M1757')




% scatter(P1,P2)
% title('Plano Pointcarè')
% xlabel('Coordenada y (10^5)')
% ylabel('Coordenada z')
% legend('T')

figure
ax1 = subplot(2,2,1);
scatter(ax1,P1,P2,'black')
title('Plano Pointcarè')
xlabel('Coordenada y (10^5)')
ylabel('Coordenada z')
legend('T')

ax2 = subplot(2,2,2);
scatter(ax2,P3,P4,'red')
xlabel('Coordenada y (10^5)')
ylabel('Coordenada z')
legend('2T')

ax3 = subplot(2,2,3);
scatter(ax3,P5,P6,'cyan')
xlabel('Coordenada y (10^5)')
ylabel('Coordenada z')
legend('5T')

ax4 = subplot(2,2,4);
scatter(ax4,P7,P8,'blue')
xlabel('Coordenada y (10^5)')
ylabel('Coordenada z')
legend('10T')


figure
ax11 = subplot(2,2,1);
scatter(ax11,P9,P10,'blue')
title('Plano Pointcarè')
xlabel('Coordenada y (10^5)')
ylabel('Coordenada z')
legend('100T')

ax12 = subplot(2,2,2);
scatter(ax12,P11,P12,'red')
xlabel('Coordenada y (10^5)')
ylabel('Coordenada z')
legend('500T')

ax13 = subplot(2,2,[3,4]);
scatter(ax13,P13,P14,'black')
xlabel('Coordenada y (10^5)')
ylabel('Coordenada z')
legend('800T')





