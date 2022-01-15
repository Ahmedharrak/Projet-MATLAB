function resultat=robert(a)
robert1=[0,0,0;0,1,0;0,0,-1];
robert2=[0,0,0;0,0,1;0,-1,0];
r1=abs(filtres(a,robert1));
r2=abs(filtres(a,robert2));
r=r1+r2;
resultat=r;
end