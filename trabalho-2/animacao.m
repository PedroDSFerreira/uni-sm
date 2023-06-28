function animacao (x,y,ti,tf,n,mv) 
    dtframes=n/mv.FrameRate; i=0; t=ti;
    while (t <= tf)
        figure(2)
        mv.CurrentTime=t; mov=readFrame(mv); image(mov);
        t=t+dtframes; i=i+1;
        hold on
        plot(x(i,:),y(i,:),'-y')
        hold off
    end

end