%Parte I

%% Desenho do polígono de N lados

clear all 
close all

N = 4;
v = zeros(2, N+1);
v(1,1) = 1;
v(2,1) = 1;
theta = 2*pi/N;
Mrot = [cos(theta), sin(theta) ; -sin(theta), cos(theta)];
for i = 2:N+1
    v(:,i) = Mrot * v(:,i-1);
end
plot(v(1,:), v(2,:), '-k')
axis([-2,2,-2,2])
axis square
grid on


%% Translação

M = eye(2); %Matriz identidade (2,2)
u = [3;3];
for i=1:N+1
    v_linha(:,i )= M * v(:,i) + u;
end
plot(v(1,:),v(2,:),'-b',v_linha(1,:),v_linha(2,:),'-r')
axis([-5,5,-5,5])
axis square
grid on


%% Rotação

theta = pi/6;
M = [cos(theta), sin(theta) ; -sin(theta), cos(theta)];
u = [0;0];
for i=1:N+1
    v_linha(:,i)= M * v(:,i) + u;
end
plot(v(1,:),v(2,:),'-b',v_linha(1,:),v_linha(2,:),'-r')
axis([-5,5,-5,5])
axis square
grid on


%% Ampliação/Redução

M = [2,0;0,0.5]; %Alterar os valores da diagonal da matriz para qq outro valor
u = [0;0];
for i=1:N+1
    v_linha(:,i)= M * v(:,i) + u;
end
plot(v(1,:),v(2,:),'-b',v_linha(1,:),v_linha(2,:),'-r')
axis([-5,5,-5,5])
axis square
grid on


%% Distorção

M = [1,0.2;0.2,1]; %Alterar os valores dos 0's para qq outro valor
u = [0;0];
for i=1:N+1
    v_linha(:,i)= M * v(:,i) + u;
end
plot(v(1,:),v(2,:),'-b',v_linha(1,:),v_linha(2,:),'-r')
axis([-5,5,-5,5])
axis square
grid on



%Parte II

%% Transformação do Padeiro

N = 10000; % nº pontos q pretendo gerar
R = rand(2,N); % gera matriz (2,N) pertencente a ]0,1[
x = R(1,:);
y = R(2,:);
azul = (y < 0.5);
vermelho = (y >= 0.5);
plot(x(azul),y(azul),'.b',x(vermelho),y(vermelho),'.r') % gera pontos azuis até y = 0.5 e vermelhos até y =1

M = [2,0;0,0.5];
T = [-1;0.5];
pos = round(rand(1,1) * N); % gera a partícula que se pretende seguir
for p = 1:20
    for i=1:N
        xp(p) = x_linha(pos);
        yp(p) = y_linha(pos);
        xi = R(1,i);
        if xi < 0.5
            R_linha(:,i) = M * R(:,i);
        else 
            R_linha(:,i) = M * R(:,i) + T;
        end
    end
    x_linha = R_linha(1,:);
    y_linha = R_linha(2,:);
    R = R_linha;
    plot(x_linha(azul),y_linha(azul),'.b',x_linha(vermelho),y_linha(vermelho),'.r',xp,yp,'-k')
    pause(1);
end