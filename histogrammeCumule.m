function resultat = histogrammeCumule(a)
b(1)=a(1);
for i=2:256
b(i)=a(i)+b(i-1);  
end
resultat=b;
end

