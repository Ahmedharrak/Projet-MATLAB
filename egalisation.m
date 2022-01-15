function resultat=egalisation(a)
v=histogrammeCumule(histogramme(a));
b=a;
l=size(a,1);
c=size(a,2);
n=l*c;
for i=1:l
    for j=1:c
        b(i,j)=v(a(i,j)+1)*255/n;
    end
end
resultat=b;
end