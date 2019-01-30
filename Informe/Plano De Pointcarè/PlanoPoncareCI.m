%vx= 0.3

P1 = xlsread('PlanoPointcareCI.xlsx','K33:K33')
P2 = xlsread('PlanoPointcareCI.xlsx','L33:L33')

%vx= 0.5

P3 = xlsread('PlanoPointcareCI.xlsx','H33:H40')
P4 = xlsread('PlanoPointcareCI.xlsx','I33:I40')

%vx= 1

P5 = xlsread('PlanoPointcareCI.xlsx','E33:E68')
P6 = xlsread('PlanoPointcareCI.xlsx','F33:F68')

%vx= 2

P7 = xlsread('PlanoPointcareCI.xlsx','B33:B61')
P8 = xlsread('PlanoPointcareCI.xlsx','C33:C61')

%vx= 3.08

P9 = xlsread('PlanoPointcareCI.xlsx','B10:B28')
P10 = xlsread('PlanoPointcareCI.xlsx','C10:C28')

%vx= 3.2

P11 = xlsread('PlanoPointcareCI.xlsx','E10:E27')
P12 = xlsread('PlanoPointcareCI.xlsx','F10:F27')

%vx= 3.6

P13 = xlsread('PlanoPointcareCI.xlsx','H10:H22')
P14 = xlsread('PlanoPointcareCI.xlsx','I10:I22')

%vx= 4

P15 = xlsread('PlanoPointcareCI.xlsx','K10:K18')
P16 = xlsread('PlanoPointcareCI.xlsx','L10:L18')

%vx= 4.5

P17 = xlsread('PlanoPointcareCI.xlsx','N10:N13')
P18 = xlsread('PlanoPointcareCI.xlsx','O10:O13')

figure
ax1 = subplot(2,2,1);
scatter(ax1,P1,P2,'black')
title('Plano Pointcarè')
xlabel('Coordenada y (10^5)')
ylabel('Coordenada z')
legend('v_x = 0.3e^3')

ax2 = subplot(2,2,2);
scatter(ax2,P3,P4,'red')
xlabel('Coordenada y (10^5)')
ylabel('Coordenada z')
legend('v_x = 0.5e^3')

ax3 = subplot(2,2,3);
scatter(ax3,P5,P6,'cyan')
xlabel('Coordenada y (10^5)')
ylabel('Coordenada z')
legend('v_x = 1e^3')

ax4 = subplot(2,2,4);
scatter(ax4,P7,P8,'blue')
xlabel('Coordenada y (10^5)')
ylabel('Coordenada z')
legend('v_x = 2e^3')


figure
ax11 = subplot(2,2,1);
scatter(ax11,P9,P10,'black')
title('Plano Pointcarè')
xlabel('Coordenada y (10^5)')
ylabel('Coordenada z')
legend('v_x = 3.08e^3')

ax21 = subplot(2,2,2);
scatter(ax21,P11,P12,'red')
xlabel('Coordenada y (10^5)')
ylabel('Coordenada z')
legend('v_x = 3.2e^3')

ax31 = subplot(2,2,3);
scatter(ax31,P13,P14,'cyan')
xlabel('Coordenada y (10^5)')
ylabel('Coordenada z')
legend('v_x = 3.6e^3')

ax41 = subplot(2,2,4);
scatter(ax41,P15,P16,'blue')
xlabel('Coordenada y (10^5)')
ylabel('Coordenada z')
legend('v_x = 4e^3')


figure
scatter(P3,P4,'red')
hold on
scatter(P5,P6,'blue')
hold on
scatter(P7,P8,'green')
hold on
scatter(P9,P10,'cyan')
hold on
scatter(P15,P16,'m')
hold on
scatter(P17,P18,'black')
title('Plano Pointcarè')
xlabel('Coordenada y (10^5)')
ylabel('Coordenada z')
legend('v_x = 0.5e^3','v_x = 1e^3','v_x = 2e^3','v_x = 3.08e^3','v_x = 4e^3','v_x = 4.5e^3')
