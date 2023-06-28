function a = f(x)
a = -0.2+2*x-8*x^3;
end

function [x,t]=v_verlet(x0,v0)
tm = 30;
dt = 0.01;
x(1) = 0;
v(1) = 0;
m = 3;
for k = 1:dt:tm
    
    x(1+k) = x(i)+dt*v(i)+(dt^2*f(x(i),t))/2*m;
    %incompleto
end
end