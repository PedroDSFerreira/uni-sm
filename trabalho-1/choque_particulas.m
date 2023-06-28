function [particula1, particula2, delta_t] = choque_particulas(r, v, R)
    
    deltatt = 10^3*ones(length(r),length(r));
    for i=1:length(r)-1
         for j=i+1:length(r)
             rij=r(:,i)-r(:,j); 
             vij=v(:,i)-v(:,j);
             A = norm(vij)^2;
             B = 2*dot(rij,vij);
             C = norm(rij)^2 - 4*R^2;

             if B < -4*eps && B^2-4*A*C > 4*eps
                deltatt(i,j) = (-B-sqrt(B^2-4*A*C))/(2*A);
             end
         end
    end
    [coluna,j_linha]=min(deltatt,[],2);
    [delta_t, i_linha]=min(coluna); 
    particula1 = i_linha;
    particula2 = j_linha(i_linha);
    
end