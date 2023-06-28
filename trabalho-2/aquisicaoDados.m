mv = VideoReader('video1.mp4'); %ler o video para mv
np = 2;

opt = menu('Aquisição de dados','Lean-back spin','Camel spin','Sit spin','I-spin');
if opt == 1
    n = 5;
    ti=3.3367;
    tf= 10.1674;
    [x,y] = aquisicaoPontos(ti,tf,n,np,mv);
    
    save('dados1.mat','n','np','ti','tf','x','y');
    
elseif opt ==2
    ti=11.0015;
    tf=14;
    n = 3;
    [x,y] = aquisicaoPontos(ti,tf,n,np,mv);
    
    save('dados2.mat','n','np','ti','tf','x','y');
    
elseif opt == 3
    ti=15.001;
    tf=17.0031;
    n = 5;
    [x,y] = aquisicaoPontos(ti,tf,n,np,mv);
    
    save('dados3.mat','n','np','ti','tf','x','y');
    
else
    ti=19.3387;
    tf=23.3428;
    n = 3;
    [x,y] = aquisicaoPontos(ti,tf,n,np,mv);
    
    save('dados4.mat','n','np','ti','tf','x','y');
end