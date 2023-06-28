clear all
close all
clc
% posição inicial da bola
x0=0.5; y0=10; v0x=0; v0y=0; g=9.8;

%superficie
alfa=2; %entre 1 e 5

ti=0; t0=0.7; prec=1e-8; 
%numero de colisoes
Nc=100;
%deteminar instante de colisão
tf=newton(t0, prec,x0,y0,v0x,v0y,alfa,g);

%pfixo(lambda,t0, prec,x0,y0,v0x,v0y,alfa,g);


for i=1:Nc
 % fazer animacao
 dt=tf/20;
for t=ti:dt:tf
x=v0x*t+x0; y=y0+v0y*t-0.5*g*t^2;
vx=v0x; vy=v0y-g*t;
superf(alfa,x,y);
end

% fazer a colisão
% direcao da normal
grad=[2*alfa*x-4*x^3, 1];
grad=grad/norm(grad);
hold on
quiver(x,y,grad(1),grad(2),0,'b');
v=[vx;vy];
nv=norm(v);
quiver(x,y,vx/nv,vy/nv,0,'r')

vn=grad * v;% componente segundo a normal
vp=[grad(2),-grad(1)]*v; % componente segundo a tangente
vn=-vn; % refletir segundo a normal
v=vn*grad'+vp*[grad(2);-grad(1)];

 vx=v(1); vy=v(2);
 nv=norm(v);
quiver(x,y,vx/nv,vy/nv,0,'k')
hold off
title(['colisão ' num2str(i)])
pause(0.5)

% calcula o proximo instante de colisão
x0=x; y0=y; v0x=v(1); v0y=v(2);
tf=pesquisa_grosseira(0, 0.01,x0,y0,v0x,v0y,alfa,g);
tf=newton(tf, prec,x0,y0,v0x,v0y,alfa,g);

end


function t=pesquisa_grosseira(t0, prec,x0,y0,v0x,v0y,alfa,g)
t=t0+prec;
d=dist(x0,y0,v0x,v0y,alfa,t,g);
 while d>0
     t=t+prec;
     d=dist(x0,y0,v0x,v0y,alfa,t,g);
 end

end


function superf(alfa,x,y)
xs=-2:0.01:2;
ys=-alfa*xs.^2+xs.^4+6;
figure(1)
plot(xs,ys,'b-',x,y,'ro')
axis([min(xs), max(xs), min(ys)-0.2*max(ys), max(ys)])
axis off
axis square
drawnow
hold on
end

function [dy,der]=dist(x0,y0,v0x,v0y,alfa,t,g)
x=v0x*t+x0;
dy=y0+v0y*t-0.5*g*t^2+alfa*x^2 -x^4-6;
der=v0y-g*t+2*alfa*x*v0x-4*x^3*v0x;
end


function tn=newton(tn, prec,x0,y0,v0x,v0y,alfa,g)
dy=10000; der=1;
% ni=0;
while(abs(dy)>prec ) % && ni<10000
% ni=ni+1;
[dy,der]=dist(x0,y0,v0x,v0y,alfa,tn,g);
tn=tn-dy/der;

end
end


