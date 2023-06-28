close all
clear all


%% Passo 1: Representação da Superfície
% A superfície obedece à equação y = -alfa*x^2+x^4+6. Defina uma função que use
% alfacomo parâmetro de entrada e represente a superfície num gráfico. 

x=linspace(-2.5,2.5,100);
alfa=2;

y=superficie(x,alfa);


%% Passo 2: Defina a função diferença entre as ordenadas da trajectória da bola e as ordenadas dos pontos da superfície
% Escreva as equações para a trajectória da bola sujeita à ação da
% gravidade. Defina, para um mesmo valor de x a diferença entre as
% ordenadas da trajectória e a equação da superfície. Obtenha uma expressão
% que só dependa de t e cujo zero represente a colisão da bola com a
% superfície. Nota: deve assumir que conhece a posição inicial da bola e a
% sua velocidade inicial.   

t=0:0.1:3;

x0=1; y0=10;
v0x=-2; v0y=2;

g=9.81;

[dif]=diferenca(x0,y0,v0x,v0y,g,alfa,t);


plot(t,dif,'.-')
grid on
xlabel('tempo /s')
ylabel('y_B-y_S /m')


%% Passo 3: Crie uma função que implemente o método do ponto fixo 
% para determinar o instante em que se dá a colisão e depois o ponto da
% superfície em que ela ocorre. Repita usando o método de Newton. Comece
% por verificar que se x0=0, o seu programa calcula o ponto de contato
% corretamente.  

ti=grosseira(1e-5,x0,y0,v0x,v0y,g,alfa);
t_choque_pf=pontofixo(x0,y0,v0x,v0y,g,alfa,ti);
t_choque_nw=newton(x0,y0,v0x,v0y,g,alfa,ti);

delta_ts=t_choque_pf-t_choque_nw;

t_choque=t_choque_nw;

%% Passo 4: Produza uma animação até a bola colidir com a superfície.

Ncols=3;
for col=1:Ncols
    animacao(x0,y0,v0x,v0y,g,alfa,t_choque,x)
    [x0,y0,v0x,v0y]=calcula_vf(x0,y0,v0x,v0y,g,alfa,t_choque);
    
    ti=grosseira(1e-5,x0,y0,v0x,v0y,g,alfa);
    t_choque=newton(x0,y0,v0x,v0y,g,alfa,ti);
end

%% funções
function [x,y,vfx,vfy]=calcula_vf(x0,y0,v0x,v0y,g,alfa,t_choque)

x=x0+v0x*t_choque;
y=y0+v0y*t_choque-1/2*g*t_choque^2;

vx=v0x;
vy=v0y-g*t_choque;

% Determine o vector gradiente da função f(x,y)= y+alfa*x^2-x^4-6, no ponto
% da colisão 
grad_x=2*x*alfa-4*x.^3;
grad_y=1;

grad=[grad_x;grad_y];
v=[vx;vy];
n=grad/norm(grad); % normal à sup em cada ponto

norm_vn=dot(v,n);
vn=norm_vn*n;
vt=v-vn;

% após a colisão a bola tem vt igual mas vn simétrica
vn=-vn;
vt=vt;

vf=vn+vt;
vfx=vf(1); vfy=vf(2);
norm(vf)
norm(v)
hold on
quiver(x,y,grad_x,grad_y,'b')
quiver(x,y,vx,vy,'r')
quiver(x,y,vfx,vfy,'g')
end

function ti=grosseira(dt,x0,y0,v0x,v0y,g,alfa)
t=dt;
[dif]=diferenca(x0,y0,v0x,v0y,g,alfa,t);
while dif>0
    t=t+dt;
    [dif]=diferenca(x0,y0,v0x,v0y,g,alfa,t);
end
ti=t;
end

function animacao(x0,y0,v0x,v0y,g,alfa,t_choque,x)
dt=t_choque/20;
for t=0:dt:t_choque
    xB=x0+v0x*t;
    yB=y0+v0y*t-1/2*g*t.^2;
    superficie(x,alfa);
    hold on
    plot(xB,yB,'ob')
    pause(0.01)
    hold off
    
end
end

function t_choque=newton(x0,y0,v0x,v0y,g,alfa,t1)
% determinar o valor do tempo em que ocorre o choque usando o método do
% ponto fixo
dif1=diferenca(x0,y0,v0x,v0y,g,alfa,t1);
x=x0+v0x*t1;
der=v0y-g*t1+alfa*2*x*v0x-4*x^3*v0x; % derivada no ponto;
criterio=1e-8;

while dif1>criterio
    [dif1]=diferenca(x0,y0,v0x,v0y,g,alfa,t1);
    t1=t1-dif1/der;
end
t_choque=t1;
end

function t_choque=pontofixo(x0,y0,v0x,v0y,g,alfa,t1)
% determinar o valor do tempo em que ocorre o choque usando o método do
% ponto fixo
dif1=diferenca(x0,y0,v0x,v0y,g,alfa,t1);
criterio=1e-5;
lambda=0.1;
while dif1>criterio
    [dif1]=diferenca(x0,y0,v0x,v0y,g,alfa,t1);
    t1=t1-lambda*dif1;
    if (dif1)<diferenca(x0,y0,v0x,v0y,g,alfa,t1)
        lambda=-lambda/2;
    end
end
t_choque=t1;
end

function [dif]=diferenca(x0,y0,v0x,v0y,g,alfa,t)
xB=x0+v0x*t;
yB=y0+v0y*t-1/2*g*t.^2;
yS = -alfa*xB.^2+xB.^4+6;
dif=yB-yS;
end

function y=superficie(x,alfa)
y = -alfa*x.^2+x.^4+6;
figure(1)
plot(x,y)
ylim([min(y)-1 11])
end