clear all 
close all
% dx/dt = F(t,x) =-a (x^4-b^4)
a=2.2067e-12; b=(81e8)^(1/4);
%RK 4a ordem
h=120; npassos=4;
 t=zeros(1,npassos+1); x=t; xexato=t;
 x(1)=1200; xexato1(1)=x(1);
for n=2:npassos+1
    k1=h*F(t(n-1),x(n-1),a,b);
    k2=h*F(t(n-1)+h/2,x(n-1)+k1/2,a,b);
    k3=h*F(t(n-1)+h/2,x(n-1)+k2/2,a,b);
    k4=h*F(t(n-1)+h,x(n-1)+k3,a,b);
    x(n)=x(n-1)+(1/6)*(k1+2*k2+2*k3+k4);
    t(n)=t(n-1)+h;
    xexato1(n)=sol_exata(t(n),a,b,1200);
    fprintf(1, 't=%f x(t)=%f xexato(n)=%f \n',t(n),x(n),xexato1(n));

end
te=0:0.1:480;
xexato=1200:-1:600;
c=-1/(4*b^3)*log((xexato(1)+b)/(xexato(1)-b))-1/(2*b^3)*atan(xexato(1)/b);
te=-(1/a)*(-1/(4*b^3)*log((xexato+b)./(xexato-b))-1/(2*b^3)*atan(xexato/b)-c);

plot(t,x,'x',te,xexato,'r-',t,xexato1,'rs')
axis([0,500,500,1200])
xlabel('t'); ylabel('theta');

 
function f=F(t,x, a , b)
f=-a*(x^4-b^4);
end

function x=sol_exata(t,a,b,x0)
prec=0.0000001;
dx=50;
c=-1/(4*b^3)*log((x0+b)/(x0-b))-1/(2*b^3)*atan(x0/b);
[x1,x2]=pesquisa_grosseira(x0,t, a,b,c,dx);
x=bissecao(x1,x2,t, a,b,c,prec);
end

function [x1, x2]=pesquisa_grosseira(x0,t, a,b,c,dx)
 f=  -1/(4*b^3)*log((x0+b)/(x0-b))-1/(2*b^3)*atan(x0/b)-c+a*t;
 x=x0;
 while f>0
     x=x-dx;
     f=  -1/(4*b^3)*log((x+b)/(x-b))-1/(2*b^3)*atan(x/b)-c+a*t;
 end

x1=x;
x2=x+dx;
end

function x=bissecao(x1,x2,t, a,b,c,prec)
 x=(x1+x2)/2; 
f1=  -1/(4*b^3)*log((x1+b)/(x1-b))-1/(2*b^3)*atan(x1/b)-c+a*t;
f2=  -1/(4*b^3)*log((x2+b)/(x2-b))-1/(2*b^3)*atan(x2/b)-c+a*t;
 f=  -1/(4*b^3)*log((x+b)/(x-b))-1/(2*b^3)*atan(x/b)-c+a*t ;
 while abs(x2-x1)/x> prec
 
     if f*f1 >0
         x1=x; f1=f;
     else
         x2=x; f2=f;
     end
     x=(x1+x2)/2;
     f=  -1/(4*b^3)*log((x+b)/(x-b))-1/(2*b^3)*atan(x/b)-c+a*t ;
 end

end
