function resultat=seuillage(a,sl)
l=size(a,1);
c=size(a,2);
d=a;
for i=1:l
    for j=1:c
        if a(i,j)>sl
            d(i,j)=255;
        else
            d(i,j)=0;
        end
    end
end
resultat=d;
end