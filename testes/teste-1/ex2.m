%a)
comp = 10;

x = 0:comp;
y = zeros(1,11);

V1 = [x;y]
%b)
V2 = [x+0.5;0.5*ones(1,11)]

%c)
count_v1=1;
count_v2=1;
Z=[0;0];
for i = 1:length(V1)+length(V2)
    if rem(i,2) == 0
        Z(:,i) = V2(:,count_v2);
        count_v2 = count_v2 +1;
    else
        Z(:,i) = V1(:,count_v1);
        count_v1 = count_v1 +1;
    end
end
Z


%% d)
for i = 1:length(Z)
    hold on
    plot(Z(1,:),Z(2,:),'-o')
    axis equal
end
plot(Z(1,length(Z)),Z(2,length(Z)),'-o','MarkerSize',100)
hold off


%% e)
a=2;
T=10;
dt=0.5;

for t = 0:60
    hold off
    dx=1+(a/comp)*cos (2*pi*t/T);
    Z=Z.*dx;
    dx=1+(a/comp)*cos(2*pi*t/T);
    
    plot(Z(1,1:length(Z)),Z(2,1:length(Z)),'-o')
    hold on
    plot(Z(1,length(Z)),Z(2,length(Z)),'-o','MarkerSize',100)
    axis([0 comp+2*a -1 1])
    hold off
    pause(dt)
end
