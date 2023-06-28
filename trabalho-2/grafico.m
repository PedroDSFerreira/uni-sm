function grafico (t,tint,yint,tmaxmin,ymaxmin,angleOrSize,label)
    plot(t,angleOrSize,'ok')
    axis square
    hold on
    plot(tint,yint,'-b')
    plot(tmaxmin,ymaxmin,'xr')
    legend('Dados','Interpolação','Máximos/Mínimos');
    xlabel('Tempo(s)')
    ylabel(label)
end