N=5000;
x(1)= rand(1);
R=0:0.01:2;

for i = 1:N
    
    x(i+1)=R*min(x(i),1-x(i));
    plot(i,x(i+1),'.')
    hold on
end

