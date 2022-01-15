function resultat=histogramme(c)
ligne=size(c,1);
colonne=size(c,2);

for i=1:256
     r(i)=0;
end

for i=1:ligne
     for j=1:colonne
     r(c(i,j)+1)=r(c(i,j)+1)+1;
     end
end

resultat=r;
end