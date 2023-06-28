close all
clear all
clc
 a = [1,1];
 b = [1,-1];
 c = [2,-5];
 a1 = [1,1,0];
 b1 = [1,-1,0];

%quiver(xinicial,yinicial,vx,vy,0,'b')

%% tarefa 2 i):
    quiver(0,0,a(1),a(2),0,'b')
    hold on
    quiver(0,0,b(1),b(2),0,'b')
    xlim([-2,2])
    ylim([-2,2])
    dot(a,b) %produto interno

%% tarefa 2 ii):

     in = cross(a1,b1) %produto externo
     quiver3(0,0,0,in(1),in(2),in(3),0,'b')
     norm(in)
     norm(a1)*norm(b1)

     
%% tarefa 3:
     mtx = [a;b];
     cl = c * mtx
     quiver(0,0,cl(1),cl(2),0,'k')
      

% tarefa 4 (2018/19):
  %% Movimento I
     A=2;
     x=0:0.1:24;   %vetor linha
     lambda = 2
     while lambda < 6        
         y=A.*cos(2*pi*x/lambda);
        plot(x,y,'linewidth',3);
        lambda = lambda + 0.1;
        pause(0.3)
     end

     while lambda > 2
        y=A.*cos(2*pi*x/lambda);
        plot(x,y,'linewidth',3);
        lambda = lambda - 0.1;
        pause(0.3)
     end


%%   Movimento II // Tarefa 5(2019/20)

           a = 0:pi/100:2*pi;  
           x = 2 * cos(a) + 1; %centro(1,0)
           y = 2 * sin(a);      
while 1
           for a1 = 0:pi/100:2*pi
               plot(x,y,'--')
               axis([-1.5 3.5 -2.5 3])
               hold on
               cx = 2 * cos(a1)+1 ; 
               cy = 2 * sin(a1) ;
               x1 = 0.5 * cos(a) + cx;
               y1 = 0.5 * sin(a) + cy;
               fill(x1,y1,'c')
               quiver(cx,cy,-cos(a1),-sin(a1),0,'b')
               quiver(cx,cy,-sin(a1),cos(a1),0,'k')
               hold off
               pause(0.3)
               
              
           end
end




%% tarefa 4(2019/20):
close all
x=0:0.1:24;
A=2; lambda=4; v=1;
dt=0.1; tmax=10;

for t=0:dt: tmax
    hold off
    y1=A*sin(2*pi*(x-v*t)/lambda);
    plot(x,y1,'b','linewidth',3)
    axis([0,24,-4,4])
    xlabel('x'); ylabel('y')
    hold on
    y2=A*sin(2*pi*(x+v*t)/lambda);
    plot(x,y2,'b','linewidth',3)
    axis([0,24,-4,4])
    xlabel('x'); ylabel('y')
    pause(0.2)
end




%% tarefa 5:
r = 0.5;           %raio circunferência
p = [0,0];         %coordenadas centro
v = [0.1,0.1];     %vetor velocidade

while p(1)>=0
        %desenhar a bola
        a = 0:pi/100:2*pi;
        p = p + v
        x = r*cos(a)+p(1);  %abcissa bola
        y = r*sin(a)+p(2);  %ordenada bola
        plot(x,y)
        grid on
        xlim([-2 6])
        ylim([-2 6])
        pause(0.1)
        if p(1)>5
            v=-v;
        end
        
end   
