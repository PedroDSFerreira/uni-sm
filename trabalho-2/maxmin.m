function [tmaxmin, ymaxmin, f, sf] = maxmin(tint,yint)
    ic=0;
    for i=1:numel(tint)-2
        if (yint(i) < yint(i+1) && yint(i+1)> yint(i+2)) || ...
            (yint(i) > yint(i+1) && yint(i+1)< yint(i+2))
            ic=ic+1;
            tmaxmin(ic)=tint(i+1);
            ymaxmin(ic)=yint(i+1);
        end
    end
    T=2*mean(diff(tmaxmin)); sT=std(2*diff(tmaxmin))/sqrt(numel(tmaxmin)-1);
    f=60/T; sf=60*sT/T^2;
end
