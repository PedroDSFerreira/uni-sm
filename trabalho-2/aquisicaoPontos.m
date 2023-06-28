function [x, y] = aquisicaoPontos (ti,tf,n,np,mv)
    dtframes=n/mv.FrameRate; i=0; t=ti;
    while (t <= tf)
        mv.CurrentTime=t; mov=readFrame(mv); image(mov);
        t=t+dtframes; i=i+1;
        for ip=1:np
            title(strcat('Frame ',num2str(i),' Ponto ',num2str(ip) ));
            [x(i,ip) ,y(i,ip)]=ginput(1);
        end
    end
end