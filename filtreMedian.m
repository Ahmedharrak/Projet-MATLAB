function resultat=filtreMedian(a)
l=size(a,1);
c=size(a,2);
f=a;

for i=2:l-1
    for j=2:c-1
        v=[a(i-1,j-1),a(i,j-1),a(i+1,j-1),a(i-1,j),a(i,j),a(i+1,j),a(i-1,j+1),a(i,j+1),a(i+1,j+1)];
        v=sort(v);
        f(i,j)=v(5);
    end
end
resultat=f;
end
