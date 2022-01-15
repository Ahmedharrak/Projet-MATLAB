function resultat=perwitt(a)
perwitt1=[-1,0,1;-1,0,1;-1,0,1];
perwitt2=[-1,-1,-1;0,0,0;1,1,1];
r1=abs(filtres(a,perwitt1));
r2=abs(filtres(a,perwitt2));
r=r1+r2;
resultat=r;
end