clear all
mv=VideoReader('video1.mp4');

%% figura 1
close all
load('dados1.mat');
theta=atan2(y(:,2)-y(:,1),x(:,2)-x(:,1));
theta=unwrap(theta);
t=transpose(linspace(ti,tf,length(x(:,1))));
tint=linspace(t(1),t(end),length(t)*2*n);
yint = interp1(t,theta,tint,'cubic');

[tmaxmin, ymaxmin]=maxmin(tint,yint);
figure(1)
grafico(t,tint,yint,tmaxmin,ymaxmin,theta,'Ângulo(rad)')

animacao(x,y,ti,tf,n,mv)


%% figura 2
close all
load('dados2.mat');
dx=x(:,1)-x(:,2);
t=transpose(linspace(ti,tf,length(x(:,1))));
tint=linspace(t(1),t(end),length(t)*2*n);
yint = interp1(t,dx,tint,'cubic');

[tmaxmin, ymaxmin]=maxmin(tint,yint);
figure(1)
grafico(t,tint,yint,tmaxmin,ymaxmin,dx,'Comprimento(pixels)')
animacao(x,y,ti,tf,n,mv)

%% figura 3
close all
load('dados3.mat');
theta=atan2(y(:,2)-y(:,1),x(:,2)-x(:,1));
theta=unwrap(theta);
t=transpose(linspace(ti,tf,length(x(:,1))));
tint=linspace(t(1),t(end),length(t)*2*n);
yint = interp1(t,theta,tint,'cubic');

[tmaxmin, ymaxmin]=maxmin(tint,yint);
figure(1)
grafico(t,tint,yint,tmaxmin,ymaxmin,theta,'Ângulo(rad)')
animacao(x,y,ti,tf,n,mv)

%% figura 4
close all
load('dados4.mat');
theta=atan2(y(:,2)-y(:,1),x(:,2)-x(:,1));
theta=unwrap(theta);
t=transpose(linspace(ti,tf,length(x(:,1))));
tint=linspace(t(1),t(end),length(t)*2*n);
yint = interp1(t,theta,tint,'cubic');

[tmaxmin, ymaxmin]=maxmin(tint,yint);
figure(1)
grafico(t,tint,yint,tmaxmin,ymaxmin,theta,'Ângulo(rad)')
animacao(x,y,ti,tf,n,mv)