b=linspace(0,2*pi,100);
a = cos(b);

%a)
[a_dec,ordem]=sort(a,'descend');
for i = 1:length(a)
    a_dec(i) = a(ordem(i));
    %a_dec1(i) = max(a(i,:))
    
    
end
a_dec

%b)
b_ord = acos(a_dec)
