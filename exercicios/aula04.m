clear all
close all


    
%% Parte I
    n = 4;
    teta = (2 * pi)/n;      %ângulos internos do polígono
    vetor = [-1,0];
    p = [1,1];             %matriz com as coordenadas de um dos vértices
    mtx = [cos(teta), -sin(teta); sin(teta), cos(teta)]; %matriz mudança de base
    angle = 0:pi/100:2*pi;

    for count = 2:n+1
        p(count, :) = p(count-1,:) + vetor;
        vetor = vetor * mtx;
        
    end
    trans = p';                   %matriz transposta
    x = trans(1,:);       
    y = trans(2,:);
    
    plot(x,y,"o-k")
    
    
    %% Translação
    
        v_translation = [1,1];
        
        for i = 0:5
            plot(x+i,y+i,"o-k")
            axis([-2 11 -2 8])
            pause(1)
            
        end

    %% Rotação
        alfa = pi/6;
        mtx_2 = [cos(alfa), -sin(alfa); sin(alfa), cos(alfa)];
        p_copia = p;
        plot(x,y,"o-k")
        axis ([-10 12 -10 12])
        pause(1)
        for i = 0:5
            p_copia = p_copia * mtx_2;
            trans_2 = p_copia';
            x_2 = trans_2(1,:);
            y_2 = trans_2(2,:);
            plot(x_2, y_2, "o-k")
            axis ([-10 12 -10 12])
            grid on
            
            pause(1)
            
        end

	%% Ampliação
        M = [3 0; 0 1];
        i = M*trans;
        i_3 = i';
        x_3 = i_3(1,:);
        y_3 = i_3(2,:);
        plot(x_3,y_3,"o-k")
        
    %% Redução
    
    
    
    
    
    
    %% Distorção
    
    
    
    
    
%% Parte II

% a)

    M_=[2,0;0,1/2];
    N = 2000;
    R = rand(2,N);
    M_blue = [];
    M_red = [];
    x_ = R(:,1);
    y_ = R(:,2);
    %plot(x_,y_,".")
    axis([0 1.2 0 1.2])


    for i = 1:length(R)
        blue = length(M_blue);
        red = length(M_red);
        if R(2,i)<0.5
            M_blue(:,blue+1) = R(:,i);
        else
            M_red(:,red+1) = R(:,i);
        end
    end



    M_A2 = [2,0;0,1/2];
    M_Translacao = [-1;1/2];


    for i = 1:20

        plot(M_blue(1,:),M_blue(2,:),'.b')
        hold on
        plot(M_red(1,:),M_red(2,:),".r")
        hold off
        axis([0 2 0 2])
        pause(1)      

        M_blue =  M_A2*M_blue ;
        M_red = M_A2*M_red  ;

        plot(M_blue(1,:),M_blue(2,:),'.b')
        hold on
        plot(M_red(1,:),M_red(2,:),".r")
        hold off
        axis([0 2 0 2])
        pause(1)      



        for j = 1:length(M_blue)
            if M_blue (1,j) >= 1
                M_blue(:,j) = M_blue(:,j) + M_Translacao;
            end
        end
        for k = 1:length(M_red)
            if M_red (1,k) >= 1
                M_red(:,k) = M_red(:,k) + M_Translacao;

            end
        end
    end



                
                
                
                
                
                
                
                
                