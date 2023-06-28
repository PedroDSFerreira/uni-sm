
%Trabalho realizado por:
    %Pedro Ferreira; nº98620
    %João Vieitas; nº97632

%% Variáveis

    %correr antes de cada exercício
    clear all
    close all
    clc

    
    dt = 0.1;
    v = [-5+10.*rand(1,1); -5+10.*rand(1,1)];
    a = 20;
    b = 10;
    r = [a/2; b/2];
    R = 0.5;
    deltat = 20;
    
%% Parte I

% Exercício 1

    animacao(r,v,a,b,R,dt,deltat)

%% Exercício 2

    % parede 1 --> x=0
    % parede 2 --> x=a
    % parede 3 --> y=0
    % parede 4 --> y=b

    %matriz com as equações de tempo de colisão com as paredes 1, 2,
    %3 e 4, respetivamente

    deltat_parede = [(R-r(1))/v(1) (a-R-r(1))/v(1) (R-r(2))/v(2) (b-R-r(2))/v(2)];

    deltat_parede(deltat_parede<=4*eps)=1000;

    [deltat_, parede] = min(deltat_parede)

%% Exercício 3

    %matriz com vetores unitários de cada parede
    ep = [[1;0] [-1;0] [0;1] [0;-1]];
    ti = 0;
    t_max = 100;

    while (ti < t_max)

        deltat_parede =  [(R-r(1))/v(1) (a-R-r(1))/v(1) (R-r(2))/v(2) (b-R-r(2))/v(2)];

        
        deltat_parede(deltat_parede<=4*eps)=1000;

        [delta_t, parede] = min(deltat_parede)

        animacao(r,v,a,b,R,dt,delta_t)
        r = r+v*delta_t;
        v = v-2*dot(v,ep(:, parede))*ep(:, parede); 
        ti = ti+delta_t;
    end

%% Parte II

    r2 = [3, 4; 5, 1];

    %duas velocidades aleatórias com distribuição Gaussiana e com desvio padrão=5
    v2 = randn(2,2)*5; 

    animacao(r2,v2,a,b,R,dt,deltat)

%% Exercício 4

    %sete posições aleatórias com desvio padrão igual a a-(2*R) e b-(2*R) para o 
    %eixo do x e y, respetivamente
    r3(1,:) = rand(1,7)*(a-(2*R))+R;
    r3(2,:) = rand(1,7)*(b-(2*R))+R;

    %sete velocidades aleatórias com distribuição Gaussiana e com desvio padrão=5
    v3 = randn(2,7)*5;

    ep2 = [[1;0] [-1;0] [0;1] [0;-1]];
    intervalo = 0;

    while intervalo < deltat
        [particula, delta_t, parede] = choque_parede(r3, v3, R, a, b)

        animacao(r3,v3,a,b,R,dt,delta_t)
        intervalo = intervalo + delta_t;
        r3 = r3+v3*delta_t;
        v3(:,particula)=v3(:,particula)-2*dot(v3(:,particula),ep2(:,parede))*ep2(:,parede);
    end

%% Parte III

    %seis posições aleatórias com desvio padrão igual a a-(2*R) e b-(2*R) para o 
    %eixo do x e y, respetivamente
    r4(1,:) = rand(1,6)*(a-(2*R))+R;
    r4(2,:) = rand(1,6)*(b-(2*R))+R;
    
    %seis velocidades aleatórias com distribuição Gaussiana e com desvio padrão=5
    v4 = randn(2,6)*5;
    
    ti = 0;
    tmax = 100;
    ep = [[1;0],[-1;0],[0;1],[0;-1]];
    
    while ti < tmax
        [particula1, particula2, tmin1] = choque_particulas(r4, v4, R);
        [particula, tmin, parede] = choque_parede(r4,v4,R,a,b);
        
        if tmin < tmin1
            animacao(r4,v4,a,b,R,dt,tmin)
            
            r4 = r4+v4*tmin;
            v4(:,particula)=v4(:,particula)-2*dot(v4(:,particula),ep(:,parede))*ep(:,parede);
            ti=ti+tmin;

        else
            animacao(r4,v4,a,b,R,dt,tmin1)
            
            r4 = r4+v4*tmin1;
            
            x=(dot(v4(:,particula1)-v4(:,particula2),r4(:,particula1)-r4(:,particula2)))/(4*R^2)*(r4(:,particula1)-r4(:,particula2));
            v4(:,particula1)=v4(:,particula1)-x;
            v4(:,particula2)=v4(:,particula2)+x;
            ti=ti+tmin1;
        end
    end
    
%% Parte IV

    %força média exercida pelas partículas nas paredes do recipiente ao longo de um intervalo de
    %tempo longo

    %sete posições aleatórias com desvio padrão igual a a-(2*R) e b-(2*R) para o 
    %eixo do x e y, respetivamente
    r5(1,:) = rand(1,7)*(a-(2*R))+R;
    r5(2,:) = rand(1,7)*(b-(2*R))+R;

    %sete velocidades aleatórias com distribuição Gaussiana e com desvio padrão=5
    v5 = randn(2,7)*5;

    ep5 = [[1;0] [-1;0] [0;1] [0;-1]];
    t = 0;
    tmax = 500;
    forca = 0;
    
    while t < tmax
        [particula, delta_t, parede] = choque_parede(r5, v5, R, a, b);
        
        v5(:,particula)=v5(:,particula)-2*dot(v5(:,particula),ep5(:,parede))*ep5(:,parede);
        forca = forca + abs((-2*dot(v5(:,particula),ep5(:,parede))/delta_t));
        r5 = r5+v5*delta_t;
        t = t + delta_t;
    end
    
    forca 
    
    