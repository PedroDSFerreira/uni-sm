%% Variáveis:

close all
clear all
                
        n = 4;                  %número de lados
        %alterar variável n para obter polígonos regulares com nºo de lados diferentes
                
    % a)
        
        a = 0:(2*pi)/n:2*pi;   
        c = [0,0];              %centro da circunferência
        r = 2;                  %raio  %coordenadas vértice: [2,0]              

    % b)
        
        vect = [2,2];           %vetor translação

    % c)
    
        ang = 0;                %ângulo de rotação (inicial)
        
    % d)

        teta = (2 * pi)/n;      %ângulos internos do polígono
        vetor = [2,2];
        p1 = [5,5];             %coordenadas de um dos vértices
        mtx = [cos(teta), sin(teta); -sin(teta), cos(teta)]; %matriz mudança de base
        angle = 0:pi/100:2*pi;
        
    % e)
    
        alfa = 0;               %ângulos de rotação (inicial)
        beta = 0;               %
        a1 = 0:pi/100:2*pi;
        x = 2 * cos(a1);        %centro:(0,0)
        y = 2 * sin(a1);      

% Algoritmo 1:

%% a)
    
    x1 = r * cos(a) + c(1);     %abcissa da circunferência
    y1 = r * sin(a) + c(2);     %ordenada da circunferência
    plot(x1,y1,'k')

%% b)

    for t = 0:1:5
        x = x1 + (vect(1) * t);
        y = y1 + (vect(2) * t);

        plot(x,y)
        axis([-2 12 -2 12])
        hold on
        pause(1)

    end

%% c)

    for t = 0:1:5
        b = ang:(2*pi)/n:2*pi+ang;
        x2 = r * cos(b) + c(1); %abcissa da circunferência
        y2 = r * sin(b) + c(2); %ordenada da circunferência

        x = x2 + (vect(1) * t);
        y = y2 + (vect(2) * t);

        plot(x,y)
        axis([-2 12 -2 12])

        ang = ang + (pi/6);
        hold on
        pause(1)

    end

% Algoritmo 2:

%% d)

    for count = 0:1:(n-1)
        p1 = p1 + vetor;
        vetor = vetor * mtx;

        quiver(p1(1), p1(2), vetor(1), vetor(2),0,'o-k')
        hold on
    end
%% e)

    while 1
        for a1 = 0:pi/100:2*pi
           b = alfa:(2*pi)/n:(2*pi)+alfa; 
           c = beta: (2*pi)/n: 2*pi+beta;
           plot(x,y,'--')
           axis([-3 3 -3 3])
           hold on
           cx = 2 * cos(a1) ; 
           cy = 2 * sin(a1) ;
           x1 = 0.5 * cos(b) + cx;
           y1 = 0.5 * sin(b) + cy;
           x2 = 0.7 * cos(c) ;
           y2 = 0.7 * sin(c) ;
           fill(x1,y1,'b')
           fill(x2,y2,'r')
           hold off
           pause(0.05)
           alfa = alfa + pi/100;%ângulo por segundo(vel. angular)
           beta = beta + 1;     %ângulo qualquer
        end
    end