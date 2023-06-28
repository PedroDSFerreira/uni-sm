clear all; close all; clc
s0='F+F+F+F+F'; n=length(s0);
sF='F+F-F-FF+F+F-F';
for iteracao=1:6
    v=grafico(s0);
    s0=substituicao(s0,sF);
end
% grafico da ultima iteracao
v=grafico(s0);



function v=grafico(s0)
    teta=pi*72/180;
    Mrot=[cos(teta), -sin(teta);
    sin(teta),cos(teta)];
    aresta=[1;0];n=length(s0);
    v=[0;0]; %inicializa vertices;
    % interpreta a string para gerar pontos;
    for i=1:n
        if s0(i)=='F'
        novoponto=[v(1,end);v(2,end)]+aresta;
        v=[v, novoponto];
        elseif s0(i)=='+' %roda pi/3
        aresta=Mrot*aresta;
        elseif s0(i)=='-' %roda -pi/3
        aresta=transpose(Mrot )*aresta;
        end
    end
    % faz gráfico;
    plot(v(1,:),v(2,:),'k-')
    axis equal; drawnow; pause(1)
end


function s=substituicao(s0,sF)
    n=length(s0); %tamanho da string;
    s=[];
    for i=1:n
        if(s0(i) =='F')
        s=[s sF];
        else
        s=[s s0(i)];
        end
    end
end