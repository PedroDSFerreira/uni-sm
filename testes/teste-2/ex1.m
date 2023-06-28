% b)
figure(1)
R = 10;
x0 = 30;
m = 0.1;
b = -3;
y = -50:50;
plot(disthf(y,m,b,R,x0),y)
grid on

% c)
figure(2)
xr = (y-b)./m;
xc = x0+exp(-y.^2/R^2);
plot(xr,y)
hold on
plot(xc,y)
axis equal
axis([0,35,-20,25])


% a)
function dx=disthf(y, m, b, R, x0)
xr = (y-b)./m;
xc = x0+exp(-y.^2/R^2);

dx = xr-xc;
end


