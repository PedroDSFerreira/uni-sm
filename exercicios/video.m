mv=VideoReader('slow motion back flip.wmv'); %ler o video para mv
mov=readFrame(mv); %ler o primeiro frame

ti=26; tf=35; % fixar os instantes iniciais e finais de interesse

framei=ti*mv.FrameRate; framef=tf*mv.FrameRate; %frames iniciais e finais

mv.CurrentTime=ti; % salta para tempo ti
n=10; % ler frames de n em n
dtframes=n/mv.FrameRate; % tempo entre frames a ler
nf=(framef-framei)/n; % numero de frames a ler

opt = menu('Escolher opção','Carregar dados guardados','Gerar novos dados');

if opt == 2
    for i=1:nf+1
        mov=readFrame(mv); image(mov); %representa imagem
        mv.CurrentTime=mv.CurrentTime+dtframes; % posiciona no frame a ler
        %ler pontos do centro de massa do rapaz em cada frame
        title(strcat('Frame ',num2str(i),' Ponto ',num2str(i)));
        [xcm(i), ycm(i)]=ginput(1);
    end

    save('Dados.mat','xcm','ycm')
    dados = [xcm;ycm]';
    %save('dados_PL9_PedroFerreira.txt','dados','-ascii')

else
    load('Dados.mat', '-mat')
end

px2m = (275-60)/1.75;
Ycm = ycm/px2m;
t = ti:dtframes:tf-dtframes;
figure(2)
plot(t,Ycm,'ok')

p = polyfit(t(t>27),Ycm(t>27),2);
pt = polyval(p,t);
hold on
plot(t,pt,'--r')
g_aparente = 2*p(1);
title(['g(aparente): ', num2str(g_aparente)])
razao = sqrt(9.81/g_aparente);
mv.CurrentTime=ti;

for i=ti:tf
    figure(3)
    mov=readFrame(mv); image(mov);
    mv.CurrentTime=mv.CurrentTime+mv.FrameRate*razao;
    
end