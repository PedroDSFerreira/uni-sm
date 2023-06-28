% b)
for c = 1:9
    x0_bissecao(c)
    plot(c,x0_bissecao(c),'o')
    hold on
end
% a)

function y = f(x,c)
y =10*x+90*(1-exp(-x))-c.^2;
end

function x0=x0_bissecao(c)
x_k1 = 10;
x_k = 0;
dx = x_k1 - x_k;
criterio = 10e-7;
while abs(dx) > criterio
    if (f(x_k+x_k1,c)/2)*f(x_k,c)>0
        x_k = (x_k+x_k1)/2;
    else
        x_k1 = (x_k+x_k1)/2;
    end
    dx = x_k1 - x_k;
end
x0 = (x_k+x_k1)/2;
end