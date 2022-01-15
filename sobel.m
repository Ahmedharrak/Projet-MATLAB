function resultat=sobel(a)
sobel1=[-1,0,1;-2,0,2;-1,0,1];
sobel2=[-1,-2,-1;0,0,0;1,2,1];
sobel3=[0,1,2;-1,0,1;-2,-1,0];
r1=abs(filtres(a,sobel1));
r2=abs(filtres(a,sobel2));
r3=abs(filtres(a,sobel3));
r=r1+r2+r3;
resultat=r;
end