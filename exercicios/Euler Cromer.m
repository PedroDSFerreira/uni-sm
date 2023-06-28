close all
clear all

L=1;

xE=0;
xD=3*L;

% condições iniciais
x01=L;
x02=2*L;

v01=1;
v02=-1;

%constantes
K=10;
m=1;

% tempo
dt=0.1;
ti=0; tf=20;

t=ti:dt:tf;
N=length(t);

% Método de Euler-Cromer
% v(k+1)=v(k)+F/m*dt;
% x(k+1)=x(k)+v(k+1)*dt;

x1(1)=x01; v1(1)=v01;
x2(1)=x02; v2(1)=v02;

for k=1:N-1
    F1=-K/m*(x1(k)-L-xE)-K/m*((x1(k)-L-xE)-(x2(k)-2*L-xE));
    v1(k+1)=v1(k)+F1/m*dt;
    x1(k+1)=x1(k)+v1(k+1)*dt;
    
    F2=-K/m*((x2(k)-2*L-xE)-(x1(k)-L-xE))-K/m*(x2(k)-2*L-xE-(xD-3*L));
    v2(k+1)=v2(k)+F2/m*dt;
    x2(k+1)=x2(k)+v2(k+1)*dt;
    if (rem(k,10)==0)
    figure(1)
    subplot(2,1,1)
    plot([xE x1(k+1)],[0,0],'-k')
    hold on
    plot([x1(k+1) x2(k+1)],[0,0],'-k')
    plot([x2(k+1) xD],[0,0],'-k')
    plot(x1(k+1),0,'.b','MarkerSize',50)
    plot(x2(k+1),0,'.r','MarkerSize',50)
    pause(0.01)
    hold off
    subplot(2,1,2)
    plot(t(1:k+1),x1,'-b')
    hold on
    plot(t(1:k+1),x2,'-r')
    hold off
    end
    
end
figure(2)
plot(t,x1,t,x2)