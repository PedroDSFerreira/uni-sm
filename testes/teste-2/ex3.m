% a)
x = 0:2:20;
y = [500,495,480,455,420,375,320,255,180,95,0];
dt = 0.1;
xpol = 0:dt:20;
ypol = interp1(x,y,xpol,'cubic');
plot(xpol,ypol)
hold on
plot(x,y,'x')

% b)

y2(1)=0;y2(length(xpol)) = 0;

for i = 2:length(xpol)-1
    y2(i) = (xpol(i+1)-2*xpol(i)+xpol(i-1))/dt^2;
end
figure(2)
plot(xpol,y2)
axis([0,20,-4*10e-14,4*10e-14])