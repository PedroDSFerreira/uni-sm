clear all
close all
clc


    A1 = [0,0;0,0.16];
    b1 = [0;0];

    A2 = [0.2,-0.26;0.23,0.22];
    b2 = [0;1.6];

    A3 = [-0.15,0.28;0.26,0.24];
    b3 = [0;0.44];

    A4 = [0.85,0.04;-0.04,0.85];
    b4 = [0;1.6];
    
    v = [0;0];
    N = 100000;
    
    
    for n = 1:N-1
    	num = rand(1);
        num_2 = rand(1);
        

        if num <= 0.01
            A = A1;
            b = b1;
            v(:,n+1) = A*v(:,n) + b;
            plot(v(1,n+1),v(2,n+1),'.c')
        elseif num <= 0.07
            if num_2 <= 0.5
                A = A2;
                b = b2;
                v(:,n+1) = A*v(:,n) + b;
                plot(v(1,n+1),v(2,n+1),'.r')
            else
                A = A3;
                b = b3;
                v(:,n+1) = A*v(:,n) + b;
                plot(v(1,n+1),v(2,n+1),'.b')
            end
        else
            A = A4;
            b = b4;
            v(:,n+1) = A*v(:,n) + b;
            plot(v(1,n+1),v(2,n+1),'.g')
        end

        hold on
    
    end


% s='X';
% for n=1:6
%     s=substituicao(s);
%     io=0; n=length(s);
%     a=pi*80/180; % angulo inicial
%     r=[0;0]; % posição inicial
%     graficoPlanta(s,a,r,io);
%     axis equal; hold off; pause(1)
% end
%     
% function sn=substituicao(s)
%     n=length(s); ic=0;
%     xs='F+[[X]-X]-F[-FX]+X'; fs='FF';
%     for i=1:n
%         if(s(i)=='X')
%             sn(ic+1:ic+18)=xs;
%             ic=ic+18;
%         elseif s(i)=='F'
%             sn(ic+1:ic+2)=fs;
%             ic=ic+2;
%         else
%             sn(ic+1)=s(i);
%             ic=ic+1;
%         end
%     end
% end
%     
% function [i]=graficoPlanta(s,a,r,io)
%     figure(1); n=length(s);
%     i=io; % para saber em que ponto vai na interpretação da string
%     while (i<n)
%         i=i+1;
%         if(s(i)=='F')
%             rn=[cos(a);sin(a)];
%             plot([r(1),r(1)+rn(1)],[r(2),r(2)+rn(2)],'g-')
%             drawnow; hold on
%             r=r+rn;
%         elseif s(i)=='-'
%             a=a-pi*25/180;
%         elseif s(i)=='+'
%             a=a+pi*25/180;
%         elseif s(i)=='['
%             i=graficoPlanta(s,a,r,i); % inicia arepresentação de um ramo; usa-se recursividade
%         elseif s(i)==']'
%         return % a função termina e volta a representar o ramo anterior se for caso disso
%         end
%     end
% end