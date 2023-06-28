base3(12010212120)
base3(12021012)

function rep = base3(inteiro)

    number = num2str(inteiro);
    rep = 0;
    for i = length(number):-1:1
        rep = rep + str2num(number(i))*3^(i-1);
    end
    rep = num2str(rep);
end

