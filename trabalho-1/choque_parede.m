function [particula, delta_t, parede] = choque_parede(r,v,R,a,b)
    
    %matriz que vai armazenar 4 intervalos de tempo de colisão com cada 
    %parede, para cada partícula
    deltat_parede2 = zeros(1,length(r)*4);
    
    for m=1:length(r)
        deltat_parede(:,m) =  [(R-r(1,m))/v(1,m) (a-R-r(1,m))/v(1,m) (R-r(2,m))/v(2,m) (b-R-r(2,m))/v(2,m)];
        deltat_parede2(1,m*4-3:m*4) = (deltat_parede(:,m))';
    end
    
    deltat_parede2(deltat_parede2<=4*eps)=1000;
    
    [delta_t,posicao] = min(deltat_parede2);
    particula = floor((posicao-1)/4)+1;
    parede = rem((posicao-1), 4)+1;
    

end