function animacao(r,v,a,b,R,dt,deltat)
    v = v * dt;
    
    % matriz com coordenadas dos vértices do retângulo
    M_rectangle = [0 0;a 0;a b;0 b;0 0];
        
    % ciclo for que vai de 0 a deltat com um salto de dt
    for t = 0:dt:deltat  
        
        % cria o retângulo de comprimento "a" e altura "b"
        plot(M_rectangle(:,1), M_rectangle(:,2))  
        axis([-1 a+1 -1 b+1])
        xlabel('x') 
        ylabel('y') 
        
        hold on
        plot(r(1,:),r(2,:),'.','MarkerSize',28*R)
        hold off
        
        for i = 1:size(r,2)
            
            r(:,i) = r(:,i)+v(:,i);
            
            % colisão com a parede x = a ou colisão com a parede x = 0, respetivamente
            if r(1,i) > a-R || r(1,i) < R  
                r(:,i) = r(:,i)-v(:,i);
                v(1,i) = -v(1,i);
                r(:,i) = r(:,i)+v(:,i);
            end
            
            % colisão com a parede y = b ou colisão com a parede y = 0, respetivamente
            if r(2,i) > b-R || r(2,i) < R  
                r(:,i) = r(:,i)-v(:,i);
                v(2,i) = -v(2,i);
                r(:,i) = r(:,i)+v(:,i);
            end 
        end
        pause(dt)
    end      
end