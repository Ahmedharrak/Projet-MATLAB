function res=rotation(A,angle)

[nbLigne,nbColonne,c]=size(A); 
D=ceil(sqrt(nbLigne^2+nbColonne^2));
res=uint8(zeros(D,D)); % uint8=stocker int non-signées codées sur 8bits 

     for i=1:D
       for j=1:D
           for k=1:3
           x=round((nbLigne/2)+(i-D/2)*cos(angle) - (j-D/2)*sin(angle));
            y=round((nbColonne/2)+(j-D/2)*cos(angle) + (i-D/2)*sin(angle));
           if ( x>0 && x<=nbLigne && y>0  && y<=nbColonne )
               res(i,j,k) = A(x,y,k);
           else
               res(i,j,k)=0;
           end
           end
       end
     end

end
