clear all
close all

x = 1:19;
y = f(x);
% Interpolação
plot(x,y,'.k',"MarkerSize", 20)

xpol = linspace(-5,30,100);

ypol = interp1(x,y,xpol,'linear');
ypol1 = interp1(x,y,xpol,'cubic');
ypol2 = interp1(x,y,xpol,'spline');
hold on

%linear
plot(xpol,ypol,'ob')

%cubic
plot(xpol,ypol1,'og')

%spline
plot(xpol,ypol2,'oc')

%real
plot(xpol, f(xpol), '.r')

legend("real","linear","cubic","spline","esperado");

% Regressão

figure(2)
plot(x,y,'.k',"MarkerSize", 20)
hold on
a = polyfit(x,y,10);
plot(xpol,f(xpol),'.r')
px = polyval(a,xpol);
plot(xpol,px,'--b')

function y = f(x)
lambda = 5;
y = exp(x/lambda);
end
