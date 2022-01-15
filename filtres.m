function resultat=filtres(b,k)
nL=size(b,1);
nC=size(b,2);
k=double(k);
s=sum(sum(k));
if s==0
    s=1;
end
f=b;
initial=ceil(size(k,1)/2);

for i=initial:nL-initial+1
    for j=initial:nC-initial+1
       s_matrice=b(i-initial+1:i+initial-1,j-initial+1:j+initial-1);
       s_matrice=double(s_matrice);
       multiplication=s_matrice.*k;
       f(i,j)=(sum(sum(multiplication)))/s;
    end
end
resultat=f;
end