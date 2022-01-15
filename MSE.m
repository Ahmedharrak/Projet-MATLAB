function m=MSE(A1,A2)

[nbLigne,nbColonne]=size(A1);
s=0;
for i=1:nbLigne
    for j=1:nbColonne
       s=s+double((A1(i,j)-A2(i,j))^2);
    end
end

m=s/(nbLigne*nbColonne);

end